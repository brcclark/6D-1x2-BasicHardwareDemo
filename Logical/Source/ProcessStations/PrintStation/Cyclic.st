
PROGRAM _CYCLIC
	CASE state OF
		PRINT_OFF: //********************************************************************************Print station is currently disabled
			IF gPrintStationIf.Cmd.Enable THEN
				state := PRINT_INIT;
			END_IF
		PRINT_INIT: //********************************************************************************Print station is initalizing
			gPrintStationIf.Status.ReadyForNewShuttle := TRUE;
			gPrintStationIf.Status.Enabled := TRUE;
			state := PRINT_WAIT_FOR_SHUTTLE;
		PRINT_WAIT_FOR_SHUTTLE: //********************************************************************************Print station is waiting for a shuttle to be present
			IF NOT gPrintStationIf.Cmd.Enable THEN
				gPrintStationIf.Status.ReadyForNewShuttle := FALSE;
				gPrintStationIf.Status.Enabled := FALSE;
				state := PRINT_OFF;
			ELSIF gPrintStationIf.Par.ShuttleIdx <> STATION_IS_EMPTY AND gPrintStationIf.Cmd.Process THEN
				gPrintStationIf.Status.ReadyForNewShuttle := FALSE;
				gPrintStationIf.Status.Processing := TRUE;
				
				PrintStationFbs.PrintMoveFb.Controller := ADR(gMcAcp6DController);
				PrintStationFbs.PrintMoveFb.ShuttleID := gShuttleIf[gPrintStationIf.Par.ShuttleIdx].Cfg.ShuttleId;
				PrintStationFbs.PrintMoveFb.Mode := mcACP6D_MOVE_RELATIVE;
				PrintStationFbs.PrintMoveFb.Path := mcACP6D_PATH_DIRECT;
				PrintStationFbs.PrintMoveFb.Velocity := gPrintStationIf.Par.PrintVel;
				PrintStationFbs.PrintMoveFb.EndVelocity := gPrintStationIf.Par.PrintAccel;
				PrintStationFbs.PrintMoveFb.Acceleration := gPrintStationIf.Par.PrintAccel;
				PrintStationFbs.PrintMoveFb.PositionX := gPrintStationIf.Par.PrintDistanceX;
				PrintStationFbs.PrintMoveFb.PositionY := gPrintStationIf.Par.PrintDistanceY;
				PrintStationFbs.PrintMoveFb.Execute := TRUE;
				
				state := PRINT_PRINTING;
			END_IF
		PRINT_PRINTING: //********************************************************************************Print station is loading product onto a shuttle
			IF PrintStationFbs.PrintMoveFb.Error THEN
				gPrintStationIf.Status.Error := TRUE;
				
				state := PRINT_ERROR;
			ELSIF PrintStationFbs.PrintMoveFb.Done THEN
				PrintStationFbs.PrintMoveFb.Execute:= FALSE;
				
				gPrintStationIf.Status.Processing := FALSE;
				gShuttleIf[gPrintStationIf.Par.ShuttleIdx].Cmd.NextStep := TRUE; //Tell the shuttle we've finished the process and it's okay to move on to the next step
				gPrintStationIf.Status.Done := TRUE; 
				
				state := PRINT_DONE;
			END_IF
		PRINT_DONE: //********************************************************************************Print station is done with the load process
			IF NOT gPrintStationIf.Cmd.Enable THEN
				gPrintStationIf.Status.Enabled := FALSE;
				gPrintStationIf.Status.ReadyForNewShuttle := FALSE;
				state := PRINT_OFF;
			ELSIF NOT gPrintStationIf.Cmd.Process THEN
				gPrintStationIf.Status.Done := FALSE;
				
				gPrintStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				gPrintStationIf.Status.ReadyForNewShuttle := FALSE;
				gPrintStationIf.Status.ReadyForNewShuttle := TRUE;
				
				state := PRINT_WAIT_FOR_SHUTTLE;
			END_IF
		PRINT_ERROR: //********************************************************************************Print station had an error
			IF gPrintStationIf.Cmd.Reset THEN
				gPrintStationIf.Cmd.Reset := FALSE;
				
				gPrintStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				
				gPrintStationIf.Status.Done := FALSE;
				gPrintStationIf.Status.Error := FALSE;
				gPrintStationIf.Status.Processing := FALSE;
				gPrintStationIf.Status.ReadyForNewShuttle := FALSE;
				gPrintStationIf.Status.Enabled := FALSE;
				
				PrintStationFbs.PrintMoveFb.Execute := FALSE;
				
				IF gPrintStationIf.Cmd.Enable THEN
					state := PRINT_INIT;
				ELSE
					state := PRINT_OFF;
				END_IF
			END_IF
	END_CASE;
		
	PrintStationFbs.PrintMoveFb();
END_PROGRAM
