

PROGRAM _INIT
	KalmanFb[0].Numerator[0] := 1;
	KalmanFb[0].Denominator[1] := 1;
	KalmanFb[0].NoiseReduction := 3;
	KalmanFb[1].Numerator[0] := 1;
	KalmanFb[1].Denominator[1] := 1;
	KalmanFb[1].NoiseReduction := 3;
	
	weighKalman.Time := 0.005;
	weighKalman.SigmaA := 10000.0;
	weighKalman.SigmaZ := 4.4;
	weighKalman.Alpha := 1.0;
	
	finalWeighKalmanFb.Time := 0.005;
	finalWeighKalmanFb.SigmaA := 1.0;
	finalWeighKalmanFb.SigmaZ := 4.4;
	finalWeighKalmanFb.Alpha := 1.01;
	weightValues.TareWeight := 695.0;
	weightValues.ExpectedWeight := 500;
	weightValues.TriggerThreshold := 0.95;
	weightValues.CalculatedExpectedForce := weightValues.TareWeight + weightValues.ExpectedWeight + weightValues.Error;
END_PROGRAM