
FUNCTION_BLOCK WFLowPass (*Low Pass Filter*)
	VAR_INPUT
		Enable : BOOL; (*Enable the function block*) (* *) (*#PAR*)
		Input : REAL; (*Filter input value*) (* *) (*#CYC*)
		Level : REAL; (*Filter level*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*The function block is active*) (* *) (*#PAR*)
		Output : REAL; (*Filter output value*) (* *) (*#CYC*)
	END_VAR
	VAR
		Internal : WFLowPassInternalType; (*Internal state*)
		iEnable : BOOL; (*Previously recorded enable level*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK WFMovingAverage (*Moving Average Filter*)
	VAR_INPUT
		Enable : BOOL; (*Enable the function block*) (* *) (*#PAR*)
		Input : REAL; (*Filter input value*) (* *) (*#CYC*)
		Samples : UDINT; (*Number of samples to average over*) (* *) (*#PAR*)
		pBuffer : UDINT; (*Pointer to the sample buffer*) (* *) (*#PAR*)
		BufferSize : UDINT; (*Size of the sample buffer*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*The function block is active*) (* *) (*#PAR*)
		Error : BOOL; (*The function block has an error*) (* *) (*#PAR*)
		ErrorID : UINT; (*Function block error ID*) (* *) (*#PAR*)
		Output : REAL; (*Filter output value*) (* *) (*#CYC*)
		RequiredBufferSize : UDINT; (*Required size of the sample buffer*) (* *) (*#CMD*)
	END_VAR
	VAR
		Internal : WFMovAvgInternalType; (*Internal state*)
		ipBuffer : UDINT; (*Sample buffer pointer on enable*)
		iBufferSize : UDINT; (*Sample buffer size on enable*)
		iEnable : BOOL; (*Previously recorded enable level*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK WFPredictiveFilter (*Predictive Filter*)
	VAR_INPUT
		Enable : BOOL; (*Enable the function block*) (* *) (*#PAR*)
		Input : REAL; (*Filter input value*) (* *) (*#CYC*)
		Time : REAL; (*Time cyclic value*) (* *) (*#PAR*)
		SigmaA : REAL; (*Sigma A value*) (* *) (*#PAR*)
		SigmaZ : REAL; (*Sigma Z value*) (* *) (*#PAR*)
		Alpha : REAL; (*Fading memory alpha value*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*The function block is active*) (* *) (*#PAR*)
		Output : REAL; (*Filter output value*) (* *) (*#CYC*)
		ChangeRate : REAL; (*Filter output rate of change*) (* *) (*#CYC*)
	END_VAR
	VAR
		Internal : WFPredictIntType; (*Internal state*)
		iEnable : BOOL; (*Previously recorded enable level*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK WFLinearFit (*Linear fit of y = ax + b*)
	VAR_INPUT
		Execute : BOOL; (*Execute on rising edge*) (* *) (*#PAR*)
		Par : WFFitParType; (*Parameters for calculating the fit*) (* *) (*#PAR*)
		pDataX : UDINT; (*Pointer to the array of floats*) (* *) (*#PAR*)
		pDataY : UDINT; (*Pointer to the array of floats*) (* *) (*#PAR*)
		DataSize : UDINT; (*Size of the array of floats*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Calculation of fit is complete*) (* *) (*#PAR*)
		Busy : BOOL; (*The function block is busy and needs to be continued to be called*) (* *) (*#PAR*)
		Error : BOOL; (*The function block has an error*) (* *) (*#PAR*)
		ErrorID : UINT; (*Function block error ID*) (* *) (*#PAR*)
		A : REAL; (*The A value*) (* *) (*#PAR*)
		B : REAL; (*The B value*) (* *) (*#PAR*)
	END_VAR
	VAR
		State : WFFitStateEnum; (*State of the fit calculation*)
		Counter : UDINT; (*Current position in processing data arrays*)
		Internal : WFFitInternalType; (*Internal state of the fit*)
		ipDataX : UDINT; (*DataX pointer on execute*)
		ipDataY : UDINT; (*DataY pointer on execute*)
		iDataSize : UDINT; (*Data size on execute*)
		iExecute : BOOL; (*Previously recorded execute level*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK WFExponentialFit (*Exponential fit of y = a*e^bx*)
	VAR_INPUT
		Execute : BOOL; (*Execute on rising edge*) (* *) (*#PAR*)
		Par : WFFitParType; (*Parameters for calculating the fit*) (* *) (*#PAR*)
		pDataX : UDINT; (*Pointer to the array of floats*) (* *) (*#PAR*)
		pDataY : UDINT; (*Pointer to the array of floats*) (* *) (*#PAR*)
		DataSize : UDINT; (*Size of the array of floats*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Calculation of fit is complete*) (* *) (*#PAR*)
		Busy : BOOL; (*The function block is busy and needs to be continued to be called*) (* *) (*#PAR*)
		Error : BOOL; (*The function block has an error*) (* *) (*#PAR*)
		ErrorID : UINT; (*Function block error ID*) (* *) (*#PAR*)
		A : REAL; (*The A value*) (* *) (*#PAR*)
		B : REAL; (*The B value*) (* *) (*#PAR*)
	END_VAR
	VAR
		State : WFFitStateEnum; (*State of the fit calculation*)
		Counter : UDINT; (*Current position in processing data arrays*)
		Internal : WFFitInternalType; (*Internal state of the fit*)
		ipDataX : UDINT; (*DataX pointer on execute*)
		ipDataY : UDINT; (*DataY pointer on execute*)
		iDataSize : UDINT; (*Data size on execute*)
		iExecute : BOOL; (*Previously recorded execute level*)
	END_VAR
END_FUNCTION_BLOCK
