
TYPE
	PrintStationStateEnum : 
		(
		PRINT_OFF, (*Print station is currently disabled*)
		PRINT_INIT, (*Print station is initalizing*)
		PRINT_WAIT_FOR_SHUTTLE, (*Print station is waiting for a shuttle to be present*)
		PRINT_PRINTING, (*Print station is moving through the print process*)
		PRINT_DONE, (*Print station is done with the print process*)
		PRINT_ERROR (*Print station had an error*)
		);
	PrintStationFbTyp : 	STRUCT 
		PrintMoveFb : MC_BR_MoveInPlane_Acp6D;
	END_STRUCT;
END_TYPE
