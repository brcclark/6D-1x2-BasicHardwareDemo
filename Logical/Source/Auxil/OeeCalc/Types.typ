
TYPE
	ProcThroughputTyp : 	STRUCT 
		Enable : BOOL;
		Reset : BOOL;
		ProductCounter : UDINT;
		New_Member : USINT;
	END_STRUCT;
	ThroughputCalcInternalTyp : 	STRUCT 
		startTime : UDINT;
		state : ThroughputCalcInternalStateEnum;
		timeSinceStart : TIME;
		AvgCycleTimeUdint : UDINT;
	END_STRUCT;
	ThroughputCalcInternalStateEnum : 
		(
		TC_OFF,
		TC_INIT,
		TC_CALC,
		TC_ERROR
		);
END_TYPE
