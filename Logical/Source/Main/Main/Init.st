

PROGRAM _INIT
	gMainIf.Cfg.ShuttleCount := 1;
	
	//Used to initialize the shuttle indecies.
	FOR i:=0 TO gMainIf.Cfg.ShuttleCount-1 DO
		gShuttleIf[i].Cfg.ShuttleId := i + 1;
	END_FOR;
	 
END_PROGRAM