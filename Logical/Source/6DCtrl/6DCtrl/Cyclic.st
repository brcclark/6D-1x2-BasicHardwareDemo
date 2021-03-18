
PROGRAM _CYCLIC
	
	IF((Fbs.SysReadStateFb.Valid AND Fbs.SysReadStateFb.State = mcACP6D_STATE_ERROR) AND (state <> ACP6D_ERROR))THEN
		state := ACP6D_ERROR;
	END_IF;
		

	CASE state OF
		ACP6D_RESET: 	//******************************************************************************** 6D Reset State
			IF(Fbs.SysReadStateFb.Valid AND (Fbs.SysReadStateFb.State = mcACP6D_STATE_INACTIVE))THEN
				state := ACP6D_INACTIVE;
			ELSIF(Fbs.SysReadStateFb.State = mcACP6D_STATE_OPERATION)THEN
				state := ACP6D_POWER_OFF;
			END_IF;
					
		ACP6D_POWER_OFF: 	//******************************************************************************** 6D Power off commanding State
			Fbs.PowerOffFb.Execute := TRUE;
			IF(Fbs.PowerOffFb.Acknowledge AND (Fbs.SysReadStateFb.Valid AND Fbs.SysReadStateFb.State = mcACP6D_STATE_INACTIVE))THEN
				gAcp6DCtrlIf.Status.PowerOn := FALSE;
				Fbs.PowerOffFb.Execute 	:= FALSE;
				state := ACP6D_INACTIVE;
			ELSIF(Fbs.PowerOffFb.Error)THEN
				Fbs.PowerOffFb.Execute 	:= FALSE;
				gAcp6DCtrlIf.Status.ErrorID := Fbs.PowerOffFb.ErrorID;
				state := ACP6D_ERROR;
			END_IF;
		
		ACP6D_INACTIVE:	 	//******************************************************************************** 6D Inactive/Power Off state
			IF(gAcp6DCtrlIf.Cmd.Power)THEN
				Fbs.PowerOnFb.Execute := TRUE;
				//MpAuditCustomEvent(gAuditTrail,"INFO","Acp6DSys","Power On Command Issued");
				state := ACP6D_POWER_ON;
			END_IF;
		
		ACP6D_POWER_ON: 	//******************************************************************************** 6D Power on Commanding State
			IF Fbs.PowerOnFb.Error THEN
				gAcp6DCtrlIf.Status.ErrorID := Fbs.PowerOnFb.ErrorID;
				state := ACP6D_ERROR;
			ELSIF(Fbs.PowerOnFb.Acknowledge AND (Fbs.SysReadStateFb.Valid AND (Fbs.SysReadStateFb.State > mcACP6D_STATE_INACTIVE)))THEN
				//MpAuditCustomEvent(gAuditTrail,"INFO","Acp6DSys","Powered On");
				Fbs.PowerOnFb.Execute := FALSE;
				state := ACP6D_WAIT_ACTIVATION;
			END_IF;
				
			//Necessary state when using Absolute ID.
		ACP6D_WAIT_ACTIVATION: 	//******************************************************************************** 6D Waiting for Activation of Shuttles State
			IF(Fbs.SysReadStateFb.Valid)THEN
				IF(Fbs.SysReadStateFb.State = mcACP6D_STATE_OPERATION)THEN
					gAcp6DCtrlIf.Status.PowerOn := TRUE;
					state := ACP6D_INIT_MACRO;
				ELSIF(Fbs.SysReadStateFb.State = mcACP6D_STATE_INACTIVE)THEN
					state := ACP6D_INACTIVE; // Error during Activating state; Can happen in Absolute ID mode.
					gAcp6DCtrlIf.Cmd.Power := FALSE;
				END_IF;
			END_IF;
		ACP6D_INIT_MACRO: 	//******************************************************************************** 6D Wait for Macro initilization State
			IF gMacroLoadIf.Status.AllMacrosLoaded THEN
				gMacroLoadIf.Cmd.LoadAll := FALSE;
				
				//This is hard coded for 2 axes to get the X position cyclically for the two FBs
				Fbs.CfgReadCyclicPos.Controller := ADR(gMcAcp6DController);
				Fbs.CfgReadCyclicPos.NumberOfChannels := 1;
				Fbs.CfgReadCyclicPos.ChannelID[0] := 1;
				Fbs.CfgReadCyclicPos.FeedbackMode[0] := mcACP6D_READ_CYCLIC_POSITION;
				Fbs.CfgReadCyclicPos.ShuttleID[0] := 1;
				Fbs.CfgReadCyclicPos.ShuttleID[1] := 2;
				Fbs.CfgReadCyclicPos.Execute := TRUE;
				
				state := ACP6D_CFG_CYCLIC_CHANNEL;
			ELSE
				gMacroLoadIf.Cmd.LoadAll := TRUE;
			END_IF
		ACP6D_CFG_CYCLIC_CHANNEL: 	//******************************************************************************** 6D Confiugring the cyclic channel reads
			IF Fbs.CfgReadCyclicPos.Error THEN
				gAcp6DCtrlIf.Status.Error := TRUE;
				gAcp6DCtrlIf.Status.ErrorID := Fbs.CfgReadCyclicPos.ErrorID;
				
				state := ACP6D_ERROR;
			ELSIF Fbs.CfgReadCyclicPos.Done THEN
				Fbs.CfgReadCyclicPos.Execute := FALSE;
				
				state := ACP6D_READY;
			END_IF
		ACP6D_READY: 	//******************************************************************************** 6D Ready/Running State
			IF(NOT gAcp6DCtrlIf.Cmd.Power)THEN
				gMacroLoadIf.Cmd.Reset := TRUE;
				state := ACP6D_POWER_OFF;
			END_IF;

		ACP6D_ERROR: 	//******************************************************************************** 6D Error State
			gAcp6DCtrlIf.Status.PowerOn := FALSE;
			IF(gAcp6DCtrlIf.Cmd.ErrorReset)THEN
				IF(Fbs.SysReadStateFb.State<>mcACP6D_STATE_ERROR)THEN
					gAcp6DCtrlIf.Cmd.ErrorReset := FALSE;
					state := ACP6D_RESET;
				ELSE
					Fbs.PowerOffFb.Execute := TRUE;	 // Reset error with power off. 
					IF(Fbs.PowerOffFb.Acknowledge)THEN
						gMacroLoadIf.Cmd.Reset := TRUE;
						Fbs.PowerOffFb.Execute 	:= FALSE;
					ELSIF(Fbs.PowerOffFb.Error)THEN
						gAcp6DCtrlIf.Cmd.ErrorReset := FALSE;
						Fbs.PowerOffFb.Execute 	:= FALSE;
						gAcp6DCtrlIf.Status.ErrorID := Fbs.PowerOffFb.ErrorID;
						state := ACP6D_ERROR;
					END_IF;
				END_IF;
			END_IF;		
	END_CASE;

	FOR i:=0 TO gMainIf.Cfg.ShuttleCount - 1 DO
		Fbs.ShReadPositionFb[i].Controller := ADR(gMcAcp6DController);
		Fbs.ShReadPositionFb[i].Enable := TRUE;
		Fbs.ShReadPositionFb[i].ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
		Fbs.ShReadPositionFb[i]();
		
		Fbs.ShReadForceFb[i].Controller := ADR(gMcAcp6DController);
		Fbs.ShReadForceFb[i].Enable := TRUE;
		Fbs.ShReadForceFb[i].ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
		Fbs.ShReadForceFb[i]();
		
		Fbs.ShReadState[i].Controller := ADR(gMcAcp6DController);
		Fbs.ShReadState[i].Enable := TRUE;
		Fbs.ShReadState[i].ShuttleID := gShuttleIf[i].Cfg.ShuttleId;
		Fbs.ShReadState[i]();
		
		gShuttleIf[i].Status.ShuttleInfo.Force.Value := Fbs.ShReadForceFb[i].ForceInfo;
		gShuttleIf[i].Status.ShuttleInfo.Force.Valid := Fbs.ShReadForceFb[i].Valid;
		gShuttleIf[i].Status.ShuttleInfo.Position.Value := Fbs.ShReadPositionFb[i].PositionInfo;
		gShuttleIf[i].Status.ShuttleInfo.Position.Valid := Fbs.ShReadPositionFb[i].Valid;
		gShuttleIf[i].Status.ShuttleInfo.State.Value := Fbs.ShReadState[i].State;
		gShuttleIf[i].Status.ShuttleInfo.State.Valid := Fbs.ShReadState[i].Valid;
	END_FOR;
	
	IF gAcp6DCtrlIf.Cmd.GetErrorInfo THEN
		Fbs.GetErrorCodesFb.Controller := ADR(gMcAcp6DController);
		Fbs.GetErrorCodesFb.Execute := TRUE;
		
		IF Fbs.GetErrorCodesFb.Valid OR Fbs.GetErrorCodesFb.Error THEN
			gAcp6DCtrlIf.Status.ErrorCodes := Fbs.GetErrorCodesFb.ErrorCodes;
			Fbs.GetErrorCodesFb.Execute := FALSE;
			gAcp6DCtrlIf.Cmd.GetErrorInfo := FALSE;
		END_IF
		
	END_IF
	Fbs.CfgReadCyclicPos();
	Fbs.GetErrorCodesFb();
	Fbs.SysReadStateFb();
	Fbs.PowerOffFb();
	Fbs.PowerOnFb();
	Fbs.AutoRefreshFB();
	
	gAcp6DCtrlIf.Status.Ready := state = ACP6D_READY;
	gAcp6DCtrlIf.Status.Error := state = ACP6D_ERROR;
	gAcp6DCtrlIf.Status.ReadyToPowerOn := Fbs.SysReadStateFb.Valid AND Fbs.SysReadStateFb.State = mcACP6D_STATE_INACTIVE;

END_PROGRAM
