
PROGRAM _CYCLIC
	CASE state OF
		LOAD_OFF: //********************************************************************************Load station is currently disabled
			IF gLoadStationIf.Cmd.Enable THEN
				state := LOAD_INIT;
			END_IF
		LOAD_INIT: //********************************************************************************Load station is initalizing
			
				gLoadStationIf.Status.ReadyForNewShuttle := TRUE;
				gLoadStationIf.Status.Enabled := TRUE;
				state := LOAD_WAIT_FOR_SHUTTLE;
			
		LOAD_WAIT_FOR_SHUTTLE: //********************************************************************************Load station is waiting for a shuttle to be present
			IF NOT gLoadStationIf.Cmd.Enable THEN
				gLoadStationIf.Status.ReadyForNewShuttle := FALSE;
				gLoadStationIf.Status.Enabled := FALSE;
				state := LOAD_OFF;
			ELSIF gLoadStationIf.Par.ShuttleIdx <> STATION_IS_EMPTY AND gLoadStationIf.Cmd.Process THEN
				gLoadStationIf.Status.ReadyForNewShuttle := FALSE;
				gLoadStationIf.Status.Processing := TRUE;
				
				LoadStationFbs.LoadTimerFb.IN := TRUE;
				LoadStationFbs.LoadTimerFb.PT := gLoadStationIf.Par.WaitTime;
				
				state := LOAD_LOADING;
			END_IF
		LOAD_LOADING: //********************************************************************************Load station is loading product onto a shuttle
			IF LoadStationFbs.LoadTimerFb.Q THEN
				LoadStationFbs.LoadTimerFb.IN := FALSE;
				
				gLoadStationIf.Status.Processing := FALSE;
				gShuttleIf[gLoadStationIf.Par.ShuttleIdx].Cmd.NextStep := TRUE;
				gLoadStationIf.Status.Done := TRUE;
				
				state := LOAD_DONE;
			END_IF
		LOAD_DONE: //********************************************************************************Load station is done with the load process
			IF NOT gLoadStationIf.Cmd.Enable THEN
				gLoadStationIf.Status.Done := FALSE;
				gLoadStationIf.Status.Enabled := FALSE;
				gLoadStationIf.Status.ReadyForNewShuttle := FALSE;
				state := LOAD_OFF;
			ELSIF NOT gLoadStationIf.Cmd.Process THEN
				gLoadStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				gLoadStationIf.Status.Done := FALSE;
				gLoadStationIf.Status.ReadyForNewShuttle := FALSE;
				gLoadStationIf.Status.ReadyForNewShuttle := TRUE;
				
				state := LOAD_WAIT_FOR_SHUTTLE;
			END_IF
			
		LOAD_ERROR: //********************************************************************************Load station had an error
			IF gLoadStationIf.Cmd.Reset THEN
				gLoadStationIf.Cmd.Reset := FALSE;
				
				gLoadStationIf.Status.Done := FALSE;
				gLoadStationIf.Status.Enabled := FALSE;
				gLoadStationIf.Status.Error := FALSE;
				gLoadStationIf.Status.Processing := FALSE;
				gLoadStationIf.Status.ReadyForNewShuttle := FALSE;
				
				gLoadStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
				IF gLoadStationIf.Cmd.Enable THEN
					state := LOAD_INIT;
				ELSE
					state := LOAD_OFF;
				END_IF
			END_IF
	END_CASE;
		
	 LoadStationFbs.LoadTimerFb();
END_PROGRAM
