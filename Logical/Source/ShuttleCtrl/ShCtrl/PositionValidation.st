
(* Validates if a shuttle is in the defined position *)
FUNCTION PositionValidation
	IF CurrentInfo.Valid THEN
		IF CurrentInfo.Value.X >= DestinationPosition.X - 0.00001 
			AND CurrentInfo.Value.X <= DestinationPosition.X + 0.00001 
			AND CurrentInfo.Value.Y >= DestinationPosition.Y - 0.00001 
			AND CurrentInfo.Value.Y <= DestinationPosition.Y + 0.00001 THEN
			PositionValidation := TRUE;
		ELSE
			PositionValidation := FALSE;
		END_IF
		
	ELSE
		PositionValidation := FALSE;
	END_IF
END_FUNCTION

FUNCTION LogDebug
	msg := "";
	typ := "Sh ";
	typ := USINT_TO_WSTRING(Idx);
	MpAuditCustomEvent(MpLink,"DEBUG",typ,Msg);
END_FUNCTION
