
TYPE
	UnloadStationStateEnum : 
		(
		UNLOAD_OFF, (*Unload station is currently disabled*)
		UNLOAD_INIT, (*Unload station is initalizing*)
		UNLOAD_WAIT_FOR_SHUTTLE, (*Unload station is waiting for a shuttle to be present*)
		UNLOAD_UNLOADING, (*Unload station is loading product onto a shuttle*)
		UNLOAD_DONE, (*Unload station is done with the load process*)
		UNLOAD_ERROR (*Unload station had an error*)
		);
	UnloadStationFbTyp : 	STRUCT 
		UnloadTimerFb : TON;
	END_STRUCT;
END_TYPE
