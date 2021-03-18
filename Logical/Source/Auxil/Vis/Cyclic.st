
PROGRAM _CYCLIC
	FOR idx := 0 TO gMainIf.Cfg.ShuttleCount - 1 DO
		IF Vis.Shuttles[idx].ID <> 0 THEN
			Vis.Shuttles[idx].Visible := TRUE;
			Vis.Shuttles[idx].Pos.X := gShuttleIf[idx].Status.ShuttleInfo.Position.Value.X * 1000;
			Vis.Shuttles[idx].Pos.Y := gShuttleIf[idx].Status.ShuttleInfo.Position.Value.Y * 1000;
			Vis.Shuttles[idx].Pos.Z := gShuttleIf[idx].Status.ShuttleInfo.Position.Value.Z * 1000;
			Vis.Shuttles[idx].Pos.RX := gShuttleIf[idx].Status.ShuttleInfo.Position.Value.RX / 3.14189 * 180.0;
			Vis.Shuttles[idx].Pos.RY := gShuttleIf[idx].Status.ShuttleInfo.Position.Value.RY / 3.14189 * 180.0;
			Vis.Shuttles[idx].Pos.RZ := gShuttleIf[idx].Status.ShuttleInfo.Position.Value.RZ / 3.14189 * 180.0;	
			CASE gShuttleIf[idx].Status.ShuttleInfo.State.Value OF
				mcACP6D_SH_STATE_UNDETECTED: (*Shuttle is not detected by the System*)
					Vis.Shuttles[idx].Color := DINT_TO_INT(COLOR_GREY_MATTE);
				mcACP6D_SH_STATE_DISCOVERING: (*Shuttle iis in the process of being discovered by the System		*)
				mcACP6D_SH_STATE_LANDED :  (*Shuttle is landed and controlled by the System. 			*)
					Vis.Shuttles[idx].Color := DINT_TO_INT(COLOR_BLUE_MATTE);
				mcACP6D_SH_STATE_IDLING :  (*Shuttle is levitating and not currently executing a motion command		*)
					Vis.Shuttles[idx].Color := DINT_TO_INT(COLOR_WHITE_MATTE);
				mcACP6D_SH_STATE_DISABLED :  (*Shuttle is not controlled by the System		*)
				mcACP6D_SH_STATE_MOTION :  (*Shuttle is in motion		*)
					Vis.Shuttles[idx].Color := DINT_TO_INT(COLOR_WHITE_MATTE);
				mcACP6D_SH_STATE_WAIT :  (*Shuttle is waiting for a trigger defined by the WaitUntil command		*)
				mcACP6D_SH_STATE_STOPPING :  (*Shuttle is performing an automatic quick stop due to obstacle detection		*)
				mcACP6D_SH_STATE_OBSTACLE :  (*Shuttle is waiting for an obstacle to clear before proceeding*)
					Vis.Shuttles[idx].Color := DINT_TO_INT(COLOR_YELLOW_MATTE);
				mcACP6D_SH_STATE_HOLD :  (*Shuttle is holding position due to positioning error		*)
				mcACP6D_SH_STATE_STOPPED :  (*Shuttle is stopped due to obstacle or boundary detection, it  cannot automatically resume its motion		*)
				mcACP6D_SH_STATE_ERROR :  (*Shuttle has detected an error		*)
					Vis.Shuttles[idx].Color := DINT_TO_INT(COLOR_RED);
				mcACP6D_SH_STATE_RESERVED :  (*Reserved State*)
			END_CASE;
		ELSE
			Vis.Shuttles[idx].Visible := TRUE;
		END_IF
	END_FOR;
END_PROGRAM
