(* 
	Program to control interfacing with a conveyor to unload a shuttle
	
	Steps
		Setup Unload Zone
		Get UnloadZone Status to get entry point
		Command shuttle to entry point
		Issue ZoneUnload
*)

PROGRAM _CYCLIC
	CASE state OF
		HAND_IDLE:
			IF interlinkIf.Cmd.SetupZone THEN
				fbs.ZoneCreateFb.Controller := ADR(gMcAcp6DController);
				fbs.ZoneCreateFb.ZoneID := interlinkIf.Par.ZonePars.ZoneID;
				fbs.ZoneCreateFb.ZoneMode := interlinkIf.Par.ZonePars.ZoneMode;
				fbs.ZoneCreateFb.UnloadingMode := interlinkIf.Par.ZonePars.UnloadingMode;
				fbs.ZoneCreateFb.ZoneCenterX := interlinkIf.Par.ZonePars.ZoneCenterX;
				fbs.ZoneCreateFb.ZoneCenterY := interlinkIf.Par.ZonePars.ZoneCenterY;
				fbs.ZoneCreateFb.ZoneLength := interlinkIf.Par.ZonePars.ZoneLength;
				fbs.ZoneCreateFb.ZoneWidth := interlinkIf.Par.ZonePars.ZoneWidth;
				fbs.ZoneCreateFb.MaxShuttleSizeX := interlinkIf.Par.ZonePars.MaxShuttleX;
				fbs.ZoneCreateFb.MaxShuttleSizeY := interlinkIf.Par.ZonePars.MaxShuttleY;
				fbs.ZoneCreateFb.Velocity := interlinkIf.Par.ZonePars.Velocity;
				fbs.ZoneCreateFb.Acceleration := interlinkIf.Par.ZonePars.Accel;
				fbs.ZoneCreateFb.Execute := TRUE;
				
				state := HAND_SETUP_ZONE;
			END_IF
			
		HAND_SETUP_ZONE:
			IF fbs.ZoneCreateFb.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.ZoneCreateFb.Done THEN
				fbs.ZoneCreateFb.Execute := FALSE;
				
				fbs.ZoneActivateFb.ZoneID := interlinkIf.Par.ZonePars.ZoneID;
				fbs.ZoneActivateFb.Controller := ADR(gMcAcp6DController);
				fbs.ZoneActivateFb.Execute := TRUE;
				
				state := HAND_ACTIVATE_ZONE;
			END_IF
		HAND_ACTIVATE_ZONE:
			IF fbs.ZoneActivateFb.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.ZoneActivateFb.Done THEN
				fbs.ZoneActivateFb.Execute := FALSE;
				
				fbs.ZoneGetStsFb.Controller := ADR(gMcAcp6DController);
				fbs.ZoneGetStsFb.ZoneID := interlinkIf.Par.ZonePars.ZoneID;
				fbs.ZoneGetStsFb.Execute := TRUE;
				
				state := HAND_GET_ZONE_STATUS;
			END_IF
		HAND_GET_ZONE_STATUS:
			IF fbs.ZoneGetStsFb.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.ZoneGetStsFb.Done THEN
				fbs.ZoneGetStsFb.Execute := FALSE;
				interlinkIf.Sts.ZoneSts := fbs.ZoneGetStsFb.ZoneStatus;
				interlinkIf.Sts.Ready := TRUE;
				interlinkIf.Cmd.SetupZone := FALSE;
				
				state := HAND_WAIT;
			END_IF
		HAND_WAIT:
			IF interlinkIf.Cmd.Offload THEN
				fbs.MoveInPlane.Controller := ADR(gMcAcp6DController);
				fbs.MoveInPlane.ShuttleID := interlinkIf.Par.ShuttleID+1;
				fbs.MoveInPlane.PositionX := interlinkIf.Sts.ZoneSts.ZoneX;
				fbs.MoveInPlane.PositionY := interlinkIf.Sts.ZoneSts.ZoneY;
				fbs.MoveInPlane.Velocity := interlinkIf.Par.ZonePars.Velocity;
				fbs.MoveInPlane.Acceleration := interlinkIf.Par.ZonePars.Accel;
				fbs.MoveInPlane.Execute := TRUE;
				
				state := HAND_MOVE_SHUTTLE_ENTRANCE;
			ELSIF interlinkIf.Cmd.DeleteZone THEN
				fbs.ZoneDeactivateFb.Controller := ADR(gMcAcp6DController);
				fbs.ZoneDeactivateFb.ZoneID := interlinkIf.Par.ZonePars.ZoneID;
				fbs.ZoneDeactivateFb.Execute := TRUE;
				
				state := HAND_DEACTIVATE_ZONE;					
			END_IF
			
		HAND_MOVE_SHUTTLE_ENTRANCE:
			IF fbs.MoveInPlane.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.MoveInPlane.Done THEN
				fbs.MoveInPlane.Execute := FALSE;
				
				fbs.ZoneUnloadFb.Controller := ADR(gMcAcp6DController);
				fbs.ZoneUnloadFb.ShuttleID := interlinkIf.Par.ShuttleID+1;
				fbs.ZoneUnloadFb.ZoneID := interlinkIf.Par.ZonePars.ZoneID;
				fbs.ZoneUnloadFb.Execute := TRUE;
				
				state := HAND_UNLOAD_SHUTTLE;
			END_IF
			
		HAND_UNLOAD_SHUTTLE:
			IF fbs.ZoneUnloadFb.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.ZoneUnloadFb.Done THEN
				fbs.ZoneUnloadFb.Execute := FALSE;
				
				interlinkIf.Cmd.Offload := FALSE;
				state := HAND_WAIT;
			END_IF
		HAND_DEACTIVATE_ZONE:
			IF fbs.ZoneDeactivateFb.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.ZoneDeactivateFb.Done THEN
				fbs.ZoneDeactivateFb.Execute := FALSE;
				
				fbs.ZoneDeleteFb.Controller := ADR(gMcAcp6DController);
				fbs.ZoneDeleteFb.ZoneID := interlinkIf.Par.ZonePars.ZoneID;
				fbs.ZoneDeleteFb.Execute := TRUE;
				
				state := HAND_DELETE_ZONE;
			END_IF
		HAND_DELETE_ZONE:
			IF fbs.ZoneDeleteFb.Error THEN
				state := HAND_ERROR;
			ELSIF fbs.ZoneDeleteFb.Done THEN
				fbs.ZoneDeleteFb.Execute := FALSE;
				interlinkIf.Sts.Ready := FALSE;
				
				state := HAND_IDLE;
			END_IF
		HAND_ERROR:
			IF interlinkIf.Cmd.Reset THEN
				fbs.ZoneActivateFb.Execute := FALSE;
				fbs.ZoneGetStsFb.Execute := FALSE;
				fbs.ZoneCreateFb.Execute := FALSE;
				fbs.MoveInPlane.Execute := FALSE;
				fbs.ZoneUnloadFb.Execute := FALSE;
				fbs.ZoneDeleteFb.Execute := FALSE;
				fbs.ZoneDeactivateFb.Execute := FALSE;
				
				interlinkIf.Cmd.Offload := FALSE;
				interlinkIf.Cmd.Reset := FALSE;
				interlinkIf.Cmd.SetupZone := FALSE;
				
				IF interlinkIf.Sts.Ready THEN
					state := HAND_WAIT;
				ELSE
					state := HAND_IDLE;
				END_IF
				
			END_IF
	END_CASE;
	 
	fbs.ZoneActivateFb();
	fbs.ZoneDeleteFb();
	fbs.ZoneDeactivateFb();
	fbs.ZoneGetStsFb();
	fbs.ZoneCreateFb();
	fbs.MoveInPlane();
	fbs.ZoneUnloadFb();
END_PROGRAM
