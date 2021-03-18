
PROGRAM _CYCLIC
	RoboBasicFb.MpLink := ADR(g3AxDeltaA);
	OnlinePath.AxesGroup := ADR(g3AxDeltaA);
	
	CASE state OF
		RBT_OFF:
			gSceneViewerIf.Cmds.Clear := TRUE;
			gSceneViewerIf.Cmds.Record := FALSE;
				
			IF gRobotIf.Cmds.Admin.Power THEN
				RoboBasicFb.Power := TRUE;
				gSceneViewerIf.Cmds.Clear := FALSE;
				gSceneViewerIf.Cmds.Record := TRUE;	
						
				state := RBT_POWER_ON;
			END_IF
		

		RBT_POWER_ON:
			IF RoboBasicFb.PowerOn THEN
				gRobotIf.Status.Powered := TRUE;
			ELSIF NOT gRobotIf.Status.Homed THEN
				RoboBasicFb.Home := TRUE;
						
				state := RBT_HOME;
			ELSE
				state := RBT_IDLE;
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
					gRobotIf.Pars.SyncFrameIdent := getCoordSystemIdent.Ident;
					deltaPars.CoordSystem := gRobotIf.Pars.SyncFrameIdent;
					OnlinePath.CoordSystem := deltaPars.CoordSystem;
					getCoordSystemIdent.Execute := FALSE;	
									
					state := RBT_RUN;
				END_IF
			
			ELSE
				IF(gRobotIf.Cmds.Process.Sync) THEN
					//Get the position
					masterPositionFb.Axis := ADR(gSyncIf.Status.AxisToSync);
					masterPositionFb.Enable := TRUE;
								
					OnlinePath.Enable := TRUE;
								
					RoboBasicFb.MoveProgram := TRUE;
								
					IF(RoboBasicFb.Info.Program.ProgramPhase = mcPRGPH_REAL_RUN AND gRobotIf.Pars.ShuttleIdx <> STATION_IS_EMPTY AND OnlinePath.Enabled) THEN
						OnlinePath.PositionOffset[0] := masterPositionFb.CyclicPosition * 1000 - gRobotIf.Pars.SyncPosition.X;
						gRobotIf.Status.AtSync := FALSE;
										
						gRobotIf.Status.Synced := TRUE;
										
						state := RBT_SYNC;
					END_IF
				END_IF
			END_IF
					
			
			
		RBT_MOVE_TO_SYNC:
			IF(RoboBasicFb.MoveDone) THEN
				gRobotIf.Status.AtSync := TRUE;
				RoboBasicFb.MoveDirect := FALSE;
						
				state := RBT_IDLE;
			END_IF
			
		RBT_SYNC:
			IF(masterPositionFb.Valid) THEN
				//Continually update the online path influencer with the shuttle's position corrected for the offset
				OnlinePath.PositionOffset[0] := masterPositionFb.CyclicPosition * 1000 - gRobotIf.Pars.SyncPosition.X;
			END_IF	
			
			//Gcode program sets the flag to be false when the "place" or w/e routine has finished. When this happens,
			//	Stop the online path influencer, stop the cyclic pos read, and tell the track to go ahead and release the shuttle
			IF(NOT gPickPlaceIf.Status.ProductPresent) THEN
				
				gRobotIf.Status.Synced := FALSE;
				gPickPlaceIf.Status.ProductOK := TRUE;
				gSyncIf.Cmds.Proc.ReleaseUnSync := TRUE;
					
				OnlinePath.Enable := FALSE;
				brsmemset(ADR(OnlinePath.PositionOffset),0,SIZEOF(OnlinePath.PositionOffset));
				masterPositionFb.Enable := FALSE;
					
				state := RBT_RUN;
			END_IF
		RBT_RUN:
		//Running the program right now
			IF(gSyncIf.Status.SyncReady AND gPickPlaceIf.Status.ProductPresent) THEN
				masterPositionFb.Axis := ADR(gSyncIf.Status.AxisToSync);
				masterPositionFb.Enable := TRUE;
				gRobotIf.Status.Synced := TRUE;
				gPickPlaceIf.Sync := TRUE;
						
				//Tell the Trak to release the shuttle
				gSyncIf.Cmds.Proc.ReleaseSync := TRUE;
				OnlinePath.Enable := TRUE;
						
				state := RBT_SYNC;
			END_IF
		
		END_CASE
     
	
		RoboBasicFb();
		OnlinePath();
		masterPositionFb();
	 
END_PROGRAM
