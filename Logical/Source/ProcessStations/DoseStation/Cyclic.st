
PROGRAM _CYCLIC
	CASE state OF
		DOSE_OFF: //********************************************************************************Dose station is currently disabled
			IF pDoseIf.Cmd.Enable THEN
				state := DOSE_INIT;
			END_IF
		DOSE_INIT: //********************************************************************************Dose station is initalizing
			pDoseIf.Status.ReadyForNewShuttle := TRUE;
			pDoseIf.Status.Enabled := TRUE;
			state := DOSE_WAIT_FOR_SHUTTLE;
		DOSE_WAIT_FOR_SHUTTLE: //********************************************************************************Dose station is waiting for a shuttle to be present
			IF NOT pDoseIf.Cmd.Enable THEN
				pDoseIf.Status.ReadyForNewShuttle := FALSE;
				pDoseIf.Status.Enabled := FALSE;
				state := DOSE_OFF;
			ELSIF pDoseIf.Par.ShuttleIdx <> STATION_IS_EMPTY AND pDoseIf.Cmd.Process THEN
				pDoseIf.Status.ReadyForNewShuttle := FALSE;
				pDoseIf.Status.Processing := TRUE;
				
				DoseStationFbs.DoseMoveFb.Controller := ADR(gMcAcp6DController);
				DoseStationFbs.DoseMoveFb.ShuttleID := gShuttleIf[pDoseIf.Par.ShuttleIdx].Cfg.ShuttleId;
				DoseStationFbs.DoseMoveFb.Mode := mcACP6D_MOVE_RELATIVE;
				DoseStationFbs.DoseMoveFb.Path := mcACP6D_PATH_DIRECT;
				DoseStationFbs.DoseMoveFb.Velocity := pDoseIf.Par.Vel;
				DoseStationFbs.DoseMoveFb.EndVelocity := pDoseIf.Par.EndVel;
				DoseStationFbs.DoseMoveFb.Acceleration := pDoseIf.Par.Accel;
				DoseStationFbs.DoseMoveFb.PositionX := (pDoseIf.Par.FirstCavityPosition.DistX);
				DoseStationFbs.DoseMoveFb.PositionY := -(pDoseIf.Par.FirstCavityPosition.DistY); //Made negative as we're moving in negative Z
				DoseStationFbs.DoseMoveFb.Execute := TRUE;
//				
//				msgType := "";
//				msgMsg := "";
//				tmp := STRING_TO_WSTRING(taskName);
//				brwcscat(ADR(msgType),ADR(tmp));
//				brwcscat(ADR(msgType),ADR(":FirstMove:Sh"));
//				tmp := USINT_TO_WSTRING(gShuttleIf[pDoseIf.Par.ShuttleIdx].Cfg.ShuttleId);
//				brwcscat(ADR(msgType),ADR(tmp));
//				tmp := "";
//				msgMsg := "X:";
//				tmp := REAL_TO_WSTRING(DoseStationFbs.DoseMoveFb.PositionX);
//				brwcscat(ADR(msgMsg),ADR(tmp));
//				brwcscat(ADR(msgMsg),ADR(" Y:"));
//				tmp := REAL_TO_WSTRING(DoseStationFbs.DoseMoveFb.PositionY);
//				brwcscat(ADR(msgMsg),ADR(tmp));
//				MpAuditCustomEvent(gAuditTrail,"DEBUG",msgType,msgMsg);
				
				state := DOSE_INDEX_SHUTTLE;
			END_IF
		DOSE_INDEX_SHUTTLE: //******************************************************************************** Dose station is indexing to the next dosing position
			IF DoseStationFbs.DoseMoveFb.Error THEN
				pDoseIf.Status.Error := TRUE;
				
				state := DOSE_ERROR;
			ELSIF DoseStationFbs.DoseMoveFb.Done THEN
				DoseStationFbs.DoseMoveFb.Execute:= FALSE;
				
				DoseStationFbs.WaitTimer.IN := TRUE;
				DoseStationFbs.WaitTimer.PT := pDoseIf.Par.WaitTime;
				
				state := DOSE_DOSING;
			END_IF
		DOSE_DOSING: //********************************************************************************Dose station is preforming the dosing process
			IF DoseStationFbs.WaitTimer.Q THEN
				DoseStationFbs.WaitTimer.IN := FALSE;
				
				currentRow := currentRow + 1;
				IF currentRow > pDoseIf.Par.NumRowsOfCavities THEN
					gShuttleIf[pDoseIf.Par.ShuttleIdx].Cmd.NextStep := TRUE;
					pDoseIf.Status.Done := TRUE;
					pDoseIf.Status.Processing := FALSE;
					
					state := DOSE_DONE;
				ELSE
					DoseStationFbs.DoseMoveFb.Controller := ADR(gMcAcp6DController);
					DoseStationFbs.DoseMoveFb.ShuttleID := gShuttleIf[pDoseIf.Par.ShuttleIdx].Cfg.ShuttleId;
					DoseStationFbs.DoseMoveFb.Mode := mcACP6D_MOVE_RELATIVE;
					DoseStationFbs.DoseMoveFb.Path := mcACP6D_PATH_DIRECT;
					DoseStationFbs.DoseMoveFb.Velocity := pDoseIf.Par.Vel;
					DoseStationFbs.DoseMoveFb.EndVelocity := pDoseIf.Par.EndVel;
					DoseStationFbs.DoseMoveFb.Acceleration := pDoseIf.Par.Accel;
					DoseStationFbs.DoseMoveFb.PositionX := (pDoseIf.Par.SpaceBetweenCavities.DistX); 
					DoseStationFbs.DoseMoveFb.PositionY := -(pDoseIf.Par.SpaceBetweenCavities.DistY); //Made negative as we're moving in negative Z
					DoseStationFbs.DoseMoveFb.Execute := TRUE;
					
					state := DOSE_INDEX_SHUTTLE;
				END_IF
			END_IF
		DOSE_DONE: //********************************************************************************Dose station is done with the load process
			IF NOT pDoseIf.Cmd.Enable THEN
				pDoseIf.Status.Enabled := FALSE;
				pDoseIf.Status.ReadyForNewShuttle := FALSE;
				currentRow := 0;
				
				state := DOSE_OFF;
			ELSIF NOT pDoseIf.Cmd.Process THEN
				pDoseIf.Status.Done := FALSE;
				currentRow := 0;
				
				pDoseIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				pDoseIf.Status.ReadyForNewShuttle := FALSE;
				pDoseIf.Status.ReadyForNewShuttle := TRUE;
				
				state := DOSE_WAIT_FOR_SHUTTLE;
			END_IF
		DOSE_ERROR: //********************************************************************************Dose station had an error
			IF pDoseIf.Cmd.Reset THEN
				pDoseIf.Cmd.Reset := FALSE;
				
				pDoseIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				
				currentRow := 0;
				
				pDoseIf.Status.Done := FALSE;
				pDoseIf.Status.Error := FALSE;
				pDoseIf.Status.Processing := FALSE;
				pDoseIf.Status.ReadyForNewShuttle := FALSE;
				pDoseIf.Status.Enabled := FALSE;
				
				DoseStationFbs.DoseMoveFb.Execute := FALSE;
				DoseStationFbs.WaitTimer.IN := FALSE;
				
				IF pDoseIf.Cmd.Enable THEN
					state := DOSE_INIT;
				ELSE
					state := DOSE_OFF;
				END_IF
			END_IF
	END_CASE;
		
	DoseStationFbs.DoseMoveFb();
	DoseStationFbs.WaitTimer();
END_PROGRAM
