
(* TODO: Add your comment here *)
FUNCTION_BLOCK ThroughputCounterFb
	CASE Internal.state OF
		TC_OFF:
			IF Enable THEN
				Internal.state := TC_INIT;
			END_IF
		TC_INIT:
			Internal.startTime := TIME_TO_UDINT(clock_ms());	//Determine start clock 
			Internal.state := TC_CALC;
		TC_CALC:
			IF Reset THEN 	//Head back to the init state and reset internal start time 
				Reset := FALSE;
				Internal.state := TC_INIT;
			ELSIF NOT Enable THEN	//Disable if the enable is dropped
				AvgCycleTime := 0;
				Internal.AvgCycleTimeUdint := 0;
				Internal.timeSinceStart := 0;
				Internal.state := TC_OFF;
			ELSIF ProductCounter <> 0 THEN //Done to ensure no divide by 0
				Internal.timeSinceStart := (TIME_TO_UDINT(clock_ms()) - Internal.startTime);	//Calculate time since the start of the monitoring
				AvgCycleTime := Internal.timeSinceStart / ProductCounter;	//Calculate current estimated cycle time
				Internal.AvgCycleTimeUdint := TIME_TO_UDINT(AvgCycleTime);	//Convert to a UDINT
				PPM := 60.0 * 1 / (Internal.AvgCycleTimeUdint / 1000.0);	//Calculate PPM
				PPH := 3600.0 * 1 / (Internal.AvgCycleTimeUdint / 1000.0);	//Calculate PPH
			END_IF
		TC_ERROR:
			IF NOT Enable THEN
				AvgCycleTime := 0;
				Internal.AvgCycleTimeUdint := 0;
				Internal.timeSinceStart := 0;
				Internal.state := TC_OFF;
			END_IF
	END_CASE;
END_FUNCTION_BLOCK
