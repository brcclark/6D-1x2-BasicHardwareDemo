

PROGRAM _INIT
	gMcAcp6DController.H2P_START := ADR(FBout);
	gMcAcp6DController.P2H_START := ADR(FBin);
	gMcAcp6DController.ConfiguredFeedbackStreamAxis	:= 63;

	
	Fbs.AutoRefreshFB.Controller	:= ADR(gMcAcp6DController);
	Fbs.PowerOffFb.Controller := ADR(gMcAcp6DController);
	Fbs.PowerOnFb.Controller := ADR(gMcAcp6DController);
	Fbs.SysReadStateFb.Controller := ADR(gMcAcp6DController);	 
	
	Fbs.AutoRefreshFB.Enable := TRUE;
	Fbs.SysReadStateFb.Enable := TRUE;
END_PROGRAM