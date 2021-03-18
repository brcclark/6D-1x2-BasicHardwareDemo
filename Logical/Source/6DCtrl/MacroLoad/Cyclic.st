
PROGRAM _CYCLIC
	CASE state OF
		MACLOAD_IDLE:	//******************************************************************************** Macro Idle State
			IF gMacroLoadIf.Cmd.LoadAll OR gMacroLoadIf.Cmd.LoadSingle THEN
				gMacroLoadIf.Status.AllMacrosLoaded := FALSE;
				gMacroLoadIf.Status.Loading := TRUE;
				gMacroLoadIf.Status.CurrentMacro := 0;
				
				state := MACLOAD_COUNT_CHECK;
			ELSIF gMacroLoadIf.Cmd.Clear THEN
				MacroFbs.MacroClearFb.Controller := ADR(gMcAcp6DController);
				MacroFbs.MacroClearFb.MacroID := gMacroLoadIf.Par.SingleMacroLoad.MacroID;
				MacroFbs.MacroClearFb.Execute := TRUE;
				
				state := MACLOAD_CLEAR;
			ELSIF gMacroLoadIf.Cmd.Reset THEN
				gMacroLoadIf.Status.AllMacrosLoaded := FALSE;
				gMacroLoadIf.Cmd.Reset := FALSE;
			END_IF
			
		MACLOAD_LOAD://******************************************************************************** Macro Load State
			IF MacroFbs.MacroLoadFb.Error THEN
				gMacroLoadIf.Status.Error := TRUE;
				gMacroLoadIf.Status.MacroIDError := gMacroLoadIf.Status.CurrentMacro;
				
				state := MACLOAD_ERROR;
			ELSIF MacroFbs.MacroLoadFb.Done THEN
				MacroFbs.MacroLoadFb.Execute := FALSE;
				IF gMacroLoadIf.Cmd.LoadSingle THEN
					gMacroLoadIf.Status.CmdDone := TRUE;
				ELSE //Means we commanded a "LOAD ALL"
					gMacroLoadIf.Status.CurrentMacro := gMacroLoadIf.Status.CurrentMacro + 1;
					
					state := MACLOAD_COUNT_CHECK;
				END_IF
			END_IF
			
		MACLOAD_COUNT_CHECK: //******************************************************************************** Macro Count check State
			IF gMacroLoadIf.Par.MacroList[gMacroLoadIf.Status.CurrentMacro].Load THEN
				MacroFbs.MacroLoadFb.Controller := ADR(gMcAcp6DController);
				MacroFbs.MacroLoadFb.FileDevice := gMacroLoadIf.Par.FileDevice;
				IF gMacroLoadIf.Cmd.LoadAll THEN
					MacroFbs.MacroLoadFb.MacroID := gMacroLoadIf.Par.MacroList[gMacroLoadIf.Status.CurrentMacro].MacroID;
					MacroFbs.MacroLoadFb.FileName := gMacroLoadIf.Par.MacroList[gMacroLoadIf.Status.CurrentMacro].MacroFileName;
					
				ELSIF gMacroLoadIf.Cmd.LoadSingle THEN
					MacroFbs.MacroLoadFb.MacroID := gMacroLoadIf.Par.SingleMacroLoad.MacroID;
					MacroFbs.MacroLoadFb.FileName := gMacroLoadIf.Par.SingleMacroLoad.MacroFileName;
				END_IF
				MacroFbs.MacroLoadFb.Execute := TRUE;
				state := MACLOAD_LOAD;
			ELSE
				gMacroLoadIf.Status.CurrentMacro := gMacroLoadIf.Status.CurrentMacro + 1;
				IF gMacroLoadIf.Status.CurrentMacro >= MAX_MACRO_COUNT THEN
					gMacroLoadIf.Status.AllMacrosLoaded := TRUE;
					gMacroLoadIf.Status.CmdDone := TRUE;
						
					state := MACLOAD_DONE;
				END_IF	
			END_IF
		MACLOAD_CLEAR: //******************************************************************************** Macro Clear state 
			IF MacroFbs.MacroClearFb.Error THEN
				gMacroLoadIf.Status.Error := TRUE;
				
				state := MACLOAD_ERROR;
			ELSIF MacroFbs.MacroClearFb.Done THEN
				MacroFbs.MacroClearFb.Execute := FALSE;
				gMacroLoadIf.Status.CmdDone := TRUE;
				
				state := MACLOAD_DONE;
			END_IF
		MACLOAD_DONE: //******************************************************************************** Load Done State
			gMacroLoadIf.Status.Loading := FALSE;
			IF NOT gMacroLoadIf.Cmd.Clear AND NOT gMacroLoadIf.Cmd.LoadAll AND NOT gMacroLoadIf.Cmd.LoadSingle THEN
				gMacroLoadIf.Status.CmdDone := FALSE;
				state := MACLOAD_IDLE;
			END_IF
		MACLOAD_ERROR: //******************************************************************************** Macro load error State
			IF gMacroLoadIf.Cmd.Reset THEN
				MacroFbs.MacroClearFb.Execute := FALSE;
				MacroFbs.MacroLoadFb.Execute := FALSE;
				
				gMacroLoadIf.Cmd.Reset := FALSE;
				
				gMacroLoadIf.Status.Loading := FALSE;
				gMacroLoadIf.Status.AllMacrosLoaded := FALSE;
				gMacroLoadIf.Status.Error := FALSE;
				gMacroLoadIf.Status.MacroIDError := 0;
				state := MACLOAD_IDLE;
			END_IF
	END_CASE;
	
	//FB Calls
	MacroFbs.MacroLoadFb();
	MacroFbs.MacroClearFb();
END_PROGRAM


