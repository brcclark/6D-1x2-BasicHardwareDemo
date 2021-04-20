

PROGRAM _INIT
	station := ST1;

	gVariedMoveDemoIf[0].Par.StationType := ST1;
	gVariedMoveDemoIf[0].Cmd.Enable := TRUE;
	gVariedMoveDemoIf[0].Cfg.StationPos.X := 0.12;
	gVariedMoveDemoIf[0].Cfg.StationPos.Y := 0.12;
	gVariedMoveDemoIf[1].Par.StationType := ST2;
	gVariedMoveDemoIf[1].Cmd.Enable := TRUE;
	gVariedMoveDemoIf[1].Cfg.StationPos.X := 0.36;
	gVariedMoveDemoIf[1].Cfg.StationPos.Y := 0.12;
	
	stationPars.Vel := 1.0;
	stationPars.Accel := 10.0;
	
	stationFbs[0].St1Fb.LinearVel := 0.5;// m/s
	stationFbs[0].St1Fb.ShortAxisRotVel := 0.5;//rad/s
	stationFbs[1].St1Fb.LinearVel := 0.5;// m/s
	stationFbs[1].St1Fb.ShortAxisRotVel := 0.5;//rad/s
END_PROGRAM