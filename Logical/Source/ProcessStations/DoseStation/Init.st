

PROGRAM _INIT
	ST_name(0,ADR(taskName),0);
	
	IF taskName = 'DoseSt1' THEN
		pDoseIf ACCESS ADR(gDoseStationsIf[0]);
	ELSIF taskName = 'DoseSt2' THEN
		pDoseIf ACCESS ADR(gDoseStationsIf[1]);
	END_IF
	
	gDoseStationsIf[0].Cfg.StationPos.X := 0.3;
	gDoseStationsIf[0].Cfg.StationPos.Y := 0.66;
	
	gDoseStationsIf[1].Cfg.StationPos.X := 0.66;
	gDoseStationsIf[1].Cfg.StationPos.Y := 0.66;
	
	pDoseIf.Par.ShuttleIdx := STATION_IS_EMPTY;
	pDoseIf.Par.Accel := 0.3;
	pDoseIf.Par.Vel := 0.508;
	pDoseIf.Par.EndVel := 0.0;
	pDoseIf.Par.FirstCavityPosition.DistY := 0.03;
	pDoseIf.Par.FirstCavityPosition.DistX := 0.0;
	
	pDoseIf.Par.SpaceBetweenCavities.DistY := 0.03;
	pDoseIf.Par.SpaceBetweenCavities.DistX := 0;
	pDoseIf.Par.NumRowsOfCavities := 3;
	pDoseIf.Par.WaitTime := T#2s;
END_PROGRAM