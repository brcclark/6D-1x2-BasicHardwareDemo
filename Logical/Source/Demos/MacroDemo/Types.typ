
TYPE
	MacroDemoStateEnum : 
		(
		MD_IDLE,
		MD_LOAD_FILE,
		MD_RUN_MACRO,
		MD_DONE,
		MD_RESET,
		MD_ERROR
		);
	MacroDemoModeEnum : 
		(
		mdFILE,
		mdID
		);
	MacroDemoIfTyp : 	STRUCT 
		Cmd : MacroDemoCmdTyp;
		Cfg : MacroDemoCfgTyp;
		Par : MacroDemoParTyp;
		Sts : MacroDemoStsTyp;
	END_STRUCT;
	MacroDemoCmdTyp : 	STRUCT 
		Run : BOOL;
		Reset : BOOL;
	END_STRUCT;
	MacroDemoCfgTyp : 	STRUCT 
		FileDevice : STRING[80];
	END_STRUCT;
	MacroDemoParTyp : 	STRUCT 
		ShId : USINT;
		MacroId : USINT;
		MacroFileName : STRING[80];
		Mode : MacroDemoModeEnum;
	END_STRUCT;
	MacroDemoStsTyp : 	STRUCT 
		Running : BOOL;
		Error : BOOL;
	END_STRUCT;
	MacroDemoFbsTyp : 	STRUCT 
		LoadMacroFb : MC_BR_MacroLoad_Acp6D;
		RunMacroFb : MC_BR_MacroRun_Acp6D;
	END_STRUCT;
END_TYPE
