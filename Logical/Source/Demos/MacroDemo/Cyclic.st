(*
	This demo connects to the HMI to run pre configured macros on shuttles. Move the shuttle in the desired starting position BEFORE executing the demo (or ensure the macro moves the shuttle to the desired starting location)	
*)
PROGRAM _CYCLIC
	//Steps
	
	(*
		Wait for a command to execute
			If in FileMode, load the defined macro on to the controller
			If not, execute the macro on the defined shuttle
		Macro Load
			when completed, exectue the macro on the defined shuttle
		Macro Run
			When acknowledged, head to the done state
		Done
			When cmd dropped, move to reset
		Reset
			Reset all bits and head back to the idle state
		Error
			wait for a reset command and then move to the reset state
	
	*)
	 
	CASE state OF
		MD_IDLE://******************************************************************************** Idle state waiting for a command
			IF macroDemoIf.Cmd.Run THEN
				demoFbs.LoadMacroFb.Controller := ADR(gMcAcp6DController);
				demoFbs.RunMacroFb.Controller := ADR(gMcAcp6DController);
				demoFbs.RunMacroFb.ShuttleID := macroDemoIf.Par.ShId;
				
				CASE macroDemoIf.Par.Mode OF
					mdFILE:
						state := MD_LOAD_FILE;
					mdID:
						state := MD_RUN_MACRO;
				END_CASE;
			END_IF
		MD_LOAD_FILE://******************************************************************************** Demo is loading the defined file
			demoFbs.LoadMacroFb.FileDevice := macroDemoIf.Cfg.FileDevice;
			demoFbs.LoadMacroFb.FileName := macroDemoIf.Par.MacroFileName;
			demoFbs.LoadMacroFb.MacroID := macroDemoIf.Par.MacroId;
			demoFbs.LoadMacroFb.Execute := TRUE;
			
			IF demoFbs.LoadMacroFb.Error THEN
				macroDemoIf.Sts.Error := TRUE;
				
				state := MD_ERROR;
			ELSIF demoFbs.LoadMacroFb.Done THEN
				demoFbs.LoadMacroFb.Execute := FALSE;
				
				state := MD_RUN_MACRO;
			END_IF
			
						
		MD_RUN_MACRO://******************************************************************************** Demo is running the defined macro
			demoFbs.RunMacroFb.MacroID := macroDemoIf.Par.MacroId;
			demoFbs.RunMacroFb.Execute := TRUE;
			
			IF demoFbs.RunMacroFb.Error THEN
				macroDemoIf.Sts.Error := TRUE;
				
				state := MD_ERROR;
			ELSIF demoFbs.RunMacroFb.Acknowledge THEN
				demoFbs.RunMacroFb.Execute := FALSE;
				
				state := MD_DONE;
			END_IF
		MD_DONE://******************************************************************************** Demo has compelted
			state := MD_RESET;
		MD_RESET://******************************************************************************** Demo resetting all values/variables/fbs
			macroDemoIf.Cmd.Run := FALSE;
			macroDemoIf.Cmd.Reset := FALSE;
			
			demoFbs.RunMacroFb.Execute := FALSE;
			demoFbs.LoadMacroFb.Execute := FALSE;
			
			macroDemoIf.Sts.Error := FALSE;
			macroDemoIf.Sts.Running := FALSE;
			
			state := MD_IDLE;
		MD_ERROR://******************************************************************************** Demo in error state
			IF macroDemoIf.Cmd.Reset THEN
				state := MD_RESET;
			END_IF
	END_CASE;
	
	demoFbs.LoadMacroFb();
	demoFbs.RunMacroFb();
END_PROGRAM
