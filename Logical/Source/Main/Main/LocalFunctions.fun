
{REDUND_ERROR} FUNCTION CmdShEnable : BOOL (*Provides interface to group enable command for all shuttles*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		ShIfs : REFERENCE TO ARRAY[0..MAX_SHUTTLE_COUNT_ARRAY] OF gShuttleIfTyp;
		ShCount : USINT;
	END_VAR
	VAR
		Internal : CmdShEnableInternalTyp;
	END_VAR
END_FUNCTION
