
PROGRAM _CYCLIC
	CASE state OF
		TAMP_OFF: //********************************************************************************Tamp station is currently disabled
			IF gTampStationIf.Cmd.Enable THEN
				state := TAMP_INIT;
			END_IF
		TAMP_INIT: //********************************************************************************Tamp station is initalizing
			gTampStationIf.Status.ReadyForNewShuttle := TRUE;
			gTampStationIf.Status.Enabled := TRUE;
			state := TAMP_WAIT_FOR_SHUTTLE;
		TAMP_WAIT_FOR_SHUTTLE: //********************************************************************************Tamp station is waiting for a shuttle to be present
			IF NOT gTampStationIf.Cmd.Enable THEN
				gTampStationIf.Status.ReadyForNewShuttle := FALSE;
				gTampStationIf.Status.Enabled := FALSE;
				state := TAMP_OFF;
			ELSIF gTampStationIf.Par.ShuttleIdx <> STATION_IS_EMPTY AND gTampStationIf.Cmd.Process THEN
				gTampStationIf.Status.ReadyForNewShuttle := FALSE;
				gTampStationIf.Status.Processing := TRUE;
				
				TampStationFbs.TampMoveFb.Controller := ADR(gMcAcp6DController);
				TampStationFbs.TampMoveFb.ShuttleID := gShuttleIf[gTampStationIf.Par.ShuttleIdx].Cfg.ShuttleId;
				TampStationFbs.TampMoveFb.Mode := mcACP6D_MOVE_RELATIVE;
				TampStationFbs.TampMoveFb.Path := mcACP6D_PATH_DIRECT;
				TampStationFbs.TampMoveFb.Velocity := gTampStationIf.Par.Vel;
				TampStationFbs.TampMoveFb.EndVelocity := gTampStationIf.Par.EndVel;
				TampStationFbs.TampMoveFb.Acceleration := gTampStationIf.Par.Accel;
				TampStationFbs.TampMoveFb.PositionX := gTampStationIf.Par.EntranceMovement.DistX;
				TampStationFbs.TampMoveFb.PositionY := gTampStationIf.Par.EntranceMovement.DistY;
				TampStationFbs.TampMoveFb.Execute := TRUE;
				
				state := TAMP_ENTER_STATION;
			END_IF
		TAMP_ENTER_STATION: //******************************************************************************** Tamp station is sending the shuttle to the tamp position
			IF TampStationFbs.TampMoveFb.Error THEN
				gTampStationIf.Status.Error := TRUE;
				
				state := TAMP_ERROR;
			ELSIF TampStationFbs.TampMoveFb.Done THEN
				TampStationFbs.TampMoveFb.Execute:= FALSE;
				
				TampStationFbs.ShortAxisFb.Controller := ADR(gMcAcp6DController);
				TampStationFbs.ShortAxisFb.ShuttleID := gShuttleIf[gTampStationIf.Par.ShuttleIdx].Cfg.ShuttleId;
				TampStationFbs.ShortAxisFb.Mode := mcACP6D_MOVE_RELATIVE;
				TampStationFbs.ShortAxisFb.PositionZ := gTampStationIf.Par.TampHeight;
				TampStationFbs.ShortAxisFb.VelocityZ := gTampStationIf.Par.Vel;
				TampStationFbs.ShortAxisFb.Execute := TRUE;				
				
				state := TAMP_TAMP_RAISE;
			END_IF
		TAMP_TAMP_RAISE: //******************************************************************************** Tamp station is raising to the tamp height
			IF TampStationFbs.ShortAxisFb.Error THEN
				gTampStationIf.Status.Error := TRUE;
				
				state := TAMP_ERROR;
			ELSIF TampStationFbs.ShortAxisFb.Done THEN
				TampStationFbs.ShortAxisFb.Execute:= FALSE;
				
				TampStationFbs.WaitTimer.IN := TRUE;
				TampStationFbs.WaitTimer.PT := gTampStationIf.Par.WaitTime;
				
				state := TAMP_TAMPING;
			END_IF
			
		TAMP_TAMPING: //********************************************************************************Tamp station is preforming the tamping process
			IF TampStationFbs.WaitTimer.Q THEN
				TampStationFbs.WaitTimer.IN := FALSE;
				
				TampStationFbs.ShortAxisFb.Controller := ADR(gMcAcp6DController);
				TampStationFbs.ShortAxisFb.ShuttleID := gShuttleIf[gTampStationIf.Par.ShuttleIdx].Cfg.ShuttleId;
				TampStationFbs.ShortAxisFb.Mode := mcACP6D_MOVE_RELATIVE;
				TampStationFbs.ShortAxisFb.PositionZ := -gTampStationIf.Par.TampHeight;
				TampStationFbs.ShortAxisFb.VelocityZ := gTampStationIf.Par.Vel;
				TampStationFbs.ShortAxisFb.Execute := TRUE;	
				
				state := TAMP_TAMP_LOWER;
			END_IF
		TAMP_TAMP_LOWER: //******************************************************************************** Tamp station is raising to the tamp height
			IF TampStationFbs.ShortAxisFb.Error THEN
				gTampStationIf.Status.Error := TRUE;
				
				state := TAMP_ERROR;
			ELSIF TampStationFbs.ShortAxisFb.Done THEN
				TampStationFbs.ShortAxisFb.Execute:= FALSE;
				
				TampStationFbs.TampMoveFb.Controller := ADR(gMcAcp6DController);
				TampStationFbs.TampMoveFb.ShuttleID := gShuttleIf[gTampStationIf.Par.ShuttleIdx].Cfg.ShuttleId;
				TampStationFbs.TampMoveFb.Mode := mcACP6D_MOVE_RELATIVE;
				TampStationFbs.TampMoveFb.Path := mcACP6D_PATH_Y_THEN_X;
				TampStationFbs.TampMoveFb.Velocity := gTampStationIf.Par.Vel;
				TampStationFbs.TampMoveFb.EndVelocity := gTampStationIf.Par.EndVel;
				TampStationFbs.TampMoveFb.Acceleration := gTampStationIf.Par.Accel;
				TampStationFbs.TampMoveFb.PositionX := gTampStationIf.Par.ExitMovement.DistX;
				TampStationFbs.TampMoveFb.PositionY := gTampStationIf.Par.ExitMovement.DistY;
				TampStationFbs.TampMoveFb.Execute := TRUE;
				
				state := TAMP_EXIT_STATION;
			END_IF
		TAMP_EXIT_STATION: //******************************************************************************** Tamp station is sending the shuttle to the exit position
			IF TampStationFbs.TampMoveFb.Error THEN
				gTampStationIf.Status.Error := TRUE;
				
				state := TAMP_ERROR;
			ELSIF TampStationFbs.TampMoveFb.Done THEN
				TampStationFbs.TampMoveFb.Execute:= FALSE;
				
				gTampStationIf.Status.Done := TRUE;
				gTampStationIf.Status.Processing := FALSE;
				gShuttleIf[gTampStationIf.Par.ShuttleIdx].Cmd.NextStep := TRUE;
				
				state := TAMP_DONE;
			END_IF
		TAMP_DONE: //********************************************************************************Tamp station is done with the load process
			IF NOT gTampStationIf.Cmd.Enable THEN
				gTampStationIf.Status.Enabled := FALSE;
				gTampStationIf.Status.ReadyForNewShuttle := FALSE;
				
				state := TAMP_OFF;
			ELSIF NOT gTampStationIf.Cmd.Process THEN
				gTampStationIf.Status.Done := FALSE;
				
				gTampStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				gTampStationIf.Status.ReadyForNewShuttle := FALSE;
				gTampStationIf.Status.ReadyForNewShuttle := TRUE;
				
				state := TAMP_WAIT_FOR_SHUTTLE;
			END_IF
		TAMP_ERROR: //********************************************************************************Tamp station had an error
			IF gTampStationIf.Cmd.Reset THEN
				gTampStationIf.Cmd.Reset := FALSE;
				
				gTampStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				
				
				gTampStationIf.Status.Done := FALSE;
				gTampStationIf.Status.Error := FALSE;
				gTampStationIf.Status.Processing := FALSE;
				gTampStationIf.Status.ReadyForNewShuttle := FALSE;
				gTampStationIf.Status.Enabled := FALSE;
				
				TampStationFbs.TampMoveFb.Execute := FALSE;
				TampStationFbs.ShortAxisFb.Execute := FALSE;
				TampStationFbs.WaitTimer.IN := FALSE;
				
				IF gTampStationIf.Cmd.Enable THEN
					state := TAMP_INIT;
				ELSE
					state := TAMP_OFF;
				END_IF
			END_IF
	END_CASE;
		
	TampStationFbs.TampMoveFb();
	TampStationFbs.ShortAxisFb();
	TampStationFbs.WaitTimer();
END_PROGRAM
