

PROGRAM _INIT
	gPrintStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
	//Define station configuration values
	gPrintStationIf.Cfg.StationPos.X := 0.30;
	gPrintStationIf.Cfg.StationPos.Y := 0.06;
	
	gPrintStationIf.Par.PrintAccel := 0.30;
	gPrintStationIf.Par.PrintVel := 0.2302; //8 in/s
	gPrintStationIf.Par.PrintEndVel :=  0.0;
	gPrintStationIf.Par.PrintDistanceX := 0.12;
	gPrintStationIf.Par.PrintDistanceY := 0;
	 
END_PROGRAM
