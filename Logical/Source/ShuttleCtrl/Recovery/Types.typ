
TYPE
	RecoveryFbs : 	STRUCT 
		AsyncMoveFb : MC_BR_MoveInPlaneAsync_Acp6D;
		MacroRunFb : ARRAY[0..MAX_SHUTTLE_COUNT_ARRAY]OF MC_BR_MacroRun_Acp6D;
	END_STRUCT;
	RecoveryStateEnum : 
		(
		RECOVER_IDLE, (*Recovery is in an idle state*)
		RECOVER_INIT, (*Initalize recovery state*)
		RECOVER_AUTODRIVE, (*Preform autodrive movement for recovery*)
		RECOVER_WAIT_ALL_RECOVER, (*Preform the loop through all shuttles to accomplish the reocvery*)
		RECOVER_DONE, (*Recovery has been completed*)
		RECOVER_ERROR (*Recovery had an error*)
		);
END_TYPE
