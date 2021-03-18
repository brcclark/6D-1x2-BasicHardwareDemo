

PROGRAM _INIT
	gLoadStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
	//Define station configuration values
	gLoadStationIf.Cfg.StationPos.X := 0.060;
	gLoadStationIf.Cfg.StationPos.Y := 0.180;
	
	gLoadStationIf.Par.WaitTime := T#2s;
	
END_PROGRAM