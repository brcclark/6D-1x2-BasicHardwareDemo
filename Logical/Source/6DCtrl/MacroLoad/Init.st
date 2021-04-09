

PROGRAM _INIT
	
		//Fill Station 2
	gMacroLoadIf.Par.MacroList[0].Load := TRUE;
	gMacroLoadIf.Par.MacroList[0].MacroFileName := '140_FillStation2.xml';
	gMacroLoadIf.Par.MacroList[0].MacroID := 140;
	
	//Fill Station 3
	//XY Macro
	gMacroLoadIf.Par.MacroList[1].Load := TRUE;
	gMacroLoadIf.Par.MacroList[1].MacroFileName := '141_FillStation3XY.xml';
	gMacroLoadIf.Par.MacroList[1].MacroID := 141;
	//Wobble Macro
	gMacroLoadIf.Par.MacroList[2].Load := TRUE;
	gMacroLoadIf.Par.MacroList[2].MacroFileName := '142_FillStation3Wobble.xml';
	gMacroLoadIf.Par.MacroList[2].MacroID := 142;
	
	//Fill Station 4 Macro
	gMacroLoadIf.Par.MacroList[3].Load := TRUE;
	gMacroLoadIf.Par.MacroList[3].MacroFileName := '143_FillStation4.xml';
	gMacroLoadIf.Par.MacroList[3].MacroID := 143;
	
	//Enable the macros for Group 0 recovery
	gMacroLoadIf.Par.MacroList[4].Load := TRUE;
	gMacroLoadIf.Par.MacroList[4].MacroFileName := '135_RecoveryGroup0.xml';
	gMacroLoadIf.Par.MacroList[4].MacroID := 135;
	
	//Letter A Pattern
	gMacroLoadIf.Par.MacroList[5].Load := TRUE;
	gMacroLoadIf.Par.MacroList[5].MacroFileName := '170_LetterAPattern.xml';
	gMacroLoadIf.Par.MacroList[5].MacroID := 170;
	
	//Letter B Pattern
	gMacroLoadIf.Par.MacroList[6].Load := TRUE;
	gMacroLoadIf.Par.MacroList[6].MacroFileName := '171_LetterBPattern.xml';
	gMacroLoadIf.Par.MacroList[6].MacroID := 171;
	
	
	//Define the parameters for the macro load IF
	gMacroLoadIf.Par.FileDevice := '6DMacro';
END_PROGRAM