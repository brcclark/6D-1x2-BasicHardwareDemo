(*Main System Interface Types*)

TYPE
	MainIfTyp : 	STRUCT 
		Cmd : MainIfCmdTyp;
		Par : MainIfParTyp;
		Cfg : MainIfCfgTyp;
		Status : MainIfStatusTyp;
	END_STRUCT;
	MainIfCmdTyp : 	STRUCT 
		Power : BOOL;
		Start : BOOL;
		Stop : BOOL;
		Reset : BOOL;
	END_STRUCT;
	MainIfParTyp : 	STRUCT 
		Tmp : USINT;
	END_STRUCT;
	MainIfCfgTyp : 	STRUCT 
		ShuttleCount : USINT;
	END_STRUCT;
	MainIfStatusTyp : 	STRUCT 
		PowerOn : BOOL;
		Running : BOOL;
		Error : BOOL;
	END_STRUCT;
END_TYPE

(*Process Info Interface*)

TYPE
	ProcessInfoIfTyp : 	STRUCT 
		Cmd : ProcessInfoIfCmdTyp;
		Par : ProcessInfoIfParTyp;
		Sts : ProcessInfoIfStsTyp;
	END_STRUCT;
	ProcessInfoIfCmdTyp : 	STRUCT 
		Enable : BOOL;
		ResetData : BOOL;
	END_STRUCT;
	ProcessInfoIfParTyp : 	STRUCT 
		CurrentProductCount : UDINT;
	END_STRUCT;
	ProcessInfoIfStsTyp : 	STRUCT 
		Enabled : BOOL;
		CurrentPPM : REAL;
		CurrentPPH : REAL;
		CurrentBlistersPerMinute : REAL;
		CurrentLayersPerMinute : REAL;
	END_STRUCT;
END_TYPE

(*6D Controller Interface Types*)

TYPE
	Acp6DCmdType : 	STRUCT 
		Power : BOOL;
		ErrorReset : BOOL;
		GetErrorInfo : BOOL;
	END_STRUCT;
	Acp6DCtrlType : 	STRUCT 
		Cmd : Acp6DCmdType;
		Status : Acp6DStatusType;
		Par : Acp6DParType;
	END_STRUCT;
	Acp6DParType : 	STRUCT 
		Mode : McAcp6DMoveModeEnum;
		PathType : McAcp6DInPlaneMovePathEnum;
		Acceleration : REAL;
		EndVelocity : REAL;
		Velocity : REAL;
		ShuttleID : USINT;
		SegmentID : USINT;
		PositionX : REAL;
		PositionY : REAL;
	END_STRUCT;
	Acp6DStatusType : 	STRUCT 
		Error : BOOL;
		ErrorID : DINT;
		Ready : BOOL;
		PowerOn : BOOL;
		ReadyToPowerOn : BOOL;
		ErrorCodes : ARRAY[0..8]OF DINT;
	END_STRUCT;
	Acp6DShuttleInfoType : 	STRUCT 
		State : Acp6DShuttleStateInfoTyp;
		Force : Acp6DShuttleForceInfoTyp;
		Position : Acp6DShuttlePosInfoTyp;
	END_STRUCT;
	Acp6DShuttleStateInfoTyp : 	STRUCT 
		Valid : BOOL;
		Value : McAcp6DShuttleStateEnum;
	END_STRUCT;
	Acp6DShuttlePosInfoTyp : 	STRUCT 
		Valid : BOOL;
		Value : McAcp6DShPositionInfoType;
	END_STRUCT;
	Acp6DShuttleForceInfoTyp : 	STRUCT 
		Valid : BOOL;
		Value : McAcp6DShForceInfoType;
	END_STRUCT;
END_TYPE

(*Shuttle Interface Types*)

