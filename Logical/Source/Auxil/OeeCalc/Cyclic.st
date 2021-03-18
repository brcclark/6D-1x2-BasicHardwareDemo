
PROGRAM _CYCLIC
	
	SysThroughputCalcFb.Enable := gProcessInfoIf.Cmd.Enable;
	SysThroughputCalcFb.ProductCounter := gProcessInfoIf.Par.CurrentProductCount;
	SysThroughputCalcFb.Reset := gProcessInfoIf.Cmd.ResetData;
	
	gProcessInfoIf.Sts.Enabled := gProcessInfoIf.Cmd.Enable;
	IF gProcessInfoIf.Cmd.ResetData THEN
		gProcessInfoIf.Cmd.ResetData := FALSE;
		gProcessInfoIf.Par.CurrentProductCount := 0;
	END_IF
	
	SysThroughputCalcFb();
	
	gProcessInfoIf.Sts.CurrentBlistersPerMinute := SysThroughputCalcFb.PPM * 6;
	gProcessInfoIf.Sts.CurrentLayersPerMinute := SysThroughputCalcFb.PPM * 4;
	gProcessInfoIf.Sts.CurrentPPM := SysThroughputCalcFb.PPM;
	gProcessInfoIf.Sts.CurrentPPH := SysThroughputCalcFb.PPH;
END_PROGRAM
