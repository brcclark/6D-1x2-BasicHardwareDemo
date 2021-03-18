
FUNCTION LogDebug : USINT
	VAR_INPUT
		MpLink : MpComIdentType;
		Idx : USINT;
		Msg : WSTRING[100];
	END_VAR
	VAR
		msg : WSTRING[100];
		typ : WSTRING[100];
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION PositionValidation : BOOL (*Validates if a shuttle is in the defined position*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		DestinationPosition : REFERENCE TO StationPositionTyp;
		CurrentInfo : REFERENCE TO Acp6DShuttlePosInfoTyp;
	END_VAR
END_FUNCTION
