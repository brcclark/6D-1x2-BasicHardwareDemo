
PROGRAM _CYCLIC
	
	(*
	Shuttle reocvery
		Move all shuttles to autodrive positions		
		Wait for autodrive to be finished
		loop through each shuttle
			if that shuttle's group is current
				it is not recovered, 
					groupRecovered=false
					Evaluate each shuttle's position 
					Send it to the unload position and set the "Next step cmd" to be true
				else
					onwards, do nothing

	*)
	 
	CASE state OF
		RECOVER_IDLE:   //******************************************************************************** Recovery is in an idle state*)
			IF g6DRecoveryIf.Cmd.Recover THEN
				g6DRecoveryIf.Sts.Recovering := TRUE;
				state := RECOVER_INIT;
			END_IF
		RECOVER_INIT:   //******************************************************************************** Initalize recovery state*)
			RecoverFbs.AsyncMoveFb.Controller := ADR(gMcAcp6DController);
			RecoverFbs.AsyncMoveFb.NumberOfShuttles := gMainIf.Cfg.ShuttleCount;
			RecoverFbs.AsyncMoveFb.Velocity := g6DRecoveryIf.Par.Vel;
			RecoverFbs.AsyncMoveFb.Acceleration := g6DRecoveryIf.Par.Accel;
			FOR i:=0 TO gMainIf.Cfg.ShuttleCount - 1 DO
				RecoverFbs.AsyncMoveFb.PositionX[i] := g6DRecoveryIf.Par.AutoDrivePositions[i].X; 	
				RecoverFbs.AsyncMoveFb.PositionY[i] := g6DRecoveryIf.Par.AutoDrivePositions[i].Y; 	
				RecoverFbs.AsyncMoveFb.ShuttleID[i] := gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Cfg.ShuttleId;
				IF RecoverFbs.AsyncMoveFb.ShuttleID[i] = 0 THEN// Invalid shuttle id here
					g6DRecoveryIf.Sts.Error := TRUE;
				END_IF
			END_FOR;
			IF NOT g6DRecoveryIf.Sts.Error THEN
				RecoverFbs.AsyncMoveFb.Execute := TRUE;
				state := RECOVER_AUTODRIVE;
			ELSE
				state := RECOVER_ERROR;
			END_IF
			
		RECOVER_AUTODRIVE:   //******************************************************************************** Preform autodrive movement for recovery*)
			IF RecoverFbs.AsyncMoveFb.Error THEN
				g6DRecoveryIf.Sts.Error := TRUE;
				state := RECOVER_ERROR;
			ELSIF RecoverFbs.AsyncMoveFb.Done THEN
				g6DRecoveryIf.Sts.ReadyToStartProc := TRUE;
				RecoverFbs.AsyncMoveFb.Execute := FALSE;
				
				CurrentGroup := 0;
				state := RECOVER_WAIT_ALL_RECOVER;
			END_IF
		RECOVER_WAIT_ALL_RECOVER:   //******************************************************************************** Preform the loop through all shuttles to accomplish the reocvery*)
			//Ideally this should be in a FB
			GroupRecovered := TRUE;
			FOR i:=0 TO gMainIf.Cfg.ShuttleCount -1 DO
				IF g6DRecoveryIf.Par.AutoDrivePositions[i].GroupNum = CurrentGroup THEN
					IF NOT gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Status.Recovered THEN
						GroupRecovered := FALSE;
						IF CurrentGroup = 0 THEN
							gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Status.Recovered := TRUE;
							gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Cmd.NextStep := TRUE;
						ELSE
							RecoverFbs.MacroRunFb[i].Controller := ADR(gMcAcp6DController);
							RecoverFbs.MacroRunFb[i].MacroID := DINT_TO_USINT(MACRO_RECOVERY_GROUP0) + CurrentGroup;
							RecoverFbs.MacroRunFb[i].ShuttleID := gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Cfg.ShuttleId;
							RecoverFbs.MacroRunFb[i].Execute := TRUE;
						
							IF RecoverFbs.MacroRunFb[i].Error THEN
								g6DRecoveryIf.Sts.Error := TRUE;
							ELSIF RecoverFbs.MacroRunFb[i].Acknowledge THEN
								RecoverFbs.MacroRunFb[i].Execute := FALSE;
								gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Cmd.NextStep := TRUE;
								gShuttleIf[g6DRecoveryIf.Par.AutoDrivePositions[i].ShIdx].Status.Recovered := TRUE;
							END_IF
						END_IF
					ELSE
						//Already recovered don't have to do anything
						
					END_IF
				END_IF
			END_FOR;
			IF GroupRecovered THEN
				CurrentGroup := CurrentGroup + 1;
				IF CurrentGroup >= NUM_GROUPS THEN
					//We've recovered all groups
					g6DRecoveryIf.Sts.Recovering := FALSE;
					g6DRecoveryIf.Sts.Done := TRUE;
					g6DRecoveryIf.Sts.ShuttlesRecovered := TRUE;
					state := RECOVER_DONE;
				ELSE
					//Still more groups to recover, keep on recovering
				END_IF
			ELSE
				//Still more shuttles to recover in the group
			END_IF
			IF g6DRecoveryIf.Sts.Error THEN
				state := RECOVER_ERROR;
			END_IF
		RECOVER_DONE:   //******************************************************************************** Recovery has been completed*)
			IF NOT g6DRecoveryIf.Cmd.Recover THEN
				g6DRecoveryIf.Cmd.Reset := FALSE;
				g6DRecoveryIf.Sts.Done := FALSE;
				g6DRecoveryIf.Sts.ReadyToStartProc := FALSE;
				g6DRecoveryIf.Sts.Recovering := FALSE;
				g6DRecoveryIf.Sts.ShuttlesRecovered := FALSE;
				g6DRecoveryIf.Sts.Error := FALSE;
				CurrentGroup := 0;
				
				RecoverFbs.AsyncMoveFb.Execute := FALSE;
				state := RECOVER_IDLE;
			END_IF
		RECOVER_ERROR:   //******************************************************************************** Recovery had an error*)
			IF g6DRecoveryIf.Cmd.Reset THEN
				g6DRecoveryIf.Cmd.Reset := FALSE;
				g6DRecoveryIf.Sts.Done := FALSE;
				g6DRecoveryIf.Sts.ReadyToStartProc := FALSE;
				g6DRecoveryIf.Sts.Recovering := FALSE;
				g6DRecoveryIf.Sts.ShuttlesRecovered := FALSE;
				g6DRecoveryIf.Sts.Error := FALSE;
				CurrentGroup := 0;
				
				RecoverFbs.AsyncMoveFb.Execute := FALSE;
				state := RECOVER_IDLE;
			END_IF
	END_CASE;
	RecoverFbs.AsyncMoveFb();
	FOR i:=0 TO gMainIf.Cfg.ShuttleCount -1 DO
		RecoverFbs.MacroRunFb[i]();
	END_FOR;
END_PROGRAM
