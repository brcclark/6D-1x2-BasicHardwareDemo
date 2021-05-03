
TYPE
	WFLowPassInternalType : 	STRUCT  (*Internal state of low pass filter*)
		input : REAL; (*Filter input*)
		level : REAL; (*Filter level*)
		state : REAL; (*Filter state*)
		output : REAL; (*Filter output*)
	END_STRUCT;
	WFMovAvgInternalType : 	STRUCT  (*Internal state of moving average filter*)
		input : REAL; (*Filter input*)
		samples : UDINT; (*Number of samples to average over*)
		state : WFMovAvgInternalBufferType; (*Internal state of moving average filter buffer*)
		error : INT; (*Equal to 1 if the buffer size is too small*)
		output : REAL; (*Filter output*)
	END_STRUCT;
	WFMovAvgInternalBufferType : 	STRUCT  (*Internal state of moving average filter buffer*)
		state : WFMovAvgInternalBufferStateType; (*Internal state of moving average filter buffer state*)
		output : REAL; (*Buffer output*)
	END_STRUCT;
	WFMovAvgInternalBufferStateType : 	STRUCT  (*Internal state of moving average filter buffer state*)
		read : UDINT; (*The buffer read position*)
		write : UDINT; (*The buffer write position*)
	END_STRUCT;
	WFPredictIntType : 	STRUCT  (*Internal state of the predictive filter*)
		input : REAL; (*Filter input*)
		t : REAL; (*Filter time constant*)
		sigma_a : REAL; (*Filter Sigma A value*)
		sigma_z : REAL; (*Filter Sigma Z value*)
		alpha : REAL; (*Filter alpha value*)
		internal : WFPredictIntInternalType; (*Internal state within the internal state of the predictive filter*)
		state : WFPredictIntStateType; (*State of the internal state within the predictive filter*)
		output : REAL; (*Filter output*)
		velocity : REAL; (*Filter velocity output*)
	END_STRUCT;
	WFPredictIntInternalType : 	STRUCT  (*Internal state within the internal state of the predictive filter*)
		t : REAL; (*Filter time constant*)
		sigma_a : REAL; (*Filter Sigma A value*)
		sigma_z : REAL; (*Filter Sigma Z value*)
		alpha : REAL; (*Filter alpha value*)
		Q : ARRAY[0..1,0..1]OF REAL; (*Filter observation noise covariance Q*)
		RR : REAL; (*Filter process noise covariance R*)
		F : ARRAY[0..1,0..1]OF REAL; (*Filter state transition model F*)
	END_STRUCT;
	WFPredictIntStateType : 	STRUCT  (*State of the internal state within the predictive filter*)
		x : ARRAY[0..1]OF REAL; (*Posterior state estimate vector x*)
		P : ARRAY[0..1,0..1]OF REAL; (*Posterior covariance matrix P*)
	END_STRUCT;
	WFFitParType : 	STRUCT  (*Parameters for fit function blocks*)
		MaxIterations : UINT; (*The maximum number of iterations to run through per cycle*)
		MaxTime : TIME; (*The maximum amount of time to run per cycle*)
	END_STRUCT;
	WFFitInternalType : 	STRUCT  (*Internal state of the fit function block*)
		x : REAL; (*X value*)
		y : REAL; (*Y value*)
		state : WFFitInternalStateType; (*State of the internal state of the fit function block*)
		a : REAL; (*A value*)
		b : REAL; (*B value*)
	END_STRUCT;
	WFFitInternalStateType : 	STRUCT  (*State of the internal state of the fit function block*)
		sumx : REAL; (*Running sum of the x values*)
		sumx2 : REAL; (*Running sum of x^2*)
		sumy : REAL; (*Running sum of the y values*)
		sumxy : REAL; (*Running sum of x*y*)
		n : UDINT; (*Number of values*)
	END_STRUCT;
	WFFitStateEnum : 
		( (*State of the fit calculation*)
		wfFIT_STATE_WAIT, (*Wait to start calculation*)
		wfFIT_STATE_PROCESS (*Perform calculation*)
		);
END_TYPE
