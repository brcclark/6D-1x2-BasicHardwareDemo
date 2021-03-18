

PROGRAM _INIT
	RoboBasicFb.Enable := TRUE;
	RoboBasicFb.MpLink := ADR(g3AxDeltaA);
	RoboBasicFb.Override := 100;
	RoboBasicFb.Parameters := ADR(deltaPars);
	
	RoboBasicFb();
	
	brsstrcpy(ADR(gRobotIf.Pars.SyncFrame),ADR("TrakSync"));
	gRobotIf.Pars.SyncPosition.X := 150;
	gRobotIf.Pars.SyncPosition.Y := 0;
	gRobotIf.Pars.SyncPosition.Z := 0;
	gRobotIf.Pars.MoveToSyncVel := 700;
	gRobotIf.Pars.MoveToSyncAccel := 2000;
	gRobotIf.Pars.MoveToSyncDecel := 2000;
	
	//Setting these in the TrakSyncframe!!
	gPickPlaceIf.Config.PickLoc.X := 330;
	gPickPlaceIf.Config.PickLoc.Y := -200;
	gPickPlaceIf.Config.PickLoc.Z := 50;
	
	gPickPlaceIf.Config.PlaceLoc.X := 150;
	gPickPlaceIf.Config.PlaceLoc.Y := 0;
	gPickPlaceIf.Config.PlaceLoc.Z := 0;
	
	gPickPlaceIf.Pars.PickTune.ApproachHeight := 50;
	gPickPlaceIf.Pars.PickTune.DepartHeight := 30;
	gPickPlaceIf.Pars.PickTune.Radius := 40;
	gPickPlaceIf.Pars.PickTune.DwellTime := 0.10;
	
	gPickPlaceIf.Pars.ProductSpeed.Vel := 250;
	gPickPlaceIf.Pars.ProductSpeed.Accel := 1000;
	gPickPlaceIf.Pars.ProductSpeed.Decel := 1000;
	
	gPickPlaceIf.Pars.EmptySpeed.Vel := 500;
	gPickPlaceIf.Pars.EmptySpeed.Accel := 2000;
	gPickPlaceIf.Pars.EmptySpeed.Decel := 2000;
	 
END_PROGRAM