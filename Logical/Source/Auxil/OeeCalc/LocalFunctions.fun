
{REDUND_ERROR} FUNCTION_BLOCK ThroughputCounterFb (*Function block that provides a simple PPM calculator*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL; (*Enable the calculation*)
		Reset : BOOL; (*Reset the buffer values*)
		ProductCounter : UDINT; (*Product counter*)
	END_VAR
	VAR_OUTPUT
		AvgCycleTime : {REDUND_UNREPLICABLE} TIME; (*Calculated avergage cycle time per product*)
		PPM : {REDUND_UNREPLICABLE} REAL; (*Extrapolated calculation of PPM*)
		PPH : {REDUND_UNREPLICABLE} REAL; (*Extrapolated calculation of PPH*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ThroughputCalcInternalTyp;
	END_VAR
END_FUNCTION_BLOCK
