
PROGRAM _CYCLIC
	IF gAcp6DCtrlIf.Status.Error THEN
		state := MAIN_ERROR;
	END_IF
	
	CASE state OF
		MAIN_OFF: //******************************************************************************** Main Off State
			IF gMainIf.Cmd.Power THEN
				gAcp6DCtrlIf.Cmd.Power := TRUE;
				
				state := MAIN_INIT;
			END_IF
		MAIN_INIT: //******************************************************************************** Main Initializing State
			IF gAcp6DCtrlIf.Status.PowerOn AND gAcp6DCtrlIf.Status.Ready THEN
				gMainIf.Status.PowerOn := TRUE;
				g6DRecoveryIf.Cmd.Recover := TRUE;
				
				state := MAIN_RECOVERING;
			ELSIF NOT gMainIf.Cmd.Power THEN
				gAcp6DCtrlIf.Cmd.Power := FALSE;
				state := MAIN_OFF;
			END_IF
		MAIN_RECOVERING: //******************************************************************************** Main Recovery State
			IF g6DRecoveryIf.Sts.ReadyToStartProc THEN
				g6DRecoveryIf.Cmd.Recover := FALSE;
				
				state := MAIN_READY;
			END_IF	
		MAIN_READY://******************************************************************************** Main Ready State
			IF gMainIf.Cmd.Start THEN
				gProcessInfoIf.Cmd.Enable := TRUE;
				gVariedMoveDemoIf[0].Cmd.Enable := TRUE;
				gVariedMoveDemoIf[1].Cmd.Enable := TRUE;
				CmdShEnable(TRUE, ADR(gShuttleIf),gMainIf.Cfg.ShuttleCount);
				
				state := MAIN_STARTING;
			ELSIF NOT gMainIf.Cmd.Power THEN
				gMainIf.Status.PowerOn := FALSE;
				gAcp6DCtrlIf.Cmd.Power := FALSE;
				state := MAIN_OFF;
			END_IF
					
		MAIN_STARTING://******************************************************************************** Main Starting State
			
			gMainIf.Cmd.Start := FALSE;
			state := MAIN_RUNNING;
						
		MAIN_RUNNING: //******************************************************************************** Main Running State
			IF gMainIf.Cmd.Stop THEN
				
				state := MAIN_STOPPING;
			END_IF
		MAIN_STOPPING: //******************************************************************************** Main Stopping State
				
			gMainIf.Cmd.Stop := FALSE;
				
			FOR i:=0 TO gMainIf.Cfg.ShuttleCount - 1 DO
				gShuttleIf[i].Status.Recovered := FALSE;
			END_FOR;
				
			state := MAIN_READY;
			
			
		MAIN_ERROR: //******************************************************************************** Main Error State
			IF gMainIf.Cmd.Reset THEN
				gMainIf.Cmd.Reset := FALSE;
				gAcp6DCtrlIf.Cmd.ErrorReset := TRUE;
				
				state := MAIN_OFF;
			END_IF	
	END_CASE; 
	 
END_PROGRAM
