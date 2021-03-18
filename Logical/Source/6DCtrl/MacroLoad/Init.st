

PROGRAM _INIT
	//Enable the macros for robot process
	gMacroLoadIf.Par.MacroList[0].Load := TRUE;
	gMacroLoadIf.Par.MacroList[0].MacroFileName := '128_RobotProcess.xml';
	gMacroLoadIf.Par.MacroList[0].MacroID := 128;
	
	gMacroLoadIf.Par.MacroList[1].Load := TRUE;
	gMacroLoadIf.Par.MacroList[1].MacroFileName := '129_RobotProcess.xml';
	gMacroLoadIf.Par.MacroList[1].MacroID := 129;
	
	//Enable the macros for Group 0 recovery
	gMacroLoadIf.Par.MacroList[2].Load := TRUE;
	gMacroLoadIf.Par.MacroList[2].MacroFileName := '135_RecoveryGroup0.xml';
	gMacroLoadIf.Par.MacroList[2].MacroID := 135;
	
	gMacroLoadIf.Par.MacroList[3].Load := TRUE;
	gMacroLoadIf.Par.MacroList[3].MacroFileName := '136_RecoveryGroup1.xml';
	gMacroLoadIf.Par.MacroList[3].MacroID := 136;
	
	//Define the parameters for the macro load IF
	gMacroLoadIf.Par.FileDevice := '6DMacro';
END_PROGRAM