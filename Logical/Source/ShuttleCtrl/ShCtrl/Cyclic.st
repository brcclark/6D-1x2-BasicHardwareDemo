
PROGRAM _CYCLIC
	FOR i:= 0 TO gMainIf.Cfg.ShuttleCount - 1 DO
	
		CASE shState[i] OF
			SH_OFF:  //******************************************************************************** Shuttle is in the off/idle state
				IF gShuttleIf[i].Cmd.Enable THEN
					shState[i] := SH_INIT;
				ELSE
				
				END_IF
			SH_INIT:  //******************************************************************************** Shuttle is in the initilization state
				//In this state we could make any checks on the current shuttle process perhaps in order to aide in recovery?
				shFbs[i].ReadCyclicPosX.Controller := ADR(gMcAcp6DController);
				shFbs[i].ReadCyclicPosX.ChannelID := i + 1;
				shFbs[i].ReadCyclicPosX.AxisID := 1;
				shFbs[i].ReadCyclicPosX.Enable := TRUE;
				
				shFbs[i].ReadCyclicPosY.Controller := ADR(gMcAcp6DController);
				shFbs[i].ReadCyclicPosY.ChannelID := i + 1;
				shFbs[i].ReadCyclicPosY.AxisID := 2;
				shFbs[i].ReadCyclicPosY.Enable := TRUE;
				
//				shFbs[i].MovingAvgFb.WindowLength := 5000;
//				shFbs[i].MovingAvgFb.Enable := TRUE;
//				shFbs[i].WeightAvgFb.WindowLength := 5000;
				
				shState[i] := SH_STARTUP;
			SH_STARTUP:  //******************************************************************************** Shuttle is in the startup state
				//In this state maybe we have triggered recovery and we're waiting for the autodrive to complete
				IF shFbs[i].ReadCyclicPosX.Valid AND shFbs[i].ReadCyclicPosY.Valid THEN
					shState[i] := SH_IDLE;
				END_IF
			SH_IDLE:  //******************************************************************************** Shuttle is in the idle state
				IF gShuttleIf[i].Cmd.MovePlane THEN
					shFbs[i].MovePlane.Controller := ADR(gMcAcp6DController);
					shFbs[i].MovePlane.ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
					shFbs[i].MovePlane.PositionX := gShuttleIf[i].Par.X;
					shFbs[i].MovePlane.PositionY := gShuttleIf[i].Par.Y;
					shFbs[i].MovePlane.Velocity := gShuttleIf[i].Par.Vel;
					shFbs[i].MovePlane.EndVelocity := gShuttleIf[i].Par.EndVel;
					shFbs[i].MovePlane.Acceleration := gShuttleIf[i].Par.Accel;
					shFbs[i].MovePlane.Mode := mcACP6D_MOVE_ABSOLUTE;
					shFbs[i].MovePlane.Execute := TRUE;
					
					shState[i] := SH_MOVE_PLANE;
				ELSIF gShuttleIf[i].Cmd.MoveMacro THEN
					shFbs[i].ShRunMacroFb.Controller := ADR(gMcAcp6DController);
					shFbs[i].ShRunMacroFb.MacroID := UDINT_TO_USINT(gShuttleIf[i].Par.MacroIDs.RobotProcessMacro);
					shFbs[i].ShRunMacroFb.ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
					shFbs[i].ShRunMacroFb.Execute := TRUE;
					
					shState[i] := SH_MOVE_MACRO;
				ELSIF gShuttleIf[i].Cmd.Land THEN
					shFbs[i].LandCtrl.Controller := ADR(gMcAcp6DController);
					shFbs[i].LandCtrl.Level := 0;
					shFbs[i].LandCtrl.ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
					shFbs[i].LandCtrl.Execute := TRUE;
					
					shState[i] := SH_LANDING;
				END_IF
			SH_MOVE_PLANE:
				IF shFbs[i].MovePlane.Error THEN
					shState[i] := SH_ERROR;
				ELSIF shFbs[i].MovePlane.Done THEN
					gShuttleIf[i].Cmd.MovePlane := FALSE;
					shFbs[i].MovePlane.Execute := FALSE;
					
					shState[i] := SH_IDLE;
				ELSIF gShuttleIf[i].Cmd.Stop THEN
					gShuttleIf[i].Cmd.MovePlane := FALSE;
					shFbs[i].MovePlane.Execute := FALSE;
					shFbs[i].Stop.Controller := ADR(gMcAcp6DController);
					shFbs[i].Stop.ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
					shFbs[i].Stop.Execute := TRUE;
					shState[i] := SH_STOPPING;
				END_IF
			SH_MOVE_MACRO:
				IF shFbs[i].ShRunMacroFb.Error THEN
					shState[i] := SH_ERROR;
				ELSIF shFbs[i].ShRunMacroFb.Done OR gShuttleIf[i].Cmd.Stop THEN
					gShuttleIf[i].Cmd.MoveMacro := FALSE;
					shFbs[i].ShRunMacroFb.Execute := FALSE;
					shFbs[i].Stop.Controller := ADR(gMcAcp6DController);
					shFbs[i].Stop.ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
					shFbs[i].Stop.Execute := TRUE;
					shState[i] := SH_STOPPING;
				END_IF
			SH_STOPPING:
				IF shFbs[i].Stop.Error THEN
					shState[i] := SH_ERROR;
				ELSIF shFbs[i].Stop.Done THEN
					gShuttleIf[i].Cmd.Stop := FALSE;
					shFbs[i].Stop.Execute := FALSE;
					shState[i] := SH_IDLE;
				END_IF
			SH_LANDING:
				IF shFbs[i].LandCtrl.Done THEN
					shFbs[i].LandCtrl.Execute := FALSE;
					IF gShuttleIf[i].Cmd.Land THEN
						shState[i] := SH_LANDED;
					ELSE
						shState[i] := SH_IDLE;
					END_IF
				END_IF
				
			SH_LANDED:
