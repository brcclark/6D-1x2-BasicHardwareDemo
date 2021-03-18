

PROGRAM _INIT
	g6DRecoveryIf.Par.Vel := 1;
	g6DRecoveryIf.Par.Accel := 10;
	
	//************************************************************************* Shuttle 1
	g6DRecoveryIf.Par.AutoDrivePositions[0].ShIdx := 0;
	g6DRecoveryIf.Par.AutoDrivePositions[0].GroupNum := 0;
	g6DRecoveryIf.Par.AutoDrivePositions[0].X := 0.06;
	g6DRecoveryIf.Par.AutoDrivePositions[0].Y := 0.3;
	//************************************************************************* Shuttle 2
	g6DRecoveryIf.Par.AutoDrivePositions[1].ShIdx := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[1].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[1].X := 0.06;
	g6DRecoveryIf.Par.AutoDrivePositions[1].Y := 0.42;
	//************************************************************************* Shuttle 3
	g6DRecoveryIf.Par.AutoDrivePositions[2].ShIdx := 2;
	g6DRecoveryIf.Par.AutoDrivePositions[2].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[2].X := 0.18;
	g6DRecoveryIf.Par.AutoDrivePositions[2].Y := 0.42;
	//************************************************************************* Shuttle 4
	g6DRecoveryIf.Par.AutoDrivePositions[3].ShIdx := 3;
	g6DRecoveryIf.Par.AutoDrivePositions[3].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[3].X := 0.3;
	g6DRecoveryIf.Par.AutoDrivePositions[3].Y := 0.42;
	//************************************************************************* Shuttle 5
	g6DRecoveryIf.Par.AutoDrivePositions[4].ShIdx := 4;
	g6DRecoveryIf.Par.AutoDrivePositions[4].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[4].X := 0.42;
	g6DRecoveryIf.Par.AutoDrivePositions[4].Y := 0.42;
	//************************************************************************* Shuttle 6
	g6DRecoveryIf.Par.AutoDrivePositions[5].ShIdx := 5;
	g6DRecoveryIf.Par.AutoDrivePositions[5].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[5].X := 0.54;
	g6DRecoveryIf.Par.AutoDrivePositions[5].Y := 0.42;
	//************************************************************************* Shuttle 7
	g6DRecoveryIf.Par.AutoDrivePositions[6].ShIdx := 6;
	g6DRecoveryIf.Par.AutoDrivePositions[6].GroupNum := 1;
	g6DRecoveryIf.Par.AutoDrivePositions[6].X := 0.66;
	g6DRecoveryIf.Par.AutoDrivePositions[6].Y := 0.42;
	//************************************************************************* Shuttle 8
	g6DRecoveryIf.Par.AutoDrivePositions[7].ShIdx := 7;
	g6DRecoveryIf.Par.AutoDrivePositions[7].GroupNum := 2;
	g6DRecoveryIf.Par.AutoDrivePositions[7].X := 0.66;
	g6DRecoveryIf.Par.AutoDrivePositions[7].Y := 0.54;
END_PROGRAM