
(* Provides interface to group enable command for all shuttles *)
FUNCTION CmdShEnable
	Internal.EnableCheck := TRUE;
	FOR Internal.i:=0 TO ShCount-1 DO
		ShIfs[Internal.i].Cmd.Enable := Enable;
	END_FOR;
	CmdShEnable := Internal.EnableCheck;
END_FUNCTION
