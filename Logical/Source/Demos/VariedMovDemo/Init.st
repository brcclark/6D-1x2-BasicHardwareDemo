

PROGRAM _INIT
	station := ST1;

	gVariedMoveDemoIf[0].Par.ShuttleIdx := STATION_IS_EMPTY;
	gVariedMoveDemoIf[0].Par.StationType := ST1;
	gVariedMoveDemoIf[1].Par.ShuttleIdx := STATION_IS_EMPTY;
	gVariedMoveDemoIf[1].Par.StationType := ST2;
	
	stationPars.Vel := 1.0;
	stationPars.Accel := 10.0;
	
	stationFbs[0].St1Fb.LinearVel := 0.5;// m/s
	stationFbs[0].St1Fb.ShortAxisRotVel := 1.0;//rad/s
	stationFbs[1].St1Fb.LinearVel := 0.5;// m/s
	stationFbs[1].St1Fb.ShortAxisRotVel := 1.0;//rad/s
END_PROGRAM