TYPE
	gShuttleIfCmdTyp : 	STRUCT  (*Commands for controlling a shuttle*)
		Enable : BOOL; (*Command for enabling the control of a shuttle in the process*)
		Recover : BOOL; (*Command for a shuttle to start recovery*)
		NextStep : BOOL; (*Command for a shuttle to start the next step in the process*)
		ResetProductInfo : BOOL; (*Command to reset all the product info on a shuttle*)
		Stop : BOOL; (*Command to stop the process for a shuttle*)
		MoveMacro : BOOL;
		MovePlane : BOOL;
		Land : BOOL;
		Tare : BOOL;
		Weigh : BOOL;
	END_STRUCT;
	gShuttleIfCfgMacrosTyp : 	STRUCT  (*Structure of the macro IDs used for operation*)
		RobotProcessMacro : gShuttleIfMacroEnum; (*Macro ID used for sending a shuttle from the load station to the print station*)
	END_STRUCT;
	gShuttleIfParTyp : 	STRUCT  (*Parameters for the shuttle's operation*)
		NumLayers : USINT; (*Number of layers for this defined recipe*)
		MacroIDs : gShuttleIfCfgMacrosTyp; (*Macro's used for routing shuttles*)
		X : REAL;
		Y : REAL;
		Vel : REAL;
		EndVel : REAL;
		Accel : REAL;
	END_STRUCT;
	gShuttleIfConfigTyp : 	STRUCT  (*Configuration values for a shuttle*)
		ShuttleId : USINT; (*ShuttleID of this shuttle*)
	END_STRUCT;
	gShuttleIfMacroEnum : 
		( (*Macro IDs that are used to denote which macro means what*)
		MACRO_ROBOT_PROCESS := 128, (*Macro ID used for sending a shuttle from the load station to the print station*)
		MACRO_ROBOT_PROCESS1, (*Macro ID used for sending a shuttle from the load station to the print station*)
		MACRO_RECOVERY_GROUP0 := 135, (*Macro ID used for recovering the group 0 shuttles*)
		MACRO_RECOVERY_GROUP1 (*Macro ID used for recovering the group 0 shuttles*)
		);
	gShuttleIfDestEnum : 
		( (*Destinations for a shuttle to move to*)
		DEST_LOAD, (*Destination Load station*)
		DEST_PRINT, (*Destination Printing station*)
		DEST_DOSE1, (*Destination Dose 1 station*)
		DEST_DOSE2, (*Destination Dose 2 station*)
		DEST_TAMP, (*Destination Tamping station*)
		DEST_UNLOAD (*Destination unload*)
		);
	ShStateEnum : 
		(
		SH_OFF, (*Shuttle is in the off/idle state*)
		SH_INIT, (*Shuttle is in the initilization state*)
		SH_STARTUP, (*Shuttle is in the startup state*)
		SH_IDLE, (*Shuttle is in the idle state after having been recovered*)
		SH_MOVE_PLANE,
		SH_MOVE_MACRO,
		SH_LANDING,
		SH_LANDED,
		SH_WEIGHING,
		SH_STOPPING,
		SH_ERROR := 65535 (*Shuttle is in the error state*)
		);
	gShuttleIfStatusTyp : 	STRUCT  (*Status information for the shuttle*)
		CurrentDestination : gShuttleIfDestEnum; (*Destination the shuttle is currently moving towards*)
		ShuttleInfo : Acp6DShuttleInfoType; (*CurrentStatus Information about the shuttle*)
		Error : BOOL; (*Shuttle is currently in an error state*)
		ErrorState : ShStateEnum; (*State the shuttle errored at*)
		Recovered : BOOL; (*Shuttle has been recovered*)
		CyclicPositionX : REAL;
		CyclicPositionY : REAL;
		TareWeight : REAL;
		ProductWeight : REAL;
	END_STRUCT;
	gShuttleIfTyp : 	STRUCT  (*Interface for controlling a shuttle*)
		Cmd : gShuttleIfCmdTyp; (*Commands to issue to a shuttle*)
		Par : gShuttleIfParTyp; (*Parameters for the process for this shuttle*)
		Cfg : gShuttleIfConfigTyp; (*Configuration values for this shuttle*)
		Status : gShuttleIfStatusTyp; (*Status information related to this shuttle*)
	END_STRUCT;
END_TYPE

(*Robot Interface Types*)

TYPE
	RobotIfTyp : 	STRUCT 
		Cmds : RobotIfCmdsTyp;
		Pars : RobotIfParsTyp;
		Status : RobotIfStatusTyp;
	END_STRUCT;
	RobotIfCmdsTyp : 	STRUCT 
		Admin : RobotIfAdminCmdsTyp;
		Process : RobotIfProcessCmdsTyp;
	END_STRUCT;
	RobotIfAdminCmdsTyp : 	STRUCT 
		Power : BOOL;
		Home : BOOL;
		Reset : BOOL;
	END_STRUCT;
	RobotIfProcessCmdsTyp : 	STRUCT 
		MoveToSync : BOOL;
		Sync : BOOL;
		UnSync : BOOL;
		Run : BOOL;
	END_STRUCT;
	RobotIfParsTyp : 	STRUCT 
		SyncPosition : McPosType;
		SyncFrame : STRING[80];
		SyncFrameIdent : UDINT;
		MoveToSyncVel : LREAL;
		MoveToSyncAccel : LREAL;
		MoveToSyncDecel : LREAL;
		ShuttleIdx : USINT;
	END_STRUCT;
	RobotIfStatusTyp : 	STRUCT 
		Synced : BOOL;
		Homed : BOOL;
		Powered : BOOL;
		AtSync : BOOL;
		Running : BOOL;
	END_STRUCT;
	SceneViewerTyp : 	STRUCT 
		Cmds : SceneViewerCmdsTyp;
		Pars : SceneViewerParsTyp;
	END_STRUCT;
	SceneViewerCmdsTyp : 	STRUCT 
		Record : BOOL;
		Clear : BOOL;
	END_STRUCT;
	SceneViewerParsTyp : 	STRUCT 
		LineColor : SceneViewerColorTyp;
	END_STRUCT;
	SceneViewerColorTyp : 	STRUCT 
		Red : REAL;
		Green : REAL;
		Blue : REAL;
	END_STRUCT;
END_TYPE

(*Sync Interface Types*)

TYPE
	SyncSecIfTyp : 	STRUCT 
		Cmds : SyncSecCmdsIfTyp;
		Pars : USINT;
		Status : SyncSecIfStatusTyp;
	END_STRUCT;
	SyncSecCmdsIfTyp : 	STRUCT 
		Admin : SyncSecIfAdminCmdsTyp;
		Proc : SyncSecIfProcCmdsTyp;
	END_STRUCT;
	SyncSecIfAdminCmdsTyp : 	STRUCT 
		New_Member : USINT;
	END_STRUCT;
	SyncSecIfProcCmdsTyp : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		ReleaseSync : BOOL;
		ReleaseUnSync : BOOL;
	END_STRUCT;
	SyncSecIfStatusTyp : 	STRUCT 
		Running : BOOL;
		SyncReady : BOOL;
		UnsyncReady : BOOL;
		Error : BOOL;
		AxisToSync : McAxisType;
	END_STRUCT;
	SyncSecStatusEnum : 
		(
		SYNC_OFF,
		SYNC_INIT,
		SYNC_RUNNING,
		SYNC_STOPPING,
		SYNC_ERROR
		);
END_TYPE

(*Recovery Interface Type*)

TYPE
	Acp6DRecoveryIfTyp : 	STRUCT 
		Cmd : Acp6DRecoveryCmdTyp;
		Par : Acp6DRecoveryParTyp;
		Sts : Acp6DRecoveryStsTyp;
	END_STRUCT;
	Acp6DRecoveryCmdTyp : 	STRUCT 
		Recover : BOOL;
		Reset : BOOL;
	END_STRUCT;
	Acp6DRecoveryParTyp : 	STRUCT 
		AutoDrivePositions : ARRAY[0..MAX_SHUTTLE_COUNT_ARRAY]OF Acp6DAutoDrivePosTyp;
		Vel : REAL;
		Accel : REAL;
	END_STRUCT;
	Acp6DRecoveryStsTyp : 	STRUCT 
		Recovering : BOOL;
		ReadyToStartProc : BOOL;
		Done : BOOL;
		ShuttlesRecovered : BOOL;
		Error : BOOL;
	END_STRUCT;
	Acp6DAutoDrivePosTyp : 	STRUCT 
		ShIdx : USINT;
		GroupNum : USINT; (*Group ID used for recovery. Lower group, lower priority*)
		X : REAL;
		Y : REAL;
	END_STRUCT;
END_TYPE

(***********************Station Types*)

TYPE
	StationIfTyp : 	STRUCT 
		Cmd : StationIfCmdTyp; (*Commands to a station*)
		Par : {REDUND_UNREPLICABLE} StationIfParTyp; (*Parameters for the station's operation*)
		Cfg : StationIfCfgTyp; (*Configuration values for the station*)
		Sts : StationIfStsTyp; (*Status of the station*)
	END_STRUCT;
	StationIfCmdTyp : 	STRUCT 
		Enable : BOOL; (*Enables the process station*)
		Process : BOOL; (*Start a process for the station with the defined shuttle index*)
		Reset : BOOL; (*Resets the process from an any state*)
		LocalOverride : BOOL; (*Denotes that local settings can be overwritten from global*)
	END_STRUCT;
	StationIfCfgTyp : 	STRUCT 
		StationPos : StationPositionTyp; (*Station's center world position*)
	END_STRUCT;
	StationIfParTyp : 	STRUCT 
		ShuttleIdx : USINT; (*Index in the gShuttle array for the shuttle in question*)
		RepeatCount : USINT;
		RepeatForever : BOOL;
		StationType : FillStationEnum;
	END_STRUCT;
	StationIfStsTyp : 	STRUCT 
		Enabled : BOOL; (*Signal denoting the station is enabled and in an operational state*)
		Processing : BOOL; (*Signal denoting the station is currently operating on a shuttle*)
		Done : BOOL; (*Signal denoting the current operation has completed*)
		ReadyForNewShuttle : BOOL; (*Signal denoting the station is ready for a new shuttle*)
		Error : BOOL; (*Signal denoting the station has an error present*)
		RepeatCounter : USINT;
	END_STRUCT;
	StationPositionTyp : 	STRUCT 
		X : REAL; (*Station's Global X position*)
		Y : REAL; (*Station's Global Y position*)
	END_STRUCT;
	FillStationEnum : 
		(
		ST_UNDEF,
		ST1,
		ST2,
		ST3,
		ST4
		);
END_TYPE
