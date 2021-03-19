
PROGRAM _CYCLIC
	RoboBasicFb.MpLink := ADR(g3AxDeltaA);
	OnlinePath.AxesGroup := ADR(g3AxDeltaA);
	
	CASE state OF
		RBT_OFF:
			gSceneViewerIf.Cmds.Clear := TRUE;
			gSceneViewerIf.Cmds.Record := FALSE;
				
			gRobotIf.Pars.ShuttleIdx := STATION_IS_EMPTY;
			
			IF gRobotIf.Cmds.Admin.Power THEN
				RoboBasicFb.Power := TRUE;
				gSceneViewerIf.Cmds.Clear := FALSE;
				gSceneViewerIf.Cmds.Record := TRUE;	
						
				state := RBT_POWER_ON;
			END_IF
		

		RBT_POWER_ON:
			IF RoboBasicFb.PowerOn THEN
				gRobotIf.Status.Powered := TRUE;
				IF NOT gRobotIf.Status.Homed THEN
					RoboBasicFb.Home := TRUE;
							
					state := RBT_HOME;
				ELSE
					state := RBT_IDLE;
				END_IF
			END_IF
		
		RBT_HOME:
			IF RoboBasicFb.IsHomed THEN
				gRobotIf.Cmds.Admin.Home := FALSE;
				RoboBasicFb.Home := FALSE;
						
				gRobotIf.Status.Homed := TRUE;
						
				state := RBT_IDLE;
			END_IF
		
		RBT_IDLE:
			IF gRobotIf.Cmds.Admin.Home THEN
				gRobotIf.Status.Homed := FALSE;
				RoboBasicFb.Home := TRUE;
						
				state := RBT_HOME;
			ELSIF gRobotIf.Cmds.Process.Run THEN
				getCoordSystemIdent.Execute := TRUE;
				getCoordSystemIdent.CoordSystemName := gRobotIf.Pars.SyncFrame;
						
				getCoordSystemIdent.Parameter.AxesGroup := ADR(g3AxDeltaA);
					
				getCoordSystemIdent();
						
				RoboBasicFb.MoveProgram := TRUE;
				IF RoboBasicFb.Info.Program.ProgramPhase = mcPRGPH_REAL_RUN AND getCoordSystemIdent.Done THEN
								
					gPickPlaceIf.Run := TRUE;	
					gRobotIf.Status.Running := TRUE;
					gRobotIf.Pars.SyncFrameIdent := getCoordSystemIdent.Ident;
					deltaPars.CoordSystem := gRobotIf.Pars.SyncFrameIdent;
					OnlinePath.CoordSystem := deltaPars.CoordSystem;
					getCoordSystemIdent.Execute := FALSE;	
						
					state := RBT_RUN;
				END_IF
			END_IF
			
		RBT_MOVE_TO_SYNC:
			IF(RoboBasicFb.MoveDone) THEN
				gRobotIf.Status.AtSync := TRUE;
				RoboBasicFb.MoveDirect := FALSE;
						
				state := RBT_IDLE;
			END_IF
			
		RBT_SYNC:
			
			//Continually update the online path influencer with the shuttle's position corrected for the offset
			OnlinePath.PositionOffset[0] := gShuttleIf[gRobotIf.Pars.ShuttleIdx].Status.CyclicPositionX * 1000 - gRobotIf.Pars.SyncPosition.X;
			OnlinePath.PositionOffset[1] := gShuttleIf[gRobotIf.Pars.ShuttleIdx].Status.CyclicPositionY * 1000 - gRobotIf.Pars.SyncPosition.Y;
						
			IF NOT gRobotIf.Cmds.Process.Sync THEN
				OnlinePath.Enable := FALSE;
				brsmemset(ADR(OnlinePath.PositionOffset),0,SIZEOF(OnlinePath.PositionOffset));
				state := RBT_RUN;
			ELSIF NOT gRobotIf.Cmds.Process.Run THEN
				OnlinePath.Enable := FALSE;
				gRobotIf.Cmds.Process.Sync := FALSE;
				brsmemset(ADR(OnlinePath.PositionOffset),0,SIZEOF(OnlinePath.PositionOffset));
				RoboBasicFb.Stop := TRUE;
				RoboBasicFb.MoveProgram := FALSE;
				
				state := RBT_STOP;
			END_IF
			
			
		RBT_RUN:
			//Running the program right now
			IF gRobotIf.Cmds.Process.Sync THEN
				OnlinePath.Enable := TRUE;
						
				state := RBT_SYNC;
			ELSIF NOT gRobotIf.Cmds.Process.Run THEN
				OnlinePath.Enable := FALSE;
				RoboBasicFb.Stop := TRUE;
				RoboBasicFb.MoveProgram := FALSE;
				
				state := RBT_STOP;
			END_IF
		RBT_STOP:
			IF RoboBasicFb.Stopped THEN
				RoboBasicFb.Stop := FALSE;
				state := RBT_IDLE;
			END_IF
		
	END_CASE
	
	RoboBasicFb();
	OnlinePath();
	 
END_PROGRAM
