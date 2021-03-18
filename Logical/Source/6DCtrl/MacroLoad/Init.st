

PROGRAM _INIT
	//Enable the macros for loading
	gMacroLoadIf.Par.MacroList[0].Load := TRUE;
	gMacroLoadIf.Par.MacroList[0].MacroFileName := '128_RobotSyncDemo.xml';
	gMacroLoadIf.Par.MacroList[0].MacroID := 128;
	
	//Define the parameters for the macro load IF
	gMacroLoadIf.Par.FileDevice := '6DMacro';
END_PROGRAM