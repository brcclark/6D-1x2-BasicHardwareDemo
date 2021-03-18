

PROGRAM _INIT
	g6DRecoveryIf.Par.Vel := 1;
	g6DRecoveryIf.Par.Accel := 10;
	
	//************************************************************************* Shuttle 1
	g6DRecoveryIf.Par.AutoDrivePositions[0].ShIdx := 0;
	g6DRecoveryIf.Par.AutoDrivePositions[0].GroupNum := 0;
	g6DRecoveryIf.Par.AutoDrivePositions[0].X := 0.12;
	g6DRecoveryIf.Par.AutoDrivePositions[0].Y := 0.06;
	//************************************************************************* Shuttle 2
	g6DRecoveryIf.Par.AutoDrivePositions[1].ShIdx := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[1].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[1].X := 0.36;
	g6DRecoveryIf.Par.AutoDrivePositions[1].Y := 0.18;

END_PROGRAM