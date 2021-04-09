(*Angled Movement Function block*)

TYPE
	AngledMovementInternalTyp : 	STRUCT 
		state : AngledMovementInternalStateEnum;
		Fbs : AngledMovementInternalFbsTyp;
		ShPos : ARRAY[0..5]OF REAL;
		MovementNum : USINT;
	END_STRUCT;
	AngledMovementInternalFbsTyp : 	STRUCT 
		Move6DFb : MC_BR_Move6D_Acp6D;
	END_STRUCT;
	AngledMovementInternalStateEnum : 
		(
		ANG_INT_OFF,
		ANG_INT_MOV_WAIT,
		ANG_INT_MOV_1,
		ANG_INT_MOV_2,
		ANG_INT_MOV_3,
		ANG_INT_MOV_4,
		ANG_INT_MOV_5,
		ANG_INT_MOV_6,
		ANG_INT_MOV_7,
		ANG_INT_MOV_8,
		ANG_INT_MOV_9,
		ANG_INT_MOV_10,
		ANG_INT_DONE,
		ANG_INT_ERROR
		);
END_TYPE

(*"wobble movement function block"*)

TYPE
	WobbleMovInternalTyp : 	STRUCT 
		state : WobbleMovStateEnum;
		Fbs : WobbleMovInternalFbsTyp;
	END_STRUCT;
	WobbleMovInternalFbsTyp : 	STRUCT 
		VirtualMacroFb : MC_BR_MacroRun_Acp6D;
		RealMacroFb : MC_BR_MacroRun_Acp6D;
		PlanetCtrlFb : MC_BR_PlanetCtrl_Acp6D;
		StopFb : MC_BR_Stop_Acp6D;
		Move6DFb : MC_BR_Move6D_Acp6D;
	END_STRUCT;
	WobbleMovStateEnum : 
		(
		WOB_INT_OFF,
		WOB_INT_SETUP_PLANET,
		WOB_INT_MACRO_RUN,
		WOB_INT_STOP,
		WOB_INT_REORIENT,
		WOB_INT_BREAK_PLANET,
		WOB_INT_DONE,
		WOB_INT_ERROR
		);
END_TYPE
