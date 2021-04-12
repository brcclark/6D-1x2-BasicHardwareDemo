
PROGRAM _CYCLIC
	FOR i:=0 TO 1 DO
		CASE state[i] OF
			FILL_OFF: //********************************************************************************Fill station is currently disabled
				IF gVariedMoveDemoIf[i].Cmd.Enable THEN
					state[i] := FILL_INIT;
				END_IF
			FILL_INIT: //********************************************************************************Fill station is initalizing
				gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := TRUE;
				gVariedMoveDemoIf[i].Sts.Enabled := TRUE;
				state[i] := FILL_WAIT_FOR_SHUTTLE;
			FILL_WAIT_FOR_SHUTTLE: //********************************************************************************Fill station is waiting for a shuttle to be present
				IF NOT gVariedMoveDemoIf[i].Cmd.Enable THEN
					gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := FALSE;
					gVariedMoveDemoIf[i].Sts.Enabled := FALSE;
					state[i] := FILL_OFF;
				ELSIF gVariedMoveDemoIf[i].Par.ShuttleIdx <> STATION_IS_EMPTY AND gVariedMoveDemoIf[i].Cmd.Process THEN
					gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := FALSE;
					gVariedMoveDemoIf[i].Sts.Processing := TRUE;
				
					SetupStationActions;
				
					state[i] := FILL_FILLING;
				END_IF
			FILL_ENTER_SHUTTLE: //******************************************************************************** Fill station is moving to the filling position
				IF stationFbs[i].FillMoveFb.Error THEN
					gVariedMoveDemoIf[i].Sts.Error := TRUE;
				
					state[i] := FILL_ERROR;
				ELSIF stationFbs[i].FillMoveFb.Done THEN
					stationFbs[i].FillMoveFb.Execute:= FALSE;
				
					stationFbs[i].WaitTimer.IN := TRUE;
					stationFbs[i].WaitTimer.PT := stationPars.FillTime;
				
					SetupStationActions;
							
					state[i] := FILL_FILLING;
				END_IF
			FILL_FILLING: //********************************************************************************Fill station is preforming the filling process
				IF ((stationFbs[i].St1Fb.Done AND stationFbs[i].St1Fb.Execute) 
					OR (stationFbs[i].St2Fb.Done AND stationFbs[i].St2Fb.Execute) 
					OR (stationFbs[i].St3Fb.Done AND stationFbs[i].St3Fb.Execute)
					OR (stationFbs[i].St4Fb.Done AND stationFbs[i].St4Fb.Execute)) THEN
				
					//Interface with the correct Station FB
					CASE gVariedMoveDemoIf[i].Par.StationType OF
						ST1:
							stationFbs[i].St1Fb.Execute := FALSE;
						ST2:
							stationFbs[i].St2Fb.Execute := FALSE;
						ST3:
							stationFbs[i].St3Fb.Execute := FALSE;
							macroPatternCounter := macroPatternCounter + 1;
							IF macroPatternCounter = 2 THEN
								macroPatternCounter := 0;
							END_IF
						ST4:
							stationFbs[i].St4Fb.Execute := FALSE;
					END_CASE;
								
					gVariedMoveDemoIf[i].Sts.Done := TRUE;
					gVariedMoveDemoIf[i].Sts.Processing := FALSE;
			
					state[i] := FILL_DONE;
				END_IF
	
			FILL_DONE: //********************************************************************************Fill station is done with the load process
				IF NOT gVariedMoveDemoIf[i].Cmd.Enable THEN
					gVariedMoveDemoIf[i].Sts.Enabled := FALSE;
					gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := FALSE;
					macroPatternCounter := 0;
				
					state[i] := FILL_RESET;
				ELSE 
					gVariedMoveDemoIf[i].Cmd.Process := FALSE;
					
					gVariedMoveDemoIf[i].Sts.Done := FALSE;
					state[i] := FILL_CHECK_REPEAT;
				END_IF
			FILL_CHECK_REPEAT:
				gVariedMoveDemoIf[i].Sts.RepeatCounter := (gVariedMoveDemoIf[i].Sts.RepeatCounter + 1) * BOOL_TO_USINT(NOT gVariedMoveDemoIf[i].Par.RepeatForever);
				IF gVariedMoveDemoIf[i].Sts.RepeatCounter < gVariedMoveDemoIf[i].Par.RepeatCount OR gVariedMoveDemoIf[i].Par.RepeatForever THEN
					SetupStationActions;
					state[i] := FILL_FILLING;
				ELSE
					gVariedMoveDemoIf[i].Sts.RepeatCounter := 0;
					gVariedMoveDemoIf[i].Par.ShuttleIdx := STATION_IS_EMPTY;
					gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := FALSE;
					gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := TRUE;
				
					state[i] := FILL_WAIT_FOR_SHUTTLE;
				END_IF
			FILL_RESET: //********************************************************************************Reset State
				gVariedMoveDemoIf[i].Cmd.Reset := FALSE;
				
				gVariedMoveDemoIf[i].Sts.Done := FALSE;
				gVariedMoveDemoIf[i].Sts.Error := FALSE;
				gVariedMoveDemoIf[i].Sts.Processing := FALSE;
				gVariedMoveDemoIf[i].Sts.ReadyForNewShuttle := FALSE;
				gVariedMoveDemoIf[i].Sts.Enabled := FALSE;
				
				stationFbs[i].FillMoveFb.Execute := FALSE;
				stationFbs[i].WaitTimer.IN := FALSE;
				IF gVariedMoveDemoIf[i].Cmd.Enable THEN
					state[i] := FILL_INIT;
				ELSE
					state[i] := FILL_OFF;
				END_IF
			FILL_ERROR: //********************************************************************************Fill station had an error
				IF gVariedMoveDemoIf[i].Cmd.Reset THEN
					state[i] := FILL_RESET;					
				END_IF
		END_CASE;
		
		stationFbs[i].FillMoveFb();
		stationFbs[i].WaitTimer();
		//Call the appropriate station block
		CallStationFbs;

	END_FOR;

	
END_PROGRAM