//				IF NOT gShuttleIf[i].Cmd.Land THEN
//					shFbs[i].LandCtrl.Level := 1;
//					shFbs[i].LandCtrl.Execute := TRUE;
//					shState[i] := SH_LANDING;
//				ELSIF gShuttleIf[i].Cmd.Weigh THEN
//					shFbs[i].LandCtrl.Level := 1;
//					shFbs[i].LandCtrl.Execute := TRUE;
//					shFbs[i].WeightAvgFb.Enable := TRUE;
//					
//					shState[i] := SH_WEIGHING;
//				END_IF
			SH_WEIGHING:
				//Weigh process
				(*
				From landed
				On Cmd, start Levitate, start capturing force data into filter
				*)
				IF NOT gShuttleIf[i].Cmd.Weigh THEN
//					shFbs[i].WeightAvgFb.Enable := FALSE;
					shFbs[i].LandCtrl.Execute := FALSE;
					gShuttleIf[i].Cmd.Land := FALSE;
					shState[i] := SH_IDLE;
				END_IF
					
				
			SH_ERROR: //******************************************************************************** Shuttle is in the error state
		
		END_CASE;
		shFbs[i].ShRunMacroFb();
		shFbs[i].MovePlane();
		shFbs[i].LandCtrl();
		shFbs[i].Stop();
		shFbs[i].ReadCyclicPosX();
		shFbs[i].ReadCyclicPosY();
//		shFbs[i].MovingAvgFb();
//		shFbs[i].WeightAvgFb();
		
		IF shFbs[i].ReadCyclicPosX.Valid THEN
			gShuttleIf[i].Status.CyclicPositionX := shFbs[i].ReadCyclicPosX.Value;
		END_IF
		IF shFbs[i].ReadCyclicPosY.Valid THEN
			gShuttleIf[i].Status.CyclicPositionY := shFbs[i].ReadCyclicPosY.Value;
		END_IF
		
		IF gShuttleIf[i].Cmd.ResetProductInfo THEN
			gShuttleIf[i].Status.Error := FALSE;
			gShuttleIf[i].Status.ErrorState := 0;
			gShuttleIf[i].Cmd.ResetProductInfo := FALSE;
			gShuttleIf[i].Status.TareWeight := 0;
			gShuttleIf[i].Status.ProductWeight := 0;
		END_IF
		
//		IF ResetAvg THEN
//			shFbs[i].MovingAvgFb.Enable := FALSE;
//			IF NOT shFbs[i].MovingAvgFb.Active THEN
//				ResetAvg := FALSE;
//				shFbs[i].MovingAvgFb.Enable := TRUE;
//			END_IF
//		END_IF
//		shFbs[i].MovingAvgFb.In := gShuttleIf[i].Status.ShuttleInfo.Force.Value.Fz / 9.81 * 1000;
//		shFbs[i].WeightAvgFb.In := gShuttleIf[i].Status.ShuttleInfo.Force.Value.Fz / 9.81 * 1000 - gShuttleIf[i].Status.TareWeight + CalibrationValue;
//		gShuttleIf[i].Status.ProductWeight := shFbs[i].WeightAvgFb.Out;
//		IF gShuttleIf[i].Cmd.Tare THEN
//			gShuttleIf[i].Status.TareWeight := shFbs[i].MovingAvgFb.Out;
//			gShuttleIf[i].Cmd.Tare := FALSE;
//		END_IF
	END_FOR;
	pDebugIf ACCESS ADR(gShuttleIf[debugIdx]);
	pDebugState ACCESS ADR(shState[debugIdx]);
	pDebugFbs ACCESS ADR(shFbs[debugIdx]);
	
END_PROGRAM
