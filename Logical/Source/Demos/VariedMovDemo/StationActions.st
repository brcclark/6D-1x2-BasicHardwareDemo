
ACTION SetupStationActions: 
	CASE gVariedMoveDemoIf[i].Par.StationType OF
		ST1:
			stationFbs[i].St1Fb.Execute := TRUE;
			stationFbs[i].St1Fb.Controller := ADR(gMcAcp6DController);
			stationFbs[i].St1Fb.ShuttleId := gShuttleIf[gVariedMoveDemoIf[i].Par.ShuttleIdx].Cfg.ShuttleId;
			stationFbs[i].St1Fb.PosStartX := gVariedMoveDemoIf[i].Cfg.StationPos.X;
			stationFbs[i].St1Fb.PosStartY := gVariedMoveDemoIf[i].Cfg.StationPos.Y;
		ST2:
			stationFbs[i].St2Fb.Controller := ADR(gMcAcp6DController);
			stationFbs[i].St2Fb.MacroID := DINT_TO_USINT(140);
			stationFbs[i].St2Fb.ShuttleID := gShuttleIf[gVariedMoveDemoIf[i].Par.ShuttleIdx].Cfg.ShuttleId;
			stationFbs[i].St2Fb.Execute := TRUE;
		ST3:
			stationFbs[i].St3Fb.Controller := ADR(gMcAcp6DController);
			stationFbs[i].St3Fb.PosStartX := gVariedMoveDemoIf[i].Cfg.StationPos.X;
			stationFbs[i].St3Fb.PosStartY := gVariedMoveDemoIf[i].Cfg.StationPos.Y;
			stationFbs[i].St3Fb.PlanetMacroID := DINT_TO_USINT(142);
			
			stationFbs[i].St3Fb.ShuttleId := gShuttleIf[gVariedMoveDemoIf[i].Par.ShuttleIdx].Cfg.ShuttleId;
			stationFbs[i].St3Fb.VirtShId := 100 + INT_TO_USINT(i);
			stationFbs[i].St3Fb.Execute := TRUE;
			stationFbs[i].St3Fb.SunMacroID := DINT_TO_USINT(141);
			CASE macroPatternCounter[i] OF
				0:
					stationFbs[i].St3Fb.SunMacroID := DINT_TO_USINT(141);
				1:
					stationFbs[i].St3Fb.SunMacroID := DINT_TO_USINT(170);
				2:
					stationFbs[i].St3Fb.SunMacroID := DINT_TO_USINT(171);
			END_CASE;
			
		ST4:
			stationFbs[i].St4Fb.Controller := ADR(gMcAcp6DController);
			stationFbs[i].St4Fb.MacroID := DINT_TO_USINT(143);
			stationFbs[i].St4Fb.ShuttleID := gShuttleIf[gVariedMoveDemoIf[i].Par.ShuttleIdx].Cfg.ShuttleId;
			stationFbs[i].St4Fb.Execute := TRUE;
	END_CASE;
END_ACTION

ACTION CallStationFbs: 
	CASE gVariedMoveDemoIf[i].Par.StationType OF
		ST1:
			stationFbs[i].St1Fb();
		ST2:
			stationFbs[i].St2Fb();
		ST3:
			stationFbs[i].St3Fb();
		ST4:
			stationFbs[i].St4Fb();
	END_CASE;
END_ACTION
