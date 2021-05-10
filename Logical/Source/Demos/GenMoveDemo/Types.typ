
TYPE
	GenMoveDemoIf : 	STRUCT 
		Cmds : GenMoveDemoIfCmdTyp;
		Sts : GenMoveIfStsTyp;
	END_STRUCT;
	GenMoveDemoIfCmdTyp : 	STRUCT 
		RunDemo : BOOL;
		Reset : BOOL;
	END_STRUCT;
	GenMoveIfParTyp : 	STRUCT 
	END_STRUCT;
	GenMoveIfStsTyp : 	STRUCT 
		Running : BOOL;
	END_STRUCT;
	GenMoveIfStateEnum : 
		(
		GEN_IDLE,
		GEN_INIT,
		GEN_LAPS,
		GEN_ORBIT,
		GEN_SQUARE,
		GEN_COUPLED_LAP,
		GEN_CIRCLE,
		GEN_6DOF,
		GEN_ERROR
		);
	GenMoveFbsTyp : 	STRUCT 
	END_STRUCT;
END_TYPE
