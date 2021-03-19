
TYPE
	ShFbsTyp : 	STRUCT 
		ShRunMacroFb : MC_BR_MacroRun_Acp6D; (*Execute a macro on the current shuttle*)
		ReadCyclicPosX : MC_BR_ReadCyclicChAxis_Acp6D;
		ReadCyclicPosY : MC_BR_ReadCyclicChAxis_Acp6D;
		MovePlane : MC_BR_MoveInPlane_Acp6D;
		Stop : MC_BR_Stop_Acp6D;
	END_STRUCT;
END_TYPE
