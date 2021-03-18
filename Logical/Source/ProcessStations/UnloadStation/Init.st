

PROGRAM _INIT
	gUnloadStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
	//Define station configuration values
	gUnloadStationIf.Cfg.StationPos.X := 0.060;
	gUnloadStationIf.Cfg.StationPos.Y := 0.3;
	 
	gUnloadStationIf.Par.WaitTime := T#2s;
END_PROGRAM