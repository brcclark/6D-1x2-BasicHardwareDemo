
TYPE
	McAcp6D6DMoveInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
	END_STRUCT;
	McAcp6DActivateShInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
	END_STRUCT;
	McAcp6DArcMotionInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		aDef : USINT;
		Mode : USINT;
		Direction : USINT;
		Arc : USINT;
	END_STRUCT;
	McAcp6DAutoRefreshInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FrmCount : USINT;
		RegVal : UDINT;
		curXID : UDINT;
		EventID1 : UINT;
		EventID2 : UINT;
		PrevEventID1 : UINT;
		PrevEventID2 : UINT;
		PrevEventCode1 : SINT;
		PrevEventCode2 : SINT;
		EventAck : SINT;
	END_STRUCT;
	McAcp6DCamInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		axisNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNAxis : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DCmdEventLogInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ArEventLogGetIdent_0 : ArEventLogGetIdent;
		ArEventLogCreate_0 : ArEventLogCreate;
		ArEventLogWrite_0 : ArEventLogWrite;
		cmdID : UINT;
		EventID : DINT;
		Severity : USINT;
		WriteState : DINT;
		CreateState : USINT;
		Facility : UINT;
		ErrorCode : UINT;
		Message : STRING[300];
		HelpStr : STRING[80];
		Buffer : ARRAY[0..999]OF USINT;
		Status : BOOL;
		ErrorType : UINT;
		State : UDINT;
		ShuttleID : UDINT;
		SegmentID : UDINT;
		Axis : UDINT;
		DetailedCode : UDINT;
		CurrError : USINT;
		NumOfErrors : USINT;
		GetErrorCode : DINT;
	END_STRUCT;
	McAcp6DCmdLogAddBufInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		CmdID : UINT;
		LogBuffer : McAcp6DLogBufferType;
		Severity : USINT;
		Facility : UINT;
		ErrorCode : UINT;
		Status : BOOL;
	END_STRUCT;
	McAcp6DCmdProcesserInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		TicketCompleted : BOOL;
		CmdCounterFromPMC : USINT;
		CmdCounterToPMC : USINT;
		CmdID : UINT;
		CmdIDRtn : UINT;
		nextTicketIndex : USINT;
		tempCounter : INT;
		EventIDFound : BOOL;
		loopcounter : UINT;
	END_STRUCT;
	McAcp6DConfigDIInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		diNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNDi : SINT;
		DummyDone : BOOL;
		Type_ : USINT;
	END_STRUCT;
	McAcp6DConfigDOInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		doNum : USINT;
		xIndex : SINT;
		eventID : USINT;
		cmdID : UINT;
		maxNDo : SINT;
		Type : ARRAY[0..4]OF USINT;
		Mode : ARRAY[0..4]OF USINT;
		AxisID : ARRAY[0..4]OF USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DConfigStreamInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		stmNum : USINT;
		Index : USINT;
		maxNStm : SINT;
		FeedbackMode : ARRAY[0..7]OF USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DCreateGroupInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		xbotNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNXbot : SINT;
		Level : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DDeactivateShInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
	END_STRUCT;
	McAcp6DSysGetConfigInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		totalByteNum : DINT;
		numFrames : DINT;
		cmdHB : INT;
		xIndex : DINT;
		beginning_index : DINT;
		numBytesToRead : SINT;
		DummyDone : BOOL;
		cmdID : UINT;
		maxNBytePerFrame : SINT;
	END_STRUCT;
	McAcp6DForceModeInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Mode : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGetBufStatusInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Level : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGetErrorCodeInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		errIndex : INT;
		DummyDone : BOOL;
		maxErrors : SINT;
	END_STRUCT;
	McAcp6DGetGrpStatusInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		xbotNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNXbot : SINT;
		Level : USINT;
		State : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGetPayloadInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		nTemp : DWORD;
		cmdID : UINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGetSegStatusInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		DummyDone : BOOL;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		intTemp : USINT;
	END_STRUCT;
	McAcp6DGetShPropertyInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		nTemp : DWORD;
		cmdID : UINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGetShStatusInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		State : USINT;
		timeout : UINT;
		cmdHB : INT;
		nTemp : DWORD;
		bTemp : BYTE;
		cmdID : UINT;
		FeedbackType : USINT;
		PosTemp : REAL;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGetSysStatusInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		State : USINT;
		timeout : UINT;
		cmdHB : INT;
		nTemp : DWORD;
		mTemp : BYTE;
		cmdID : UINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DGroupInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Level : USINT;
		Mode : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DInPlaneMoveInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		nTemp : USINT;
		Mode : USINT;
		Path : USINT;
		PosTemp : REAL;
	END_STRUCT;
	McAcp6DJogVelInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DLevCtrlInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Level : USINT;
	END_STRUCT;
	McAcp6DMacroCmdNameInternalEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_CMD_MACRO_CLEAR := 0,
		mcACP6D_CMD_MACRO_SAVE := 1,
		mcACP6D_CMD_MACRO_RUN := 2,
		mcACP6D_CMD_MOVE_IN_PLANE := 3,
		mcACP6D_CMD_MOVE_ARC_ANGLE := 4,
		mcACP6D_CMD_MOVE_ARC_RADIUS := 5,
		mcACP6D_CMD_MOVE_SHORT_AXIS := 6,
		mcACP6D_CMD_WAIT_CMD_LABEL := 7,
		mcACP6D_CMD_WAIT_DIGITAL_INPUT := 8,
		mcACP6D_CMD_WAIT_DISP_TRIGGER := 9,
		mcACP6D_CMD_WAIT_TIME := 10
		);
	McAcp6DMacroErrInfoInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		CommandID : UINT;
		Parameter : {REDUND_UNREPLICABLE} STRING[80];
		FileIO : McAcp6DMacroErrorInternalType;
		Syntax : McAcp6DMacroErrorInternalType;
		Command : McAcp6DMacroErrorInternalType;
		Xml : McAcp6DMacroErrorInternalType;
	END_STRUCT;
	McAcp6DMacroErrorInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ErrorID : DINT;
		Error : BOOL;
	END_STRUCT;
	McAcp6DMacroFubInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		MC_BR_MacroClear_Acp6D_0 : MC_BR_MacroClear_Acp6D;
		MC_BR_MacroSave_Acp6D_0 : MC_BR_MacroSave_Acp6D;
		MC_BR_MacroRun_Acp6D_0 : MC_BR_MacroRun_Acp6D;
		MC_BR_MoveInPlane_Acp6D_0 : MC_BR_MoveInPlane_Acp6D;
		MC_BR_MoveArcAngle_Acp6D_0 : MC_BR_MoveArcAngle_Acp6D;
		MC_BR_MoveArcRadius_Acp6D_0 : MC_BR_MoveArcRadius_Acp6D;
		MC_BR_MoveShortAxis_Acp6D_0 : MC_BR_MoveShortAxis_Acp6D;
		MC_BR_WaitUntilCmdLabel_Acp6D_0 : MC_BR_WaitUntilCmdLabel_Acp6D;
		MC_BR_WaitUntilDI_Acp6D_0 : MC_BR_WaitUntilDI_Acp6D;
		MC_BR_WaitUntilDisp_Acp6D_0 : MC_BR_WaitUntilDisp_Acp6D;
		MC_BR_WaitUntilTime_Acp6D_0 : MC_BR_WaitUntilTime_Acp6D;
		FileOpen_0 : FileOpen;
		FileRead_0 : FileRead;
		xmlCreateMemoryReader_0 : xmlCreateMemoryReader;
		xmlReadNextNode_0 : xmlReadNextNode;
		xmlReadAttributeNr_0 : xmlReadAttributeNr;
		xmlCloseMemoryReader_0 : xmlCloseMemoryReader;
		FileClose_0 : FileClose;
	END_STRUCT;
	McAcp6DMacroGetListInternalEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_DIR_WAIT := 0,
		mcACP6D_DIR_INFO := 1,
		mcACP6D_DIR_OPEN := 2,
		mcACP6D_DIR_CREATE := 3,
		mcACP6D_DIR_CLOSE := 4,
		mcACP6D_DIR_READ := 5,
		mcACP6D_DIR_DONE := 6,
		mcACP6D_DIR_ERROR := 99
		);
	McAcp6DMacroGetListInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ReadDirState : McAcp6DMacroGetListInternalEnum;
		DirInfo_0 : DirInfo;
		DirStatus : UINT;
		DirNum : UDINT;
		FileCount : INT;
		DirCreate_0 : DirCreate;
		DirRead_0 : DirRead;
		ReadData : fiDIR_READ_DATA;
		i : USINT;
		NUM_MACRO_FILES : USINT := 64;
		FileName : STRING[260];
		NumOfFiles : UDINT;
	END_STRUCT;
	McAcp6DMacroInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Level : USINT;
		State : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DMacroLoadInternalEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_XML_RESET,
		mcACP6D_XML_WAIT,
		mcACP6D_XML_FILE_OPEN,
		mcACP6D_XML_FILE_READ,
		mcACP6D_XML_CREATE_MEMORY_READ,
		mcACP6D_XML_READ_ATTRIBUTE,
		mcACP6D_XML_READ_PARAMETER,
		mcACP6D_XML_READ_COMMAND,
		mcACP6D_XML_READ_COMMAND_ID,
		mcACP6D_XML_STOP_READ,
		mcACP6D_XML_FILE_CLOSE,
		mcACP6D_XML_MOVE_CMD,
		mcACP6D_XML_EDIT_MACRO,
		mcACP6D_XML_RUN_MACRO,
		mcACP6D_XML_LINEAR_MOTION,
		mcACP6D_XML_ARC_MOTION,
		mcACP6D_XML_WAIT_UNTIL,
		mcACP6D_XML_SHORT_AXIS_MOTION,
		mcACP6D_XML_READ_INIT,
		mcACP6D_XML_DONE,
		mcACP6D_XML_ERROR := 99
		);
	McAcp6DMacroLoadInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuB : McAcp6DMacroFubInternalType;
		XmlState : McAcp6DMacroLoadInternalEnum;
		ErrorState : INT;
		FileIdent : UDINT;
		XmlData : ARRAY[0..10024]OF USINT;
		XmlIdent : UDINT;
		ElementName : STRING[80];
		ElementValue : STRING[80];
		AttrIndex : USINT;
		AttributeName : STRING[80];
		AttributeValue : {REDUND_UNREPLICABLE} STRING[80];
		ErrorCount : USINT;
		ReadMacroStatus : UINT;
		IsClosed : BOOL;
		ParameterList : ARRAY[0..mcACP6D_MACRO_PARAM_ARR]OF REAL;
		ParameterStrList : {REDUND_UNREPLICABLE} ARRAY[0..mcACP6D_MACRO_PARAM_ARR]OF STRING[80] := ['id','Name','MacroID','XTarget','YTarget','ZTarget','ShuttleID','CmdLabel','RXTarget','RYTarget','RZTarget','Acc','Vel','EndVel','PositionMode','PathType','Radius','ArcType','Angle','Direction','ArcMode','TimeDelay','DisplacementTrigger','DigitalID','PosFactorA','PosFactorB','TriggerCmdLabel','TriggerType','TriggerShuttleID','RotationCenterX','RotationCenterY','VelRx','VelRy','VelRz','VelZ','LabelType','Threshold'];
		CmdNameList : {REDUND_UNREPLICABLE} ARRAY[0..mcACP6D_MACRO_CMD_NAME_ARR]OF STRING[80] := ['MacroClear','MacroSave','MacroRun','MoveInPlane','MoveArcAngle','MoveArcRadius','MoveShortAxis','WaitCmdLabel','WaitDI','WaitDisp','WaitTime',10('')];
		ErrorInfo : McAcp6DMacroErrInfoInternalType;
		i : INT;
		k : INT;
		CmdState : McAcp6DMacroCmdNameInternalEnum;
	END_STRUCT;
	McAcp6DMacroParamInternalEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_PARAM_CMD_ID := 0,
		mcACP6D_PARAM_NAME := 1,
		mcACP6D_PARAM_MACRO_ID := 2,
		mcACP6D_PARAM_X_TARGET := 3,
		mcACP6D_PARAM_Y_TARGET := 4,
		mcACP6D_PARAM_Z_TARGET := 5,
		mcACP6D_PARAM_SHUTTLE_ID := 6,
		mcACP6D_PARAM_CMD_LABEL := 7,
		mcACP6D_PARAM_RX_TARGET := 8,
		mcACP6D_PARAM_RY_TARGET := 9,
		mcACP6D_PARAM_RZ_TARGET := 10,
		mcACP6D_PARAM_ACC := 11,
		mcACP6D_PARAM_VEL := 12,
		mcACP6D_PARAM_END_VEL := 13,
		mcACP6D_PARAM_POSITION_MODE := 14,
		mcACP6D_PARAM_PATH_TYPE := 15,
		mcACP6D_PARAM_RADIUS := 16,
		mcACP6D_PARAM_ARC_TYPE := 17,
		mcACP6D_PARAM_ANGLE := 18,
		mcACP6D_PARAM_DIRECTION := 19,
		mcACP6D_PARAM_ARC_MODE := 20,
		mcACP6D_PARAM_TIME_DELAY := 21,
		mcACP6D_PARAM_DISP_TRIGG := 22,
		mcACP6D_PARAM_DI_ID := 23,
		mcACP6D_PARAM_FACTOR_A := 24,
		mcACP6D_PARAM_FACTOR_B := 25,
		mcACP6D_PARAM_TRIGG_CMDLBL := 26,
		mcACP6D_PARAM_TRIGG_TYPE := 27,
		mcACP6D_PARAM_TRIGG_SH_ID := 28,
		mcACP6D_PARAM_ROT_CENTER_X := 29,
		mcACP6D_PARAM_ROT_CENTER_Y := 30,
		mcACP6D_PARAM_VEL_RX := 31,
		mcACP6D_PARAM_VEL_RY := 32,
		mcACP6D_PARAM_VEL_RZ := 33,
		mcACP6D_PARAM_VEL_Z := 34,
		mcACP6D_PARAM_LABEL_TYPE := 35,
		mcACP6D_PARAM_THRESHOLD := 36
		);
	McAcp6DMotionBufInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Level : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DMultShInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		numFrames : DINT;
		cmdHB : INT;
		xIndex : SINT;
		totalXbotNum : SINT;
		beginning_index : SINT;
		numXbotsToSend : SINT;
		requestEventID : BOOL;
		cmdID : {REDUND_UNREPLICABLE} UINT;
		maxNXbot : SINT;
		maxNXbotPerFrame : SINT;
	END_STRUCT;
	McAcp6DPauseShInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		Level : USINT;
	END_STRUCT;
	McAcp6DPlanetMotionInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		xbotNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNXbot : SINT;
		Level : USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DReadDigSignalInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ByteOffset : DINT;
		BitOffset : DINT;
		RegVal : USINT;
	END_STRUCT;
	McAcp6DReadShInfoInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		RegVal : UDINT;
		curXID : USINT;
		maxID : USINT;
	END_STRUCT;
	McAcp6DReadShStateInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ByteOffset : USINT;
		BitOffset : USINT;
		uTemp : USINT;
		MaxXbots : USINT;
		State : USINT;
	END_STRUCT;
	McAcp6DReadStreamInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		AxisCount : USINT;
		ByteOffset : UINT;
		tempFBAxis : USINT;
		index : SINT;
		CurrentAxisOffset : USINT;
		RegVal : DWORD;
	END_STRUCT;
	McAcp6DRebootInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
	END_STRUCT;
	McAcp6DSendDigSignalInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ByteOffset : DINT;
		BitOffset : DINT;
		step1 : USINT;
		step2 : USINT;
		step3 : USINT;
		RegVal : USINT;
	END_STRUCT;
	McAcp6DSetShPropertyInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		xbotNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNXbots : SINT;
		Property : ARRAY[0..13]OF USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DShortAxMotionInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		nTemp : USINT;
		cmdID : UINT;
		Mode : USINT;
		RotationType : USINT;
	END_STRUCT;
	McAcp6DStopShInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
	END_STRUCT;
	McAcp6DStreamModeInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		xbotNum : USINT;
		xIndex : SINT;
		cmdID : UINT;
		maxNXbot : SINT;
		AxisID : ARRAY[0..7]OF USINT;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DSyncMotionInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		xbotNum : USINT;
		xIndex : SINT;
		nTemp : DWORD;
		cmdID : UINT;
		maxNXbot : SINT;
	END_STRUCT;
	McAcp6DWaitUntilInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		FuncInfo : McAcp6DFuncInfoType;
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		type_ : USINT;
		count : USINT;
		option : USINT;
		TriggerType : USINT;
		LabelType : USINT;
		Mode : USINT;
		Type : USINT;
	END_STRUCT;
	McAcp6DWriteInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		ByteOffset : UDINT;
	END_STRUCT;
	McAcp6DZoneActivateInternalType : 	STRUCT 
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
		Mode : USINT;
	END_STRUCT;
	McAcp6DZoneClearInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DZoneCreateInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
		Mode : USINT;
	END_STRUCT;
	McAcp6DZoneDeactivInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
		Mode : USINT;
	END_STRUCT;
	McAcp6DZoneDeleteInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
		Mode : USINT;
	END_STRUCT;
	McAcp6DZoneGetStatusInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
	END_STRUCT;
	McAcp6DZoneHoldReadyInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		CmdSta : INT;
		DummyDone : BOOL;
		Mode : USINT;
		wait_to_appear_bool : BOOL;
		wait_for_xbot_to_appear : MC_BR_ZoneGetStatus_Acp6D;
		xbot_is_in_zone_or_error : BOOL;
		PMC_ReadXbotState_db : INT;
	END_STRUCT;
	McAcp6DZoneUnloadInternalType : 	STRUCT  (* *) (* *) (*#OMIT*)
		timeout : UINT;
		cmdHB : INT;
		cmdID : UINT;
		FuncInfo : McAcp6DFuncInfoType;
		nTemp : DWORD;
		DummyDone : BOOL;
	END_STRUCT;
END_TYPE
