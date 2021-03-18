
TYPE
	TampStationStateEnum : 
		(
		TAMP_OFF, (*Tamp station is currently disabled*)
		TAMP_INIT, (*Tamp station is initalizing*)
		TAMP_WAIT_FOR_SHUTTLE, (*Tamp station is waiting for a shuttle to be present*)
		TAMP_ENTER_STATION, (*Tamp station is sending the shuttle to the tamp position*)
		TAMP_TAMP_RAISE, (*Tamp station is preforming the lift for the tamp process*)
		TAMP_TAMPING, (*Tamp station is waiting at the tamp height*)
		TAMP_TAMP_LOWER, (*Tamp station is performing the lower for the tamp process*)
		TAMP_EXIT_STATION, (*Tamps tation is sending the shuttle to the exit point*)
		TAMP_DONE, (*Tamp station is done with the dosing process*)
		TAMP_ERROR (*Tamp station had an error*)
		);
	TampStationFbTyp : 	STRUCT 
		TampMoveFb : MC_BR_MoveInPlane_Acp6D;
		ShortAxisFb : MC_BR_MoveShortAxis_Acp6D;
		WaitTimer : TON;
	END_STRUCT;
END_TYPE
