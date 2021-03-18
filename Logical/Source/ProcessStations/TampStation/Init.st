

PROGRAM _INIT
	gTampStationIf.Par.ShuttleIdx := STATION_IS_EMPTY;
	//Define station configuration values
	gTampStationIf.Cfg.StationPos.X := 0.660;
	gTampStationIf.Cfg.StationPos.Y := 0.06;
	
	gTampStationIf.Par.Accel := 0.30;
	gTampStationIf.Par.Vel := 0.508;
	gTampStationIf.Par.EndVel := 0;
	gTampStationIf.Par.EntranceMovement.DistX := 0.18;
	gTampStationIf.Par.EntranceMovement.DistY := 0.06;
	gTampStationIf.Par.TampHeight := 0.002;
	gTampStationIf.Par.ExitMovement.DistX := -0.18;
	gTampStationIf.Par.ExitMovement.DistY := 0.06;
	gTampStationIf.Par.WaitTime := T#100ms;
	 
END_PROGRAM