(*Laps Internal Type*)

TYPE
	GenLapsDemoInternalTyp : 	STRUCT 
		state : USINT;
		lapCounter : USINT;
		Fbs : USINT;
	END_STRUCT;
	GenLapsDemoFbsTyp : 	STRUCT 
		AsyncMoveFb : MC_BR_MoveInPlaneAsync_Acp6D;
		MovePlaneFb : MC_BR_MoveInPlane_Acp6D;
		MoveArcFb : MC_BR_MoveArcAngle_Acp6D;
		BufferCtrlFb : MC_BR_BufferCtrl_Acp6D;
	END_STRUCT;
	GenLapsStateEnum : 
		(
		LAPS_OFF, (*Off state*)
		LAPS_INIT, (*Init state*)
		LAPS_ASYNC_WAIT, (*Waiting for Aysync Move to complete*)
		LAPS_BLOCK_BUFFER, (*Waiting for Block Cmd*)
		LAPS_MOVE_OVER,
		LAPS_MOVE_ARC,
		LAPS_MOVE_OVER2,
		LAPS_MOVE_ARC2,
		LAPS_RELEASE_BUFFER,
		LAPS_DONE,
		LAPS_ERROR
		);
END_TYPE
