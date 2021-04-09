
{REDUND_ERROR} FUNCTION_BLOCK AngledMovementFb (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Execute : BOOL;
		Controller : REFERENCE TO McAcp6DControllerType;
		ShuttleId : USINT;
		PosStartX : REAL;
		PosStartY : REAL;
		LinearVel : REAL;
		ShortAxisRotVel : REAL;
	END_VAR
	VAR_OUTPUT
		Active : BOOL;
		Done : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : AngledMovementInternalTyp;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK WobbleMovementFb (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Execute : BOOL;
		Controller : REFERENCE TO McAcp6DControllerType;
		ShuttleId : USINT;
		VirtShId : USINT;
		SunMacroID : USINT;
		PlanetMacroID : USINT;
		PosStartX : REAL;
		PosStartY : REAL;
	END_VAR
	VAR_OUTPUT
		Active : BOOL;
		Done : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : WobbleMovInternalTyp;
	END_VAR
END_FUNCTION_BLOCK
