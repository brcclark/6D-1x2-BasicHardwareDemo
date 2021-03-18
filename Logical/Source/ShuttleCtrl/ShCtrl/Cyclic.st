
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
				shFbs[i].ReadCyclicPos.Controller := ADR(gMcAcp6DController);
				shFbs[i].ReadCyclicPos.ChannelID := i + 1;
				shFbs[i].ReadCyclicPos.AxisID := 1;
				shFbs[i].ReadCyclicPos.Enable := TRUE;
				
				shState[i] := SH_STARTUP;
			SH_STARTUP:  //******************************************************************************** Shuttle is in the startup state
				//In this state maybe we have triggered recovery and we're waiting for the autodrive to complete
				IF shFbs[i].ReadCyclicPos.Valid THEN
					shState[i] := SH_IDLE;
				END_IF
			SH_IDLE:  //******************************************************************************** Shuttle is in the idle state
				IF gShuttleIf[i].Cmd.NextStep THEN 
					gShuttleIf[i].Cmd.NextStep := FALSE;
					//Evaluate the current step to determine what the next step should be
					shFbs[i].ShRunMacroFb.Controller := ADR(gMcAcp6DController);
					shFbs[i].ShRunMacroFb.ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
					shFbs[i].ShRunMacroFb.MacroID := UDINT_TO_USINT(gShuttleIf[i].Par.MacroIDs.RobotProcessMacro);
					shFbs[i].ShRunMacroFb.Execute := TRUE;
					gShuttleIf[i].Status.CurrentDestination := DEST_LOAD;
					LogDebug(gAuditTrail,i,"Sent to Robot");
									
					shState[i] := SH_MOVE_TO_ROBOT;
				END_IF
			SH_MOVE_TO_ROBOT:  //******************************************************************************** Shuttle is moving to the load position
				IF shFbs[i].ShRunMacroFb.Error THEN
					gShuttleIf[i].Status.Error := TRUE;
					gShuttleIf[i].Status.ErrorState := shState[i];
					shState[i] := SH_ERROR;
				ELSIF shFbs[i].ShRunMacroFb.Acknowledge AND gShuttleIf[i].Status.ShuttleInfo.Position.Value.Y <= 0.0601 THEN //Check to see if the shuttle is ready to sync with the robot
					gLoadStationIf.Par.ShuttleIdx := i;
					gLoadStationIf.Cmd.Process := TRUE;
				
					LogDebug(gAuditTrail,i,"Arrived at Robot");
					
					shFbs[i].ShRunMacroFb.Execute := FALSE;
					shState[i] := SH_ROBOT;
				END_IF
			SH_ROBOT:  //******************************************************************************** Shuttle is currently being loaded
				//Station has control on the shuttle during this section
				IF gShuttleIf[i].Cmd.NextStep THEN
					gLoadStationIf.Cmd.Process := FALSE; //Respond to the Load station we're done
				
					gShuttleIf[i].Cmd.NextStep := FALSE;
					gShuttleIf[i].Status.CurrentDestination := DEST_PRINT;
				
					LogDebug(gAuditTrail,i,"Finished with Robot");
					
					shState[i] := SH_MOVE_TO_ROBOT;
				END_IF
		
			SH_ERROR: //******************************************************************************** Shuttle is in the error state
		
		END_CASE;
		shFbs[i].ShRunMacroFb();
		shFbs[i].ReadCyclicPos();
		IF gShuttleIf[i].Cmd.ResetProductInfo THEN
			gShuttleIf[i].Status.Error := FALSE;
			gShuttleIf[i].Status.ErrorState := 0;
			gShuttleIf[i].Cmd.ResetProductInfo := FALSE;
		END_IF
	END_FOR;
	pDebugIf ACCESS ADR(gShuttleIf[debugIdx]);
	pDebugState ACCESS ADR(shState[debugIdx]);
	pDebugFbs ACCESS ADR(shFbs[debugIdx]);
	
END_PROGRAM
