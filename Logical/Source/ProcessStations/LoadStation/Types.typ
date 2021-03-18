
TYPE
	LoadStationStateEnum : 
		(
		LOAD_OFF, (*Load station is currently disabled*)
		LOAD_INIT, (*Load station is initalizing*)
		LOAD_HOME_MASTER, (*Load station need to home the master axis*)
		LOAD_WAIT_FOR_SHUTTLE, (*Load station is waiting for a shuttle to be present*)
		LOAD_LOADING, (*Load station is loading product onto a shuttle*)
		LOAD_DONE, (*Load station is done with the load process*)
		LOAD_ERROR (*Load station had an error*)
		);
	LoadStationFbTyp : 	STRUCT 
		LoadTimerFb : TON;
	END_STRUCT;
END_TYPE
