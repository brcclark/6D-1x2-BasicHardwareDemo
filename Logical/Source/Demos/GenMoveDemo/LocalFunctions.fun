
{REDUND_ERROR} FUNCTION_BLOCK genLapsFb (*Runs a 2 shuttle lap demo on a 1x2 6d layout*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL;
		Controller : REFERENCE TO McAcp6DControllerType;
		Velocity : REAL;
		Accel : REAL;
		NumLaps : USINT;
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL;
		Done : {REDUND_UNREPLICABLE} BOOL;
		Error : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		internal : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK
