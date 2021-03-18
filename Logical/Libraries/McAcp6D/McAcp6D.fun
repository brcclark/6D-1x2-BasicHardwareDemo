
{REDUND_ERROR} FUNCTION_BLOCK MC_BR_AutoRefresh_Acp6D (*This function block is executing background work for the Acopos6D communication. Should be called once and only once per PLC cycle*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output value can be used*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error Number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DAutoRefreshInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_BufferCtrl_Acp6D (*This function block controls the motion buffer of a shuttle*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		Option : {REDUND_UNREPLICABLE} McAcp6DBufferOptionEnum; (*Option = 0: Block buffer, Option = 1: Release buffer, Option=2: Clear buffer*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*ShuttleID =0: Control all shuttle buffers, ShuttleID>0: Control specific shuttle buffer*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DMotionBufInternalType := (cmdID:=2837); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_BufferGetStatus_Acp6D (*This function block returns the status of a shuttles's motion buffer*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		State : {REDUND_UNREPLICABLE} USINT; (*Buffer state; 0: unblocked; 1: blocked*) (* *) (*#PAR*)
		NumberOfCommands : {REDUND_UNREPLICABLE} UINT; (*Number of commands in the buffer*) (* *) (*#PAR*)
		NextCmdLabel : {REDUND_UNREPLICABLE} UINT; (*The upcoming command in the motion buffer*) (* *) (*#PAR*)
		NewCmdLabel : {REDUND_UNREPLICABLE} UINT; (*The most recently added command to the motion buffer*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetBufStatusInternalType := (cmdID:=2837,Level:=3); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_CamMotion_Acp6D (*This function block is enables cam for 1 slave shuttle.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		Level : {REDUND_UNREPLICABLE} USINT; (*0:Exit from cam mode;1: Enter cam mode*) (* *) (*#PAR*)
		SlaveShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID of the slave Shuttle*) (* *) (*#PAR*)
		NumberOfAxes : {REDUND_UNREPLICABLE} USINT; (*Number of axes to cam together (up to 6)*) (* *) (*#PAR*)
		SlaveAxisID : {REDUND_UNREPLICABLE} ARRAY[0..6] OF USINT; (*Slave axes 1: X; 2: Y; 3: Z; 4: Rx; 5: Ry; 6: Rz*) (* *) (*#PAR*)
		CamID : {REDUND_UNREPLICABLE} ARRAY[0..6] OF USINT; (*Array of Cam ID*) (* *) (*#PAR*)
		MasterShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..6] OF USINT; (*Array of Master Shuttle ID*) (* *) (*#PAR*)
		MasterAxisID : {REDUND_UNREPLICABLE} ARRAY[0..6] OF USINT; (*Array of Master axes 1: X; 2: Y; 3: Z; 4: Rx; 5: Ry; 6: Rz*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DCamInternalType := (cmdID:=2834,maxNAxis:=7); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION MC_BR_CmdProcessor_Acp6D : BOOL (*This function is an internal function used by other Acopos6D  function blocks. End users should never call this function*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*) (*#OMIT*)
	VAR_INPUT
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionLocation : USINT; (*0: beginning OF FUNCTION block call, 1: end OF FUNCTION block call, 2: timeout*)
		EventCommand : BOOL; (* command supports events*)
	END_VAR
	VAR_IN_OUT
		Controller : McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*)
		FuncInfo : McAcp6DFuncInfoType; (*Tracks state of a single Acopos6D block instance*)
		Acknowledge : BOOL; (*Command accepted*)
		Done : BOOL; (*Execution successful. Function block is finished*)
		Busy : BOOL; (*Function is active and must continue to be called.*)
		Error : BOOL; (*Error occurred during execution.*)
		ErrorID : DINT; (*Error Number*)
		Aborted : BOOL; (*Command aborted by another command*)
	END_VAR
	VAR
		Internal : McAcp6DCmdProcesserInternalType;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION MC_BR_CmdEventLogAddBuff_Acp6D : BOOL (*This function is an internal function used by other Acopos6D  function blocks. End users should never call this function*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*) (*#OMIT*)
	VAR_INPUT
		Execute : BOOL;
		ErrorID : DINT;
		Aborted : BOOL;
		Controller : REFERENCE TO McAcp6DControllerType;
		FuncInfo : REFERENCE TO McAcp6DFuncInfoType;
		CmdType : McAcp6DLogBufferTypeEnum; (*0 = CMD, 1 = Read*)
	END_VAR
	VAR
		Internal : McAcp6DCmdLogAddBufInternalType;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MC_BR_CmdEventLog_Acp6D (* *) (* *) (*#OMIT*)
	VAR_INPUT
		Execute : BOOL;
		ErrorID : DINT;
		Aborted : BOOL;
		Acknowledge : BOOL;
		CommandDone : BOOL;
		Controller : REFERENCE TO McAcp6DControllerType;
		FuncInfo : REFERENCE TO McAcp6DFuncInfoType;
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Status ID from EventLog*)
	END_VAR
	VAR
		Internal : McAcp6DCmdEventLogInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_ConfigDIMacroRun_Acp6D (*This function block configures Acopos6D internal digital inputs to trigger shuttles to run macros.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalInputs : {REDUND_UNREPLICABLE} USINT; (*Number of digital inputs to configure (up to 22 per FuB call).*) (* *) (*#PAR*)
		DigitalInputID : {REDUND_UNREPLICABLE} ARRAY[0..21] OF USINT; (*Array of digital input ID to configure*) (* *) (*#PAR*)
		MacroID : {REDUND_UNREPLICABLE} ARRAY[0..21] OF USINT; (*Array of macro IDs to run. Valid macro IDs are 128 - 191*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..21] OF USINT; (*Array of shuttleIDs to run the macros.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6DConfigDIInternalType := (cmdID:=2844,maxNDi:=22,Type_:=2); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ConfigDIResetDO_Acp6D (*This function block configures Acopos6D internal digital inputs to reset Acopos6D internal digital outputs*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalInputs : {REDUND_UNREPLICABLE} USINT; (*Number of digital inputs to configure (up to 22 per FuB call).*) (* *) (*#PAR*)
		DigitalInputID : {REDUND_UNREPLICABLE} ARRAY[0..21] OF USINT; (*Array of digital input ID to configure*) (* *) (*#PAR*)
		DigitalOutputID : {REDUND_UNREPLICABLE} ARRAY[0..21] OF USINT; (*Array of digital output ID to reset*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DConfigDIInternalType := (cmdID:=2844,maxNDi:=22,Type_:=1); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_ConfigDIWaitTrigger_Acp6D (*This function block configures Acopos6D internal digital inputs to be used in a WaitUntil Digital Input command.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalInputs : {REDUND_UNREPLICABLE} USINT; (*Number of digital inputs to configure (up to 22 per FuB call).*) (* *) (*#PAR*)
		DigitalInputID : {REDUND_UNREPLICABLE} ARRAY[0..21] OF USINT; (*Array of digital input ID to configure*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6DConfigDIInternalType := (cmdID:=2844,maxNDi:=22,Type_:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ConfigDOCmdLabel_Acp6D (*This function block configures Acopos6D internal digital outputs to be set on command labels.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalOutputs : {REDUND_UNREPLICABLE} USINT; (*Number of digital outputs to configure (up to 5 per FuB call).*) (* *) (*#PAR*)
		DigitalOutputID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of digital output ID to configure*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of shuttle IDs to monitor*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} ARRAY[0..4] OF UINT; (*Array of command labels to monitor*) (* *) (*#PAR*)
		Type : {REDUND_UNREPLICABLE} ARRAY[0..4] OF McAcp6DDOTypeEnum; (*Digital output logic behavior. Type = 0: Rising Edge, Type = 1 Negative Edge, Type= 2: Active High*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DConfigDOInternalType := (cmdID:=2843,maxNDo:=5); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_ConfigDODisplacement_Acp6D (*This function block configures Acopos6D internal digital outputs to be set on shuttle displacement.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalOutputs : {REDUND_UNREPLICABLE} USINT; (*Number of digital outputs to configure (up to 5 per FuB call).*) (* *) (*#PAR*)
		DigitalOutputID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of digital output ID to configure*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of shuttle IDs to monitor*) (* *) (*#PAR*)
		Type : {REDUND_UNREPLICABLE} ARRAY[0..4] OF McAcp6DDOTypeEnum; (*Digital output logic behavior. Type = 0: Rising Edge, Type = 1 Negative Edge, Type= 2: Active High*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} ARRAY[0..4] OF McAcp6DDODisplacementModeEnum; (*Select boundary for a shuttle. Mode=0: X only, Mode=1: Y only, Mode=2: XFactor*XPos + YFactor*YPos = Threshold*) (* *) (*#PAR*)
		Threshold : {REDUND_UNREPLICABLE} ARRAY[0..4] OF REAL; (*Thresholds for output trigger [m]*) (* *) (*#PAR*)
		XFactor : {REDUND_UNREPLICABLE} ARRAY[0..4] OF REAL; (*XFactor used for Mode=2*) (* *) (*#PAR*)
		YFactor : {REDUND_UNREPLICABLE} ARRAY[0..4] OF REAL; (*YFactor used for Mode=2*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6DConfigDOInternalType := (cmdID:=2843,maxNDo:=5); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_ConfigDOForce_Acp6D (*This function block configures Acopos6D internal digital outputs to be set on shuttle force value*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalOutputs : {REDUND_UNREPLICABLE} USINT; (*Number of digital outputs to configure (up to 5 per FuB call).*) (* *) (*#PAR*)
		DigitalOutputID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of digital output ID to configure*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of shuttle IDs to monitor*) (* *) (*#PAR*)
		Type : {REDUND_UNREPLICABLE} ARRAY[0..4] OF McAcp6DDOTypeEnum; (*Digital output logic behavior. Type = 0: Rising Edge, Type = 1 Negative Edge, Type= 2: Active High*) (* *) (*#PAR*)
		AxisID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF McAcp6DAxisIDEnum; (*Axis to monitor. AxisID=0: X axis, AxisID=1, Y axis, AxisID=3: Z, AxisID=4: Rx, AxisID=5: Ry, AxisID=6: Rz.*) (* *) (*#PAR*)
		Threshold : {REDUND_UNREPLICABLE} ARRAY[0..4] OF REAL; (*Thresholds for output trigger in Newtons/Newton*Meters*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6DConfigDOInternalType := (cmdID:=2843,maxNDo:=5); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_ConfigDOMotion_Acp6D (*This function block configures Acopos6D internal digital outputs to be set on shuttle motion state*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfDigitalOutputs : {REDUND_UNREPLICABLE} USINT; (*number of digital outputs to configure (up to 5)*) (* *) (*#PAR*)
		DigitalOutputID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of digital output ID to configure*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..4] OF USINT; (*Array of shuttle IDs to monitor*) (* *) (*#PAR*)
		Type : {REDUND_UNREPLICABLE} ARRAY[0..4] OF McAcp6DDOTypeEnum; (*Digital output logic behavior. Type = 0: Rising Edge, Type = 1 Negative Edge, Type= 2: Active High*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6DConfigDOInternalType := (cmdID:=2843,maxNDo:=5); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ConfigReadCyclicCh_Acp6D (*This function block configures the cyclic feedback channel(s).*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfChannels : {REDUND_UNREPLICABLE} USINT; (*Number of cyclic position channels (up to 8)*) (* *) (*#PAR*)
		ChannelID : {REDUND_UNREPLICABLE} ARRAY[0..7] OF USINT; (*Array of Channel ID*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..7] OF USINT; (*Array of Shuttle ID*) (* *) (*#PAR*)
		FeedbackMode : {REDUND_UNREPLICABLE} ARRAY[0..7] OF McAcp6DReadCycPosEnum; (*Mode = 0: Position, FeedbackMode = 1: Force*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DConfigStreamInternalType := (cmdID:=2828,maxNStm:=8); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ForceModeCtrl_Acp6D (*This function block activates force mode control on a shuttle. The force mode gives the possibility to control the forces in X,Y and Z direction*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} McAcp6DForceModeLevelEnum; (*Mode=0: Exit from force mode, Mode=1: Z force, Mode=2: X force, Mode=3: Y force, Mode=4: XY force*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		ForceX : {REDUND_UNREPLICABLE} REAL; (*Force in X in Newtons*) (* *) (*#PAR*)
		ForceY : {REDUND_UNREPLICABLE} REAL; (*Force in Y in Newtons*) (* *) (*#PAR*)
		ForceZ : {REDUND_UNREPLICABLE} REAL; (*Force in Z in Newtons*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DForceModeInternalType := (cmdID:=2833); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_GetPayload_Acp6D (*This function block returns the current payload on a shuttle.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system. For best performance, place the shuttle in one of the 4 corners on a segment and wait around 1 second before executing this command.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		Payload : {REDUND_UNREPLICABLE} REAL; (*Shuttle paylod in kilograms*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetPayloadInternalType := (cmdID:=2848); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_JogVelocity_Acp6D (*NOT WORKING AS IT SHOULD*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (* Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (* 0: stop jogging xbot; 1: start jogging xbot*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Direction : {REDUND_UNREPLICABLE} REAL; (*Direction To jog in radians*) (* *) (*#PAR*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (*jogging speed in meters/second*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Ready : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DJogVelInternalType := (cmdID:=2842); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_LevitationCtrl_Acp6D (*This function block levitates or land a shuttle.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*ShuttleID = 0: Leviate/Land all Shuttles, Level>0: Leviate/Land specific shuttle*) (* *) (*#PAR*)
		Level : {REDUND_UNREPLICABLE} McAcp6DLevitationLevelEnum; (*Level = 0: Land, Level =1: Llevitate*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DLevCtrlInternalType := (cmdID:=2829); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MacroClear_Acp6D (*This function block clears an existing macro.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		MacroID : {REDUND_UNREPLICABLE} USINT; (*ID of the macro to be cleared. Macro IDs are 128 - 191*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DMacroInternalType := (cmdID:=2839,Level:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MacroList_Acp6D (*This function block returns a list of macro files stored on the specified file device. The macros must be stored in a folder named Macro.*) (* *) (*#OMIT*)
	VAR_INPUT
		FileDevice : STRING[80]; (*Name of an existing file device (e.g. "HD0") that was created with AS or the DevLink function block.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
	VAR_OUTPUT
		NumOfMacro : {REDUND_UNREPLICABLE} UDINT; (*Numbers of Macro stored on the file device*)
		MacroList : {REDUND_UNREPLICABLE} ARRAY[0..64] OF STRING[260]; (*List of macro file names*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*)
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McAcp6DMacroGetListInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MacroGetStatus_Acp6D (*This function block provides the status of a macro.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		MacroID : {REDUND_UNREPLICABLE} USINT; (*Macro ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		State : {REDUND_UNREPLICABLE} McAcp6DMacroStatusEnum; (*State = 0: Unsaved, State = 1: Reserved, State = 2: Saved*) (* *) (*#PAR*)
		NumberOfCommands : {REDUND_UNREPLICABLE} USINT; (*number of commands in the macro*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DMacroInternalType := (cmdID:=2839,Level:=4); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MacroLoad_Acp6D (*This function block saves a macro specified in a xml file. The macro is read from the path "FileDevice"/Macro. *) (* *) (*#OMIT*)
	VAR_INPUT
		FileDevice : STRING[80]; (*Name of an existing file device (e.g. "HD0") that was created with AS or the DevLink function block.*)
		FileName : STRING[80]; (*Name of the existing macro xml file.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		MacroID : USINT; (*Macro ID. If Macro ID = 0, the specified Macro ID from the xml file will be used.*)
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*)
	END_VAR
	VAR_OUTPUT
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*)
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*)
		NumberOfCommands : {REDUND_UNREPLICABLE} USINT; (*Number of commands executed.*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McAcp6DMacroLoadInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MacroRun_Acp6D (*This function block commands a shuttle to run a macro.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR*)
		MacroID : {REDUND_UNREPLICABLE} USINT; (*Macro ID*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DMacroInternalType := (cmdID:=2840); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_MacroSave_Acp6D (*This function block saves a macro.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		MacroID : {REDUND_UNREPLICABLE} USINT; (*Macro ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6DMacroInternalType := (cmdID:=2839,Level:=2); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_Move6D_Acp6D (*This function block starts a controlled movement for 1 shuttle to a specified absolute 6D position. *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Position : {REDUND_UNREPLICABLE} ARRAY[0..5] OF REAL; (*Position[0] = X [m], Position[1]  = Y [m], Position[2] = Z [m], Position[3] = Rx[rad], Position[4] = Ry [rad], Position[5] = Rz [rad]*) (* *) (*#PAR*)
		InPlaneVelocity : {REDUND_UNREPLICABLE} REAL; (*In plane maximum velocity [m/s]*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (*In plane maximum acceleration [m/s^2]*) (* *) (*#PAR*)
		ShortAxisVelocity : {REDUND_UNREPLICABLE} ARRAY[0..3] OF REAL; (*Short Axis maximum velocity. ShortAxisVelocity[0] = Z [m/s], ShortAxisVelocity[1] = Rx [rad/s], ShortAxisVelocity[2] = Rz [rad/s], ShortAxisVelocity[3] = Rz [rad/s].*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT := 0; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete in seconds*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} McAcp6D6DMoveInternalType := (cmdID:=2851); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveArcAngle_Acp6D (*This function block starts a controlled circular movement for 1 shuttle defined by arc center and arc angle to a specified absolute or relative 2D position*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Direction : {REDUND_UNREPLICABLE} McAcp6DArcDirectionEnum; (*Movement Direction. Direction = 0: Clockwise, Direction= 1: Counter-clockwise.*) (* *) (*#PAR*)
		EndVelocity : {REDUND_UNREPLICABLE} REAL; (*Tangential velocity at the end of the motion [m/s]*) (* *) (*#PAR*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (*Tangential maximum velocity [m/s]*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (*Tangential maximum acceleration [m/s^2]*) (* *) (*#PAR*)
		CenterX : {REDUND_UNREPLICABLE} REAL; (*X location of the arc center [m]*) (* *) (*#PAR*)
		CenterY : {REDUND_UNREPLICABLE} REAL; (*Y location of the arc center [m]*) (* *) (*#PAR*)
		Angle : {REDUND_UNREPLICABLE} REAL; (*Arc angle [rad]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete in seconds*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DArcMotionInternalType := (cmdID:=2826,aDef:=1); (*(cmdID:=2826,aDef:=1)*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveArcRadius_Acp6D (*This function block starts a controlled circular movement for 1 shuttle defined by by target position and arc radius to a specified absolute or relative 2D position.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Arc : {REDUND_UNREPLICABLE} McAcp6DArcTypeEnum; (*Arc Type. Arc=0: Minor Arc, Arc=1: Major Arc.*) (* *) (*#PAR*)
		Direction : {REDUND_UNREPLICABLE} McAcp6DArcDirectionEnum; (*Movement Direction. Direction = 0: Clockwise, Direction= 1: Counter-clockwise.*) (* *) (*#PAR*)
		EndVelocity : {REDUND_UNREPLICABLE} REAL; (*Tangential velocity at the end of the motion [m/s]*) (* *) (*#PAR*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (*Tangential maximum velocity [m/s]*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (*Tangential maximum acceleration [m/s^2]*) (* *) (*#PAR*)
		PositionX : {REDUND_UNREPLICABLE} REAL; (*X target position [m]*) (* *) (*#PAR*)
		PositionY : {REDUND_UNREPLICABLE} REAL; (*Y target position [m]*) (* *) (*#PAR*)
		Radius : {REDUND_UNREPLICABLE} REAL; (*Arc radius [m]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete [s]*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DArcMotionInternalType := (cmdID:=2826,aDef:=0); (*(cmdID:=2826,aDef:=0)*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveInPlanceSync_Acp6D (*This function block starts a controlled synchronized movement for 1-4 shuttles to specified absolute 2D positions.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfShuttles : {REDUND_UNREPLICABLE} USINT; (*Number of shuttles to move (up to 4).*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..3] OF USINT; (*Array of Shuttle ID*) (* *) (*#PAR*)
		PositionX : {REDUND_UNREPLICABLE} ARRAY[0..3] OF REAL; (*Array of X positions [m]*) (* *) (*#PAR*)
		PositionY : {REDUND_UNREPLICABLE} ARRAY[0..3] OF REAL; (*Array of Y positions [m]*) (* *) (*#PAR*)
		EndVelocity : {REDUND_UNREPLICABLE} ARRAY[0..3] OF REAL; (*Array of ending velocities [m/s]*) (* *) (*#PAR*)
		Velocity : {REDUND_UNREPLICABLE} ARRAY[0..3] OF REAL; (*Array of in plane maximum velocities [m/s]*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} ARRAY[0..3] OF REAL; (*Array of in plane maximum accelerations [m/s^2]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete in seconds*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DSyncMotionInternalType := (cmdID:=2835,maxNXbot:=4); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveInPlaneAsync_Acp6D (*This function block starts a movement for 1-78 shuttles to specifed absolute 2D positions. The path is generated automatically.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfShuttles : {REDUND_UNREPLICABLE} USINT; (*Number of shuttles to move*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..77] OF USINT; (*Array of Shuttle ID*) (* *) (*#PAR*)
		PositionX : {REDUND_UNREPLICABLE} ARRAY[0..77] OF REAL; (*Array of X positions [m]*) (* *) (*#PAR*)
		PositionY : {REDUND_UNREPLICABLE} ARRAY[0..77] OF REAL; (*Array of Y positions [m]*) (* *) (*#PAR*)
		OnlyMoveSelectedShuttle : {REDUND_UNREPLICABLE} USINT; (* 0: all shuttles can be moved to implement the command, 1: only the selected shuttles are moveable during the command*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (*In plane velocity at the end of the motion [m/s]*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (*In plane maximum acceleration [m/s^2]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DMultShInternalType := (cmdID:=2856,maxNXbot:=78,maxNXbotPerFrame:=9); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveInPlane_Acp6D (*This function block starts a controlled movement for 1 shuttle a specified absolute or relative 2D position*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution OF the FUNCTION block begins on a rising edge OF this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Path : {REDUND_UNREPLICABLE} McAcp6DInPlaneMovePathEnum; (*Path Type. Path=0: Diagonal, Path = 1: First X then Y, Path=2: First Y then X*) (* *) (*#PAR*)
		PositionX : {REDUND_UNREPLICABLE} REAL; (*X target position [m]*) (* *) (*#PAR*)
		PositionY : {REDUND_UNREPLICABLE} REAL; (*Y target position [m]*) (* *) (*#PAR*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (*In plane velocity at the end of the motion [m/s]*) (* *) (*#PAR*)
		EndVelocity : {REDUND_UNREPLICABLE} REAL; (*In plane maximum velocity [m/s]*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (*In plane maximum acceleration [m/s^2]*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*FUNCTION block is active and must continue TO be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete [s]*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DInPlaneMoveInternalType := (cmdID:=2824); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveShortAxis_Acp6D (*This function block starts a controlled movement for 1 shuttle a specified absolute or relative in Z-, RX-, RY- and RZ- (short axis) positions.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		RotationType : {REDUND_UNREPLICABLE} McAcp6DShortAxisRotationEnum; (*Rotation Type. RotationType = 0: Rotation around center of shuttle, RotationType = 1: Rotate around specificed center point*) (* *) (*#PAR*)
		PositionZ : {REDUND_UNREPLICABLE} REAL; (*Z target position [m]*) (* *) (*#PAR*)
		PositionRx : {REDUND_UNREPLICABLE} REAL; (*Rx target rotation [rad]*) (* *) (*#PAR*)
		PositionRy : {REDUND_UNREPLICABLE} REAL; (*Ry target rotation [rad]*) (* *) (*#PAR*)
		PositionRz : {REDUND_UNREPLICABLE} REAL; (*Rz target rotation [rad]*) (* *) (*#PAR*)
		VelocityZ : {REDUND_UNREPLICABLE} REAL; (*Z maximum velocity[m/s]*) (* *) (*#PAR*)
		VelocityRx : {REDUND_UNREPLICABLE} REAL; (*Rx maximum rotational velocity of [rad/s]*) (* *) (*#PAR*)
		VelocityRy : {REDUND_UNREPLICABLE} REAL; (*Ry maximum rotational velocity of [rad/s]*) (* *) (*#PAR*)
		VelocityRz : {REDUND_UNREPLICABLE} REAL; (*Rz maximum rotational velocity of [rad/s]*) (* *) (*#PAR*)
		RotationCenterX : {REDUND_UNREPLICABLE} REAL; (*Rotation center in X when RotationType = 1*) (* *) (*#PAR*)
		RotationCenterY : {REDUND_UNREPLICABLE} REAL; (*Rotation center in Y when RotationType = 1*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR
*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete in seconds*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DShortAxMotionInternalType := (cmdID:=2825); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveTrajectory_Acp6D (*This function block commands 1-12 shuttles to follow specified trajectories*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		NumberOfShuttles : {REDUND_UNREPLICABLE} USINT; (*Number of shuttles commanded to follow trajectories (up to 12)*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..11] OF USINT; (*Array of Shuttle ID*) (* *) (*#PAR*)
		TrajectoryID : {REDUND_UNREPLICABLE} ARRAY[0..11] OF USINT; (*Array of Trajectory ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT := 0; (*Error number*) (* *) (*#PAR*)
		TravelTime : {REDUND_UNREPLICABLE} REAL; (*Time needed for the motion to complete in seconds*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DMultShInternalType := (cmdID:=2823,maxNXbot:=12); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MovePause_Acp6D (*This function block pauses the current movement for 1 shuttle.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*ShuttleID = 0: All shuttles, ShuttleID >0: specific shuttle*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DPauseShInternalType := (cmdID:=2849,Level:=1); (*(cmdID:=2849,Level:=1)*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_PlanetCtrl_Acp6D (*This function block enables / disables planet mode for 1 star and 1-32 planets.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		Level : {REDUND_UNREPLICABLE} McAcp6DPlanetLevelEnum; (*0:disconnect from star xbot;1: connect to star xbot*) (* *) (*#PAR*)
		StarShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID of the star shuttle*) (* *) (*#PAR*)
		NumberOfPlanets : {REDUND_UNREPLICABLE} USINT; (*Number of Planets*) (* *) (*#PAR*)
		PlanetShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..31] OF USINT; (*Array of planet shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DPlanetMotionInternalType := (cmdID:=2847,maxNXbot:=32); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ReadCyclicChAxis_Acp6D (*This function block reads a cyclic feedback channel.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		ChannelID : {REDUND_UNREPLICABLE} USINT; (*Channel ID*) (* *) (*#PAR*)
		AxisID : {REDUND_UNREPLICABLE} USINT; (*Axis ID. X=1, Y=2, Z=3, RX=4, RY=5, RZ=6*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Value : {REDUND_UNREPLICABLE} REAL; (*Value read from cyclic channel*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DReadStreamInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ReadDigitalOutput_Acp6D (*This function block reads a digital output on the Acopos6D System. As long as input "Enable" and output "Valid" are equal to TRUE , the value of output "Value" is equal to the value of the digital output*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		DigitalOutputID : {REDUND_UNREPLICABLE} USINT; (*Digital output of the fieldbus number. ID 1-128*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		Value : {REDUND_UNREPLICABLE} BOOL; (*Digital output Value*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DReadDigSignalInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_Reboot_Acp6D (*This function block reboots the system.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DRebootInternalType := (cmdID:=2562); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_MoveResume_Acp6D (*This function block resumes shuttles which were paused with the function block MC_BR_PauseShuttles_Acp6D*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*ShuttleID = 0: All Shuttles, ShuttleID >0: Specific shuttle*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DPauseShInternalType := (cmdID:=2849,Level:=0); (*(cmdID:=2849,Level:=0)*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_SegGetStatus_Acp6D (*This function block returns temperature and power consumption information for 1 segment.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		SegmentID : {REDUND_UNREPLICABLE} USINT; (*Segment ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		SegmentInfo : {REDUND_UNREPLICABLE} McAcp6DGetSegStatusInfoType; (*Segment Info parameters*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetSegStatusInternalType := (cmdID:=2582); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGetProperty_Acp6D (*This function block returns property of 1 shuttle.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		ShuttleType : {REDUND_UNREPLICABLE} USINT; (*Shuttle Type*) (* *) (*#PAR*)
		PayloadWeight : {REDUND_UNREPLICABLE} REAL; (*Payload weight [kg]*) (* *) (*#PAR*)
		CenterOfGravity : {REDUND_UNREPLICABLE} REAL; (*Center of Gravity Z Axis [m]*) (* *) (*#PAR*)
		DimensionX : {REDUND_UNREPLICABLE} REAL; (*Shuttle X dimension [m]*) (* *) (*#PAR*)
		DimensionY : {REDUND_UNREPLICABLE} REAL; (*Shuttle Y dimension [m]*) (* *) (*#PAR*)
		AccelerationLimit : {REDUND_UNREPLICABLE} REAL; (*Acceleration limit [m/s^2]*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetShPropertyInternalType := (cmdID:=2846); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGetStatus_Acp6D (*This function block returns the status of 1 shuttle.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		FeedbackType : {REDUND_UNREPLICABLE} McAcp6DGetShStatusFeedbackEnum; (*mcACP6D_FEEDBACK_POSITION = 0, mcACP6D_FEEDBACK_FORCE = 1*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		ShuttleInfo : {REDUND_UNREPLICABLE} McAcp6DGetShStatusInfoType; (*Shuttle info parameter*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetShStatusInternalType := (cmdID:=2831); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGroupBuffer_Acp6D (*This function block controls the motion buffer of a shuttle group(s).*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		GroupID : {REDUND_UNREPLICABLE} USINT; (*GroupID = 0: Block all groups, GroupID > 0: Block specific group*) (* *) (*#PAR*)
		BufferOption : {REDUND_UNREPLICABLE} McAcp6DShGroupBufferOptionEnum; (*mcACP6D_GROUP_BUFFER_BLOCK = 0, mcACP6D_GROUP_BUFFER_RELEASE = 1*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT := 0; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGroupInternalType := (cmdID:=2838); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGroupCoupleCtrl_Acp6D (*This function block couples/decouples shuttles in a shuttle group*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		GroupID : {REDUND_UNREPLICABLE} USINT; (*GroupID = 0: All shuttle groups, GroupID > 0 Specific shuttle group*) (* *) (*#PAR*)
		Option : {REDUND_UNREPLICABLE} McAcp6DShGroupCoupleOptionEnum; (*mcACP6D_GROUP_DECOUPLE = 0, mcACP6D_GROUP_COUPLE = 1*) (* *) (*#PAR*)
		CoupleMode : {REDUND_UNREPLICABLE} McAcp6DShGroupCoupleModeEnum; (*mcACP6D_GROUP_COUPLE_ONLY_XY = 0, mcACP6D_GROUP_COUPLE_XY_RZ=1*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGroupInternalType := (cmdID:=2838); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGroupCreate_Acp6D (*This function block creates a shuttle group*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		GroupID : {REDUND_UNREPLICABLE} USINT; (*Group ID >0*) (* *) (*#PAR*)
		NumberOfShuttles : {REDUND_UNREPLICABLE} USINT; (*Number of shuttles to be in the group (up to 32)*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..31] OF USINT; (*Shuttles ID's to be in the group*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR
*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DCreateGroupInternalType := (cmdID:=2838,maxNXbot:=32,Level:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGroupDelete_Acp6D (*This function block deletes a shuttle group*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		GroupID : {REDUND_UNREPLICABLE} USINT; (*Group ID = 0: Delete all groups, Group ID > 0: Delete specific group*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR
*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGroupInternalType := (cmdID:=2838,Level:=1); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShGroupGetStatus_Acp6D (*This function block returns the status of a shuttle group*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		GroupID : {REDUND_UNREPLICABLE} USINT; (*Group ID > 0*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		State : {REDUND_UNREPLICABLE} McAcp6DShGroupCoupleOptionEnum; (*0: unbonded 1:bonded*) (* *) (*#PAR*)
		NumberOfShuttles : {REDUND_UNREPLICABLE} USINT; (*Number of shuttles in the group*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..31] OF USINT; (*Array of Shuttle ID's in the group*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetGrpStatusInternalType := (cmdID:=2838,maxNXbot:=32,Level:=6); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShReadForce_Acp6D (*This function block returns the force applied for each axis for 1 shuttle. The output is updated every cycle*number of shuttles.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values are up to date. If FALSE, the last output values are used.*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		ForceInfo : {REDUND_UNREPLICABLE} McAcp6DShForceInfoType; (*ForceInfo parameter*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DReadShInfoInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShReadPosition_Acp6D (*This function block returns the position for each axis for 1 shuttle. The output is updated every cycle*number of shuttles.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values are up to date. If FALSE, the last output values are used.*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		PositionInfo : {REDUND_UNREPLICABLE} McAcp6DShPositionInfoType; (*Position Information*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DReadShInfoInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShReadState_Acp6D (*This function block return a shuttle's state*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		State : {REDUND_UNREPLICABLE} McAcp6DShuttleStateEnum; (*Shuttle State parameter*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DReadShStateInternalType := (MaxXbots:=80); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_ShSetProperty_Acp6D (*This function block sets the property of 1-14 shuttles. *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		NumberOfProperties : {REDUND_UNREPLICABLE} USINT; (*Number of properties*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..13] OF USINT; (*Array of Shuttle ID*) (* *) (*#PAR*)
		Property : {REDUND_UNREPLICABLE} ARRAY[0..13] OF McAcp6DSetPropertyEnum; (*Array of properties.  mcACP6D_PROPERTY_SHUTTLE_TYPE = 0, mcACP6D_PROPERTY_PAYLOAD = 1,  mcACP6D_PROPERTY_Z_CENTR_GRAVITY = 2,  mcACP6D_PROPERTY_X_DIM = 3, mcACP6D_PROPERTY_Y_DIM = 5, mcACP6D_PROPERTY_ACC_LIMIT = 7*) (* *) (*#PAR*)
		Value : {REDUND_UNREPLICABLE} ARRAY[0..13] OF REAL; (*Array of property values; mcACP6D_PROPERTY_PAYLOAD [kg], mcACP6D_PROPERTY_Z_CENTR_GRAVITY [m], mcACP6D_PROPERTY_X_DIM [m], mcACP6D_PROPERTY_Y_DIM [m], mcACP6D_PROPERTY_ACC_LIMIT [m/s^2]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DSetShPropertyInternalType := (cmdID:=2845,maxNXbots:=14); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_Stop_Acp6D (*This function block stops a shuttle movement and clears it's motion buffer.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID = 0: Stop all shuttles, Shuttle ID > 0: Stop specific shuttle*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DStopShInternalType := (cmdID:=2827); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_SysGetStatus_Acp6D (*This function block returns the status of the controller*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*The function block's output values can be used.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		SystemInfo : {REDUND_UNREPLICABLE} McAcp6DGetSysStatusInfoType; (*SystemInfo Type*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DGetSysStatusInternalType := (cmdID:=2565); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_SysPowerOff_Acp6D (*This function block switches off the controller, all segments and deactivates all shuttles*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DDeactivateShInternalType := (cmdID:=2570); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_SysGetConfig_Acp6D (*This function block switches off the controller, all segments and deactivates all shuttles*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		NumberOfBytes : {REDUND_UNREPLICABLE} DINT; (*Number of bytes in the read configuration file*) (* *) (*#PAR*)
		Bytes : {REDUND_UNREPLICABLE} ARRAY[0..500000] OF USINT; (* the configuration file as a raw binary*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DSysGetConfigInternalType := (cmdID:=65293,maxNBytePerFrame:=39); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_SysPowerOn_Acp6D (*This function block switches on the controller, activates all segments and identifies all shuttles*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT := 0; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DActivateShInternalType := (cmdID:=2568); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_SysReadState_Acp6D (*This function block returns the state of the controller*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*successfully read PMC state*) (* *) (*#PAR*)
		State : {REDUND_UNREPLICABLE} McAcp6DSystemStateEnum; (*0: booting; 1: inactive; 2: activating; 5: operation; 7: deactivating; 8: error handling; 9: error*) (* *) (*#PAR*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WaitUntilCmdLabel_Acp6D (*This function block commands a shuttle to wait until another shuttle performs a movement with a specified command label*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*) (*#PAR*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		TriggerShuttleID : {REDUND_UNREPLICABLE} USINT; (*Trigger Shuttle ID*) (* *) (*#PAR*)
		TriggerType : {REDUND_UNREPLICABLE} McAcp6DWaitUntilCmdLblTrigEnum; (*0: Begin;1: End; 2: Execute*) (* *) (*#PAR*)
		TriggerCmdLabel : {REDUND_UNREPLICABLE} UINT; (*Trigger command label*) (* *) (*#PAR*)
		LabelType : {REDUND_UNREPLICABLE} McAcp6DWaitUntilCmdLblTypeEnum; (*0: Motion Cmd Label;1: Run Macro Cmd Label*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DWaitUntilInternalType := (cmdID:=2841,type_:=3,count:=1,option:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WaitUntilDisp_Acp6D (*This function block commands a shuttle to waits until another shuttle reaches a given displacement*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR#OPT*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		TriggerShuttleID : {REDUND_UNREPLICABLE} USINT; (*Trigger Shuttle ID*) (* *) (*#PAR*)
		Mode : {REDUND_UNREPLICABLE} McAcp6DWaitUntilDispModeEnum; (*Select boundary for a displacement. Mode=0: X only, Mode=1: Y only, Mode=2: XFactor*XPos + YFactor*YPos = Threshold*) (* *) (*#PAR*)
		TriggerType : {REDUND_UNREPLICABLE} McAcp6DWaitUntilDispTypeEnum; (*0: Greater Than;1: Less Than; 2: Positive cross;3: Negative cross*) (* *) (*#PAR*)
		Threshold : {REDUND_UNREPLICABLE} REAL; (*Threshold to wait until [m]*) (* *) (*#PAR*)
		XFactor : {REDUND_UNREPLICABLE} REAL; (*XFactor used for Mode=2*) (* *) (*#PAR*)
		YFactor : {REDUND_UNREPLICABLE} REAL; (*YFactor used for Mode=2*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DWaitUntilInternalType := (cmdID:=2841,type_:=4,count:=1,option:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WaitUntilDI_Acp6D (*This function block commands a shuttle to wait for a digital input*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		TriggerDigitalInputID : {REDUND_UNREPLICABLE} USINT; (*Trigger Digital Input ID*) (* *) (*#PAR*)
		TriggerType : {REDUND_UNREPLICABLE} McAcp6DWaitUntilDITrigEnum; (*0: Rising Edge;1: Falling Edge; 2: High Level;3: Low Level*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DWaitUntilInternalType := (cmdID:=2841,type_:=2,count:=1,option:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WaitUntilTime_Acp6D (*This function block commands a shuttle to wait for a specified time*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		CommandLabel : {REDUND_UNREPLICABLE} UINT; (*Optional command label to be associated with this command.*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
		Time : {REDUND_UNREPLICABLE} REAL; (*Time to wait [s]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DWaitUntilInternalType := (cmdID:=2841,type_:=0,count:=1,option:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WriteCyclicChCtrl_Acp6D (*This function block enables/disables 1-8 cyclic write channel(s)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		Level : {REDUND_UNREPLICABLE} USINT; (*0:Exit from stream mode;1: Enter stream mode*) (* *) (*#PAR*)
		NumberOfShuttles : {REDUND_UNREPLICABLE} USINT; (*Number of shuttles to configure (up to 8)*) (* *) (*#PAR*)
		ShuttleID : {REDUND_UNREPLICABLE} ARRAY[0..7] OF USINT; (*Array of Shuttle IDs*) (* *) (*#PAR*)
		ChannelID : {REDUND_UNREPLICABLE} ARRAY[0..7] OF USINT; (*Array of Stream IDs*) (* *) (*#PAR*)
		AxisID : {REDUND_UNREPLICABLE} ARRAY[0..7] OF USINT; (*Bit0: X;Bit1:Y;Bit2:Z;Bit3: Rx; Bit4: Ry; Bit5: Rz*) (* *) (*#PAR*)
		OffsetX : {REDUND_UNREPLICABLE} ARRAY[0..7] OF REAL; (*Offset in X for cyclic write position [m]*) (* *) (*#PAR*)
		OffsetY : {REDUND_UNREPLICABLE} ARRAY[0..7] OF REAL; (*Offset in Y for cyclic write position [m]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DStreamModeInternalType := (cmdID:=2830,maxNXbot:=8); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WriteCyclicCh_Acp6D (*This function block is used to cyclically write a value to a cyclic channel*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		ChannelID : {REDUND_UNREPLICABLE} USINT; (*Channel ID [1-10]*) (* *) (*#PAR*)
		AxisID : {REDUND_UNREPLICABLE} USINT; (*1: X; 2: Y; 3: Z; 4: Rx; 5: Ry; 6: Rz*) (* *) (*#PAR*)
		Value : {REDUND_UNREPLICABLE} REAL; (*Reference value. Position for axis X,Y,Z [m], Position for  Rx, Ry, Rz [rad]; Force for axis  X, Y, Z [N], Force for  axis Rx, Ry, Rz [Nm]*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*Successfully wrote value to channel*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DWriteInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_WriteDigitalInput_Acp6D (*This function block writes a digital input on the Acopos6D System. As long as input "Enable" and output "Valid" are equal to TRUE , the digital input is equal to "Value"*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*The function block is active as long as this input is set*) (* *) (*#PAR*)
		DigitalInputID : {REDUND_UNREPLICABLE} USINT; (*digital output (of the PLC fieldbus) ID# [1-128]*) (* *) (*#PAR*)
		Value : {REDUND_UNREPLICABLE} BOOL; (*desired digital signal level*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (*successfully set/reset the digital signal*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DSendDigSignalInternalType; (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneActivate_Acp6D (*activates an autoloading zone*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneActivateInternalType := (cmdID:=3078,Mode:=2);
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneDeactivate_Acp6D (*Deactivate an autoloading zone*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneDeactivInternalType := (cmdID:=3078,Mode:=3);
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneCreate_Acp6D (*Creates a new autoloading zone*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*) (* *) (*#PAR*)
		ZoneMode : {REDUND_UNREPLICABLE} USINT; (* 0: unloading zone, 1: loading zone*) (* *) (*#PAR*)
		UnloadingMode : {REDUND_UNREPLICABLE} USINT; (* 0: soft-landing mode, 1: hard-landing mode*) (* *) (*#PAR*)
		ZoneCenterX : {REDUND_UNREPLICABLE} REAL; (* X coordinate of zone center at flyway boundary (m)*) (* *) (*#PAR*)
		ZoneCenterY : {REDUND_UNREPLICABLE} REAL; (* Y coordinate of zone center at flyway boundary (m)*) (* *) (*#PAR*)
		ZoneLength : {REDUND_UNREPLICABLE} REAL; (* zone length in loading/unloading direction (m)*) (* *) (*#PAR*)
		ZoneWidth : {REDUND_UNREPLICABLE} REAL; (* zone width (m)*) (* *) (*#PAR*)
		MaxShuttleSizeX : {REDUND_UNREPLICABLE} REAL; (* max mover size in X (m)*) (* *) (*#PAR*)
		MaxShuttleSizeY : {REDUND_UNREPLICABLE} REAL; (* max mover size in Y (m)*) (* *) (*#PAR*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (* max travilling speed inside the zone (m/s)*) (* *) (*#PAR*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (* max travelling acceleration inside the zone (m/s^s)*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneCreateInternalType := (cmdID:=3078,Mode:=0);
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneDelete_Acp6D (*deletes one or all autoloading zone(s)*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: 0 - delete all zone, >0 - delete single zone *) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneDeleteInternalType := (cmdID:=3078,Mode:=1); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneGetStatus_Acp6D (*Get status of an autoloading zone*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		ZoneStatus : {REDUND_UNREPLICABLE} McAcp6DZoneStatusType; (*Zone Status*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneGetStatusInternalType := (cmdID:=3081); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneHoldReady_Acp6D
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
		ZoneStatus : {REDUND_UNREPLICABLE} McAcp6DZoneStatusType; (*Zone Status*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneHoldReadyInternalType := (CmdSta:=0); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneClear_Acp6D
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneClearInternalType := (cmdID:=3080); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneUnload_Acp6D
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		ZoneID : {REDUND_UNREPLICABLE} USINT; (* zone ID: >0 for creation/activation/deactivation; >=0 with delete zone(s)*)
		ShuttleID : {REDUND_UNREPLICABLE} USINT; (*Shuttle ID*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT; (*Error number*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McAcp6DZoneUnloadInternalType := (cmdID:=3079);
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MC_BR_GetErrorCode_Acp6D (*This function block switches off the controller, all segments and deactivates all shuttles*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Controller : REFERENCE TO McAcp6DControllerType; (*The controller reference provides the link between the function block and the Acopos6D system.*) (* *) (*#PAR*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Valid : {REDUND_UNREPLICABLE} BOOL; (* The function block's output values can be used.*)
		Acknowledge : {REDUND_UNREPLICABLE} BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR*)
		Aborted : {REDUND_UNREPLICABLE} BOOL; (*Command aborted by another command*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Error occurred during execution.*) (* *) (*#PAR*)
		ErrorID : {REDUND_UNREPLICABLE} DINT := 0; (*Error number*) (* *) (*#PAR*)
		NumberOfErrors : {REDUND_UNREPLICABLE} USINT; (* Number of error codes read *)
		ErrorCodes : {REDUND_UNREPLICABLE} ARRAY[0..8] OF DINT; (* The read error codes*)
	END_VAR
	VAR
		Internal : McAcp6DGetErrorCodeInternalType := (cmdID:=2573,maxErrors:=9); (* *) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK
