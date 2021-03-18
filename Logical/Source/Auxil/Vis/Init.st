

PROGRAM _INIT
	FOR idx := 0 TO gMainIf.Cfg.ShuttleCount - 1 DO
		Vis.Shuttles[idx].ID := idx+1;
	END_FOR;
END_PROGRAM