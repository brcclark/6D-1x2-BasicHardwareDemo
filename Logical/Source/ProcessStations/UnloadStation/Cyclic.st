
PROGRAM _CYCLIC
	CASE state OF
		UNLOAD_OFF: //********************************************************************************Unload station is currently disabled
			IF gUnloadStationIf.Cmd.Enable THEN
				state := UNLOAD_INIT;
			END_IF
		UNLOAD_INIT: //********************************************************************************Unload station is initalizing
			gUnloadStationIf.Status.ReadyForNewShuttle := TRUE;
			gUnloadStationIf.Status.Enabled := TRUE;
			state := UNLOAD_WAIT_FOR_SHUTTLE;
		UNLOAD_WAIT_FOR_SHUTTLE: //********************************************************************************Unload station is waiting for a shuttle to be present
			IF NOT gUnloadStationIf.Cmd.Enable THEN
				gUnloadStationIf.Status.ReadyForNewShuttle := FALSE;
				gUnloadStationIf.Status.Enabled := FALSE;
				state := UNLOAD_OFF;
			ELSIF gUnloadStationIf.Par.ShuttleIdx <> STATION_IS_EMPTY AND gUnloadStationIf.Cmd.Process THEN
				gUnloadStationIf.Status.ReadyForNewShuttle := FALSE;
				gUnloadStationIf.Status.Processing := TRUE;
				
				UnloadStationFbs.UnloadTimerFb.IN := TRUE;
				UnloadStationFbs.UnloadTimerFb.PT := gUnloadStationIf.Par.WaitTime;
				
				state := UNLOAD_UNLOADING;
			END_IF
		UNLOAD_UNLOADING: //********************************************************************************Unload station is unloading product off a shuttle
			IF UnloadStationFbs.UnloadTimerFb.Q THEN
				UnloadStationFbs.UnloadTimerFb.IN := FALSE;
				
				gUnloadStationIf.Status.Processing := FALSE;
				gShuttleIf[gUnloadStationIf.Par.ShuttleIdx].Cmd.NextStep := TRUE;
				gUnloadStationIf.Status.Done := TRUE;
				
				state := UNLOAD_DONE;
			END_IF
		UNLOAD_DONE: //********************************************************************************Unload station is done with the unload process
			IF NOT gUnloadStationIf.Cmd.Enable THEN
				gUnloadStationIf.Status.Done := FALSE;
				gUnloadStationIf.Status.Enabled := FALSE;
				gUnloadStationIf.Status.ReadyForNewShuttle := FALSE;
				state := UNLOAD_OFF;
			ELSIF NOT gUnloadStationIf.Cmd.Process THEN
				gUnloadStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				gUnloadStationIf.Status.ReadyForNewShuttle := FALSE;
				gUnloadStationIf.Status.ReadyForNewShuttle := TRUE;
				
				state := UNLOAD_WAIT_FOR_SHUTTLE;
			END_IF
			
		UNLOAD_ERROR: //********************************************************************************Unload station had an error
			IF gUnloadStationIf.Cmd.Reset THEN
				gUnloadStationIf.Cmd.Reset := FALSE;
				
				gUnloadStationIf.Status.Done := FALSE;
				gUnloadStationIf.Status.Enabled := FALSE;
				gUnloadStationIf.Status.Error := FALSE;
				gUnloadStationIf.Status.Processing := FALSE;
				gUnloadStationIf.Status.ReadyForNewShuttle := FALSE;
				
				gUnloadStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				IF gUnloadStationIf.Cmd.Enable THEN
					state := UNLOAD_INIT;
				ELSE
					state := UNLOAD_OFF;
				END_IF
			END_IF
	END_CASE;
		
	UnloadStationFbs.UnloadTimerFb();
END_PROGRAM
