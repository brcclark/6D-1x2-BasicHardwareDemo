
PROGRAM _CYCLIC
	//rawWeight := gShuttleIf[0].Status.ShuttleInfo.Force.Value.Fz / 9.81 * 1000.0;
	rawWeight := readCyclicForceFb.Value / 9.81 * 1000.0;
	weightValues.CalcWeight := rawWeight * 1.1588+70.798-weightValues.TareWeight;	
	CASE state OF
		0:
			IF enableFilters THEN
				
				KalmanFb[1].Enable := TRUE;
				weighKalman.Enable := TRUE;
				
				readCyclicForceFb.Enable := TRUE;
				readCyclicForceFb.ChannelID := 2;
				readCyclicForceFb.AxisID := 3;
				readCyclicForceFb.Controller := ADR(gMcAcp6DController);
				state := 5;
			END_IF
		5:
			IF readCyclicForceFb.Valid THEN
				state := 10;
			END_IF
		10:
			KalmanFb[1].SystemOutput := rawWeight;
			
			weighKalman.Input := weightValues.CalcWeight;
			
			IF weighKalman.Output > weightValues.ExpectedWeight * weightValues.TriggerThreshold THEN
				finalWeighKalmanFb.Enable := TRUE;
				finalWeighKalmanFb.Input := weightValues.ExpectedWeight;
				KalmanFb[0].Enable := TRUE;
				KalmanFb[0].SystemOutput := weightValues.ExpectedWeight;
				state := 11;
			END_IF
			
			IF NOT enableFilters THEN
				KalmanFb[0].Enable := FALSE;
				KalmanFb[1].Enable := FALSE;
				weighKalman.Enable := FALSE;
				
				state := 0;
			END_IF
		11:
			weighKalman.Input := weightValues.CalcWeight;
			finalWeighKalmanFb.Input := weighKalman.Output;
			KalmanFb[0].SystemOutput := weightValues.CalcWeight;
			IF Reset OR weighKalman.Output < weightValues.ExpectedWeight * weightValues.TriggerThreshold THEN
				Reset := FALSE;
				finalWeighKalmanFb.Enable := FALSE;
				state := 10;
			END_IF
		20:
		//Sigma A should be standard deviation of the process, so if the pill weighing process, what is the deviation for missed pills?
		
		//Use single kalman w/ correct Z (Z is the standard deviation is  from your raw signal)
		//	A  is very high so that the signal follows raw relatively closely (lots of process noise)
		//When value reaches window of expected known
		//Start 2nd kalman w/ same Z and much lower A to remove the process noise 
			//AND set the initial value for the expected weight to help converge faster
	END_CASE;
	
	KalmanFb[0]();
	KalmanFb[1]();	
	readCyclicForceFb();
	weighKalman();
	finalWeighKalmanFb();
	
	OutputCovertedToWeight[0] := KalmanFb[0].FilteredOutput[0];
	OutputCovertedToWeight[1] := KalmanFb[1].FilteredOutput[0];
	
	IF WeightTest THEN
		WeighFb.Controller := ADR(gMcAcp6DController);
		WeighFb.ShuttleID := 1;
		WeighFb.Execute := NOT WeighFb.Valid;
	END_IF
	WeighFb();
END_PROGRAM
