(*Datatypes for the Load Macro Interface*)

TYPE
	gMacroLoadIfTYp : 	STRUCT 
		Cmd : gMacroLoadIfCmdTyp;
		Par : gMacroLoadIfParTyp;
		Status : gMacroLoadIfStatusTyp;
	END_STRUCT;
	gMacroLoadIfCmdTyp : 	STRUCT 
		LoadAll : BOOL; (*Command to load all macros*)
		Clear : BOOL; (*Command to clear a singular macro*)
		LoadSingle : BOOL; (*Commadn to load a singular macro*)
		Reset : BOOL; (*Command to reset the macro load interface. Also resets the "AllMacroLoaded" status*)
	END_STRUCT;
	MacroParTyp : 	STRUCT 
		Load : BOOL; (*Flag To denote that we should load the macro*)
		MacroFileName : STRING[80]; (*XML File Name of the Macro to load*)
		MacroID : USINT; (*MacroID of the associated macro*)
	END_STRUCT;
	gMacroLoadIfParTyp : 	STRUCT 
		FileDevice : STRING[80]; (*FileDevice to find the macro *)
		MacroList : ARRAY[0..MAX_MACRO_COUNT_ARRAY]OF MacroParTyp; (*List of macros to load*)
		SingleMacroLoad : MacroParTyp; (*Parameter to load a singular macro*)
	END_STRUCT;
	gMacroLoadIfStatusTyp : 	STRUCT 
		AllMacrosLoaded : BOOL;
		Loading : BOOL;
		CurrentMacro : USINT;
		CmdDone : BOOL;
		Error : BOOL;
		MacroIDError : USINT;
	END_STRUCT;
END_TYPE
