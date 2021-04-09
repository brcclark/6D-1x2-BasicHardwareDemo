

FUNCTION_BLOCK WobbleMovementFb
	//Setup Sun/Planet
	//Run Macro on Virtual
	//Run Wobble Macro on Real
	//When Virtual macro finishes, issue stop command to Real
	//Move6D to real shuttle
	//Exit Sun/Planet
	CASE Internal.state OF
		WOB_INT_OFF:
			IF Execute THEN
				Active := TRUE;
				
				Internal.Fbs.PlanetCtrlFb.Controller := ADR(Controller);
				Internal.Fbs.PlanetCtrlFb.NumberOfPlanets := 1;
				Internal.Fbs.PlanetCtrlFb.PlanetShuttleID[0] := ShuttleId;
				Internal.Fbs.PlanetCtrlFb.StarShuttleID := VirtShId;
				Internal.Fbs.PlanetCtrlFb.Level := mcACP6D_PLANET_CONNECT;
				Internal.Fbs.PlanetCtrlFb.Execute := TRUE;
				
				Internal.state := WOB_INT_SETUP_PLANET;
			END_IF
		WOB_INT_SETUP_PLANET:
			IF Internal.Fbs.PlanetCtrlFb.Error THEN
				Internal.state := WOB_INT_ERROR;
			ELSIF Internal.Fbs.PlanetCtrlFb.Done THEN
				Internal.Fbs.PlanetCtrlFb.Execute := FALSE;
				
				Internal.Fbs.VirtualMacroFb.Controller := ADR(Controller);
				Internal.Fbs.VirtualMacroFb.MacroID := SunMacroID;
				Internal.Fbs.VirtualMacroFb.ShuttleID := VirtShId;
				Internal.Fbs.VirtualMacroFb.Execute := TRUE;
				
				Internal.Fbs.RealMacroFb.Controller := ADR(Controller);
				Internal.Fbs.RealMacroFb.MacroID := PlanetMacroID;
				Internal.Fbs.RealMacroFb.ShuttleID := ShuttleId;
				Internal.Fbs.RealMacroFb.Execute := TRUE;
				
				Internal.state := WOB_INT_MACRO_RUN;
			END_IF
		WOB_INT_MACRO_RUN:
			IF Internal.Fbs.RealMacroFb.Error OR Internal.Fbs.VirtualMacroFb.Error THEN
				Internal.state := WOB_INT_ERROR;
			ELSIF Internal.Fbs.VirtualMacroFb.Done THEN
				Internal.Fbs.VirtualMacroFb.Execute := FALSE;
				Internal.Fbs.RealMacroFb.Execute := FALSE;
				
				Internal.Fbs.StopFb.Controller := ADR(Controller);
				Internal.Fbs.StopFb.ShuttleID := ShuttleId;
				Internal.Fbs.StopFb.Execute := TRUE;
				
				Internal.state := WOB_INT_STOP;
			END_IF
		WOB_INT_STOP:
			IF Internal.Fbs.StopFb.Error THEN
				Internal.state := WOB_INT_ERROR;
			ELSIF Internal.Fbs.StopFb.Done THEN
				Internal.Fbs.StopFb.Execute := FALSE;
				
				Internal.Fbs.Move6DFb.Controller := ADR(Controller);
				Internal.Fbs.Move6DFb.ShuttleID := ShuttleId;
				Internal.Fbs.Move6DFb.Position[axPosX] := PosStartX;
				Internal.Fbs.Move6DFb.Position[axPosY] := PosStartY;
				Internal.Fbs.Move6DFb.Position[axPosZ] := 0.002;
				Internal.Fbs.Move6DFb.Position[axPosRX] := 0;
				Internal.Fbs.Move6DFb.Position[axPosRY] := 0;
				Internal.Fbs.Move6DFb.Position[axPosRZ] := 0;
				Internal.Fbs.Move6DFb.InPlaneVelocity := 1;
				Internal.Fbs.Move6DFb.Acceleration := 10;
				Internal.Fbs.Move6DFb.ShortAxisVelocity[axVel] := 1;
				Internal.Fbs.Move6DFb.ShortAxisVelocity[axVelRx] := 0.1;
				Internal.Fbs.Move6DFb.ShortAxisVelocity[axVelRy] := 0.1;
				Internal.Fbs.Move6DFb.ShortAxisVelocity[axVelRz] := 0.1;
				Internal.Fbs.Move6DFb.Execute := TRUE;
				
				Internal.state := WOB_INT_REORIENT;
			END_IF
		WOB_INT_REORIENT:
			IF Internal.Fbs.Move6DFb.Done THEN
				Internal.Fbs.Move6DFb.Execute := FALSE;
				                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
				Internal.Fbs.PlanetCtrlFb.Level := mcACP6D_PLANET_DISCONNECT;
				Internal.Fbs.PlanetCtrlFb.Execute := TRUE;
				
				Internal.state := WOB_INT_BREAK_PLANET;
			END_IF
		WOB_INT_BREAK_PLANET:
			IF Internal.Fbs.PlanetCtrlFb.Error THEN
				Internal.state := WOB_INT_ERROR;
			ELSIF Internal.Fbs.PlanetCtrlFb.Done THEN
				Internal.Fbs.PlanetCtrlFb.Execute := FALSE;
				Done := TRUE;
				
				Internal.state := WOB_INT_DONE;
			END_IF
		WOB_INT_DONE:
			IF NOT Execute THEN
								
				Active := FALSE;
				Done := FALSE;
				Error := FALSE;
				
				Internal.state := WOB_INT_OFF;
			END_IF
		WOB_INT_ERROR:
			IF NOT Execute THEN
				Internal.Fbs.PlanetCtrlFb.Execute := FALSE;
				Internal.Fbs.RealMacroFb.Execute := FALSE;
				Internal.Fbs.VirtualMacroFb.Execute := FALSE;
				Internal.Fbs.StopFb.Execute := FALSE;
				Internal.Fbs.Move6DFb.Execute := FALSE;
								
				Active := FALSE;
				Done := FALSE;
				Error := FALSE;
				
				Internal.state := WOB_INT_OFF;
			END_IF
	END_CASE;
	Internal.Fbs.PlanetCtrlFb();
	Internal.Fbs.RealMacroFb();
	Internal.Fbs.VirtualMacroFb();
	Internal.Fbs.StopFb();
	Internal.Fbs.Move6DFb();
END_FUNCTION_BLOCK
