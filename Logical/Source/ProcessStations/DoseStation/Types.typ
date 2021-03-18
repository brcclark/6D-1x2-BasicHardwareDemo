
TYPE
	DoseStationStateEnum : 
		(
		DOSE_OFF, (*Dose station is currently disabled*)
		DOSE_INIT, (*Dose station is initalizing*)
		DOSE_WAIT_FOR_SHUTTLE, (*Dose station is waiting for a shuttle to be present*)
		DOSE_INDEX_SHUTTLE, (*Dose station is indexing to the next dosing position*)
		DOSE_DOSING, (*Dose station is preforming the dosing process*)
		DOSE_DONE, (*Dose station is done with the dosing process*)
		DOSE_ERROR (*Dose station had an error*)
		);
	DoseStationFbTyp : 	STRUCT 
		DoseMoveFb : MC_BR_MoveInPlane_Acp6D;
		WaitTimer : TON;
	END_STRUCT;
END_TYPE
