
TYPE
	McAcp6DControllerType : 	STRUCT  (*Tracks state of the entire PMC system*)
		H2P_START : UDINT; (* *) (* *) (*#OMIT*)
		P2H_START : UDINT; (* *) (* *) (*#OMIT*)
		ConfiguredFeedbackStreamAxis : USINT; (* *) (* *) (*#OMIT*)
		PMCDB : McAcp6DDBType; (* *) (* *) (*#OMIT*)
		TicketMgmt : McAcp6DTicketType; (* *) (* *) (*#OMIT*)
		PMC_Constants : McAcp6DConstantsType; (* *) (* *) (*#OMIT*)
		EventMgmt : McAcp6DEventType;
		Unit : McAcp6DUnitType := mcACP6D_UNIT_METER; (* *) (* *) (*#OMIT*)
		Logger : McAcp6DLoggerInfoType; (* *) (* *) (*#OMIT*)
	END_STRUCT;
	McAcp6DLoggerInfoType : 	STRUCT  (* *) (* *) (*#OMIT*)
		Ident : ArEventLogIdentType;
		Name : STRING[80] := '_$$acopos6d';
		Size : UDINT := 203000;
	END_STRUCT;
	McAcp6DEventType : 	STRUCT  (*Tracks event IDs and event codes*) (* *) (*#OMIT*)
		AvailableEventID : UINT;
		ExecutingEventID : ARRAY[0..5000]OF BOOL;
		EventCode : ARRAY[0..5000]OF USINT;
	END_STRUCT;
	McAcp6DDBType : 	STRUCT  (*Stores PMC state and positions of all the xbots*) (* *) (*#OMIT*)
		PMCState : USINT;
		PosX : ARRAY[0..254]OF REAL;
		PosY : ARRAY[0..254]OF REAL;
		PosZ : ARRAY[0..254]OF REAL;
		PosRx : ARRAY[0..254]OF REAL;
		PosRy : ARRAY[0..254]OF REAL;
		PosRz : ARRAY[0..254]OF REAL;
	END_STRUCT;
	McAcp6DFuncInfoType : 	STRUCT  (*Stores the status of a single function block instance*) (* *) (*#OMIT*)
		CmdSta : USINT;
		TicketNumber : USINT;
		EventID : UINT;
		SendToPMC : BOOL;
		ReadFromPMC : BOOL;
		MsgPartNStatus : DINT;
		Logger : McAcp6DEventLogType;
		MC_BR_CmdEventLog_Acp6D_0 : MC_BR_CmdEventLog_Acp6D;
	END_STRUCT;
	McAcp6DEventLogType : 	STRUCT  (* *) (* *) (*#OMIT*)
		BufferIn : ARRAY[0..199]OF UINT; (*Store the FBin strucuture when sent*)
		BufferOut : ARRAY[0..199]OF UINT; (*Store the FBout strucuture when receive*)
		LoggerName : STRING[80]; (*_$$acopos6d*)
		Acknowledge : BOOL;
		Done : BOOL;
		Error : BOOL;
		Aborted : BOOL;
		StatusID : DINT;
		ObjectID : STRING[36];
	END_STRUCT;
	McAcp6DTicketType : 	STRUCT  (*Used to determine which function block has access to the fieldbus*) (* *) (*#OMIT*)
		AvailableTicket : USINT;
		ExecutingTicket : USINT;
		TicketStatus : ARRAY[0..255]OF BOOL;
	END_STRUCT;
	McAcp6DZoneStatusType : 	STRUCT 
		ZoneState : USINT; (* 0: undefined, 1: defined, 2: unloading zone, 3: loading zone*)
		EntranceExitState : USINT; (* 0: busy, 1: ready*)
		NumberOfShuttles : USINT; (*Number of shuttles in the zone*)
		ShuttleID : USINT; (*Shuttle ID added to unloading zone or ready to fetch from loading zone *)
		ZoneX : REAL; (* X coordinate of entrance or exit (m)*)
		ZoneY : REAL; (* Y coordinate of entrance or exit (m) *)
	END_STRUCT;
	McAcp6DArcDirectionEnum : 
		(
		mcACP6D_ARC_CLOCKWISE := 0,
		mcACP6D_ARC_COUNTER_CLOCKWISE := 1
		);
	McAcp6DArcTypeEnum : 
		(
		mcACP6D_ARC_MINOR, (*Minor Arc (shortest arc path) to the target position*)
		mcACP6D_ARC_MAJOR (*Major Arc (longest arc path) to the target position*)
		);
	McAcp6DAxisIDEnum : 
		(
		mcACP6D_AXIS_ID_X := 0,
		mcACP6D_AXIS_ID_Y := 1,
		mcACP6D_AXIS_ID_Z := 2,
		mcACP6D_AXIS_ID_RX := 3,
		mcACP6D_AXIS_ID_RY := 4,
		mcACP6D_AXIS_ID_RZ := 5
		);
	McAcp6DBufferOptionEnum : 
		(
		mcACP6D_BUFFER_BLOCK := 0,
		mcACP6D_BUFFER_RELEASE := 1,
		mcACP6D_BUFFER_CLEAR := 2
		);
	McAcp6DCmdIDEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_CMDID_BUFFER_CTRL := 2837,
		mcACP6D_CMDID_CAM := 2834,
		mcACP6D_CMDID_CONFIG_DI := 2844,
		mcACP6D_CMDID_CONFIG_DO := 2843,
		mcACP6D_CMDID_CONFIG_CYCLIC_CH := 2828,
		mcACP6D_CMDID_FORCE_MODE_CTRL := 2833,
		mcACP6D_CMDID_GET_PAYLOAD := 2848,
		mcACP6D_CMDID_JOG := 2842,
		mcACP6D_CMDID_LEVITATION := 2829,
		mcACP6D_CMDID_MACRO_EDIT := 2839,
		mcACP6D_CMDID_MACRO_RUN := 2840,
		mcACP6D_CMDID_MOVE_6D := 2851,
		mcACP6D_CMDID_ARC := 2826,
		mcACP6D_CMDID_MOVE_INPLANE_SYNC := 2835,
		mcACP6D_CMDID_MOVE_INPLANE_ASYNC := 2836,
		mcACP6D_CMDID_MOVE_INPLANE := 2824,
		mcACP6D_CMDID_MOVE_SHORTAX := 2825,
		mcACP6D_CMDID_MOVE_TRAJECTORY := 2823,
		mcACP6D_CMDID_PAUSE_SH := 2849,
		mcACP6D_CMDID_PLANET_CTRL := 2847,
		mcACP6D_CMDID_REBOOT := 2562,
		mcACP6D_CMDID_RESUME_SH := 2849,
		mcACP6D_CMDID_SEG_GET_STATUS := 2582,
		mcACP6D_CMDID_SH_GET_PROPERTY := 2846,
		mcACP6D_CMDID_SH_GET_STATUS := 2831,
		mcACP6D_CMDID_SH_GROUP := 2838,
		mcACP6D_CMDID_SH_SET_PROPERTY := 2845,
		mcACP6D_CMDID_STOP := 2827,
		mcACP6D_CMDID_SYS_GET_STATUS := 2565,
		mcACP6D_CMDID_GET_ERROR_CODE := 2573,
		mcACP6D_CMDID_SYS_POWER_OFF := 2570,
		mcACP6D_CMDID_SYS_POWER_ON := 2568,
		mcACP6D_CMDID_WAIT := 2841,
		mcACP6D_CMDID_WRITE_CYCLIC_CH := 2830,
		mcACP6D_CMDID_ZONE_CTRL := 3078,
		mcACP6D_CMDID_ZONE_UNLOAD := 3079,
		mcACP6D_CMDID_ZONE_CLEAR := 3080,
		mcACP6D_CMDID_ZONE_GET_STATUS := 3081
		);
	McAcp6DConstantsType : 	STRUCT  (*Constants for the Acopos 6D system*) (* *) (*#OMIT*)
		H2P_FRMC_OFFSET : UINT := 4;
		H2P_CMDC_OFFSET : UINT := 5;
		H2P_CMDID_OFFSET : UINT := 6;
		H2P_CMDLB_OFFSET : UINT := 8;
		H2P_DATA_OFFSET : UINT := 10;
		H2P_EVENTID_OFFSET : UINT := 130;
		H2P_EVENTACK_OFFSET : UINT := 129;
		H2P_STM_OFFSET : UINT := 132;
		H2P_DO_OFFSET : UINT := 384;
		P2H_FRMC_OFFSET : UINT := 4;
		P2H_CMDC_OFFSET : UINT := 5;
		P2H_CMDID_OFFSET : UINT := 6;
		P2H_CMDLB_OFFSET : UINT := 8;
		P2H_RTN_OFFSET : UINT := 10;
		P2H_DATA_OFFSET : UINT := 12;
		P2H_PMC_STATE_OFFSET : UINT := 54;
		P2H_REGION_STATE_OFFSET : UINT := 55;
		P2H_EVENT_OFFSET : UINT := 83;
		P2H_XBOT_STATE_OFFSET : UINT := 89;
		P2H_MUX_OFFSET : UINT := 128;
		P2H_REAL_TIME_OFFSET : UINT := 188;
		P2H_DI_OFFSET : UINT := 384;
		P2H_PROTOCOL_OFFSET : UINT := 0;
		PMC_TIMEOUT : UINT := 7500;
	END_STRUCT;
	McAcp6DLogBufferTypeEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_LOGGER_CMD := 0,
		mcACP6D_LOGGER_READ := 1
		);
	McAcp6DLogBufferType : 	STRUCT  (* *) (* *) (*#OMIT*)
		EventID : ArEventLogIdentType;
		Type : USINT;
		Data : ARRAY[0..100]OF USINT;
	END_STRUCT;
	McAcp6DDOTypeEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_DO_RISING_EDGE,
		mcACP6D_DO_NEGATIVE_EDGE := 1,
		mcACP6D_DO_ACTIVE_HIGH := 2
		);
	McAcp6DDODisplacementModeEnum : 
		(
		mcACP6D_DISP_ONLY_X,
		mcACP6D_DISP_ONLY_Y,
		mcACP6D_DISP_XY_FACTOR
		);
	McAcp6DErrorEnum : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_ERR_OK := 0,
		mcACP6D_ERR_SYS_ERROR := 1,
		mcACP6D_ERR_WRONG_CTRL_STATE := 8192,
		mcACP6D_ERR_NO_MASTERSHIP := 8193,
		mcACP6D_ERR_MASTERSHIP_TIMEOUT := 8194,
		mcACP6D_ERR_WRONG_GROUP_STATE := 8195,
		mcACP6D_ERR_WRONG_MACRO_STATE := 8196,
		mcACP6D_ERR_WRONG_IO_STATE := 8197,
		mcACP6D_ERR_WRONG_SEGMENT_STATE := 8198,
		mcACP6D_ERR_NO_ROUTING_SOLUTION := 8200,
		mcACP6D_ERR_TIMEOUT := 8201,
		mcACP6D_ERR_NO_LICENSE := 8202,
		mcACP6D_ERR_STEREOTYPE_STATE := 8203,
		mcACP6D_ERR_WRONG_SH_STATE := 12288,
		mcACP6D_ERR_INVALID_PARAMETERS := 16384,
		mcACP6D_ERR_WRONG_QUEUE_STATE := 20480,
		mcACP6D_ERR_WRONG_ZONE_STATE := 20481,
		mcACP6D_ERR_ZONE_SH_ON_BOUNDARY := 20482,
		mcACP6D_ERR_CONTROLLER_REFERENCE := 999
		);
	McAcp6DForceModeLevelEnum : 
		(
		mcACP6D_FORCE_MODE_EXIT := 0,
		mcACP6D_FORCE_MODE_Z_AXIS := 1,
		mcACP6D_FORCE_MODE_X_AXIS := 2,
		mcACP6D_FORCE_MODE_Y_AXIS := 3,
		mcACP6D_FORCE_MODE_XY_AXES := 4
		);
	McAcp6DGetSegStatusInfoType : 	STRUCT 
		Power : REAL; (*Segment power consumption in watts*)
		CPUTemp : REAL; (*Segment CPU temperature in degrees Celsius. CPU temperature refers to the internal CPU inside the segment.*)
		AmplifierTemp : REAL; (*Segment amplifier temperature in degrees Celsius. Amplifier temperature is equivalent to temperature at the center of a segment.*)
		MotorTemp : REAL; (*Segment motor temperature in degrees Celsius. Motor temperature is equivalemt to the top middle surface temperature of a segment*)
	END_STRUCT;
	McAcp6DGetShStatusFeedbackEnum : 
		(
		mcACP6D_FEEDBACK_POSITION,
		mcACP6D_FEEDBACK_FORCE
		);
	McAcp6DGetShStatusForceModeEnum : 
		( (* 0: Not Force Mode;1: X force mode;2: Y force mode;4: Z force mode;3: XY force mode*)
		mcACP6D_SH_FORCE_MODE_OFF := 0,
		mcACP6D_SH_FORCE_MODE_X_AXIS := 1,
		mcACP6D_SH_FORCE_MODE_Y_AXIS := 2,
		mcACP6D_SH_FORCE_MODE_Z_AXIS := 3,
		mcACP6D_SH_FORCE_MODEXY_AXES := 4
		);
	McAcp6DGetShStatusInfoType : 	STRUCT 
		Position : McAcp6DShPositionInfoType; (*Shuttle positions in meters*)
		Force : McAcp6DShForceInfoType; (*Shuttle force in N/Nm*)
		State : McAcp6DShuttleStateEnum;
		CommandLabel : UINT;
		ForceModeState : McAcp6DGetShStatusForceModeEnum;
		StarShuttleID : USINT; (* 0: Not linked to any xbot; >0: start Xbot ID*)
		GroupID : USINT; (* 0: Not bond to any group; >0: group ID*)
		NumberOfCommands : UINT; (* Number of commands in motion buffer*)
		IsBlocked : BOOL; (* is the Shuttle buffer blocked*)
		IsPaused : BOOL; (* is the Shuttle motion paused*)
		StereotypeID : USINT; (*Shuttle stereotype ID*)
	END_STRUCT;
	McAcp6DGetSysStatusInfoType : 	STRUCT 
		State : McAcp6DSystemStateEnum; (*Current system state*)
		NumberOfShuttles : UINT; (*Number of shuttles recognized by the controller*)
		Power : REAL; (*Total power consumption. Sum of all segment power.*)
		MaxCPUTemp : REAL; (*Maximum CPU temperature of all segments. CPU temperature refers to the internal CPU inside the segment.*)
		MaxAmplifierTemp : REAL; (*Maximum Amplifier temperature of all segments. Amplifier temperature is equivalent to temperature at the center of a segment.*)
		MaxMotorTemp : REAL; (*Maximum Motor temperature of all segments. Motor temperature is equivalemt to the top middle surface temperature of a segment*)
	END_STRUCT;
	McAcp6DInPlaneMovePathEnum : 
		(
		mcACP6D_PATH_DIRECT := 0,
		mcACP6D_PATH_X_THEN_Y := 1,
		mcACP6D_PATH_Y_THEN_X := 2
		);
	McAcp6DJogAxisEnum : 
		(
		mcACP6D_JOG_X_AXIS,
		mcACP6D_JOG_Y_AXIS
		);
	McAcp6DLevitationLevelEnum : 
		(
		mcACP6D_LEVEL_LAND := 0,
		mcACP6D_LEVEL_LEVITATE := 1
		);
	McAcp6DMacroStatusEnum : 
		(
		mcACP6D_MACRO_STATUS_UNSAVED := 0,
		mcACP6D_MACRO_STATUS_RESERVED := 1,
		mcACP6D_MACRO_STATUS_SAVED := 2
		);
	McAcp6DMoveModeEnum : 
		(
		mcACP6D_MOVE_ABSOLUTE := 0,
		mcACP6D_MOVE_RELATIVE := 1
		);
	McAcp6DPlanetLevelEnum : 
		(
		mcACP6D_PLANET_DISCONNECT := 0,
		mcACP6D_PLANET_CONNECT := 1
		);
	McAcp6DReadCycPosEnum : 
		(
		mcACP6D_READ_CYCLIC_POSITION := 0,
		mcACP6D_READ_CYCLIC_FORCE := 1
		);
	McAcp6DSetPropertyEnum : 
		(
		mcACP6D_PROPERTY_SHUTTLE_TYPE := 0,
		mcACP6D_PROPERTY_PAYLOAD := 1,
		mcACP6D_PROPERTY_Z_CENTR_GRAVITY := 2,
		mcACP6D_PROPERTY_X_DIM := 3,
		mcACP6D_PROPERTY_Y_DIM := 5,
		mcACP6D_PROPERTY_ACC_LIMIT := 7
		);
	McAcp6DShForceInfoType : 	STRUCT 
		Fx : REAL; (*X force in [N]*)
		Fy : REAL; (*Y force in [N]*)
		Fz : REAL; (*Z force in [N]*)
		Tx : REAL; (*X torque in [Nm]*)
		Ty : REAL; (*Y torque in [Nm]*)
		Tz : REAL; (*Z torque in [Nm]*)
	END_STRUCT;
	McAcp6DShGroupBufferOptionEnum : 
		(
		mcACP6D_GROUP_BUFFER_BLOCK := 0,
		mcACP6D_GROUP_BUFFER_RELEASE := 1
		);
	McAcp6DShGroupCoupleModeEnum : 
		( (*Coupled axes option*)
		mcACP6D_GROUP_COUPLE_ONLY_XY := 0, (*Only XY position is coupled*)
		mcACP6D_GROUP_COUPLE_XY_RZ := 1 (*XY and RZ position is coupled*)
		);
	McAcp6DShGroupCoupleOptionEnum : 
		(
		mcACP6D_GROUP_DECOUPLE := 0, (*Decouple shuttles in group*)
		mcACP6D_GROUP_COUPLE := 1 (*Couple shuttles in group*)
		);
	McAcp6DShortAxisRotationEnum : 
		(
		mcACP6D_SHORT_AX_ROTATION_ONLY,
		mcACP6D_SHORT_AX_ROTATION_CENTER
		);
	McAcp6DShPositionInfoType : 	STRUCT 
		X : REAL; (*X position in [m]*)
		Y : REAL; (*Y position in [m]*)
		Z : REAL; (*Z position in [m]*)
		RX : REAL; (*RX rotational position in [rad]*)
		RY : REAL; (*RY rotational position in [rad]*)
		RZ : REAL; (*RZ rotational position in [rad]*)
	END_STRUCT;
	McAcp6DShuttleStateEnum : 
		( (*0: Undetected; 1: Discovering; 2: Landed; 3: Idling; 5: Motion; 6: Wait; 7: Stopping; 8: Obstacle; 9: Hold; 10: Stopped; 14: Error; 15: Uninstalled
*)
		mcACP6D_SH_STATE_UNDETECTED := 0, (*Shuttle is not detected by the System
*)
		mcACP6D_SH_STATE_DISCOVERING := 1, (*Shuttle iis in the process of being discovered by the System
*)
		mcACP6D_SH_STATE_LANDED := 2, (*Shuttle is landed and controlled by the System. 

*)
		mcACP6D_SH_STATE_IDLING := 3, (*Shuttle is levitating and not currently executing a motion command
*)
		mcACP6D_SH_STATE_DISABLED := 4, (*Shuttle is not controlled by the System
*)
		mcACP6D_SH_STATE_MOTION := 5, (*Shuttle is in motion
*)
		mcACP6D_SH_STATE_WAIT := 6, (*Shuttle is waiting for a trigger defined by the WaitUntil command
*)
		mcACP6D_SH_STATE_STOPPING := 7, (*Shuttle is performing an automatic quick stop due to obstacle detection
*)
		mcACP6D_SH_STATE_OBSTACLE := 8, (*Shuttle is waiting for an obstacle to clear before proceeding*)
		mcACP6D_SH_STATE_HOLD := 9, (*Shuttle is holding position due to positioning error
*)
		mcACP6D_SH_STATE_STOPPED := 10, (*Shuttle is stopped due to obstacle or boundary detection, it  cannot automatically resume its motion
*)
		mcACP6D_SH_STATE_ERROR := 14, (*Shuttle has detected an error
*)
		mcACP6D_SH_STATE_RESERVED := 15 (*Reserved State*)
		);
	McAcp6DSystemStateEnum : 
		( (* 0: booting; 1: inactive; 2: activating; 5: operation; 7: deactivating; 8: error handling; 9: error*)
		mcACP6D_STATE_BOOTING := 0,
		mcACP6D_STATE_INACTIVE := 1,
		mcACP6D_STATE_ACTIVATING := 2,
		mcACP6D_STATE_OPERATION := 5,
		mcACP6D_STATE_DEACTIVATING := 7,
		mcACP6D_STATE_ERROR_HANDLING := 8,
		mcACP6D_STATE_ERROR := 9
		);
	McAcp6DUnitType : 
		( (* *) (* *) (*#OMIT*)
		mcACP6D_UNIT_METER := 1,
		mcACP6D_UNIT_MM := 1000,
		mcACP6D_UNIT_UM := 1000000
		);
	McAcp6DWaitUntilCmdLblTrigEnum : 
		(
		mcACP6D_WAIT_CMDLBL_POS_EDGE := 0,
		mcACP6D_WAIT_CMDLBL_NEG_EDGE := 1,
		mcACP6D_WAIT_CMDLBL_ACTIVE_HIGH := 2
		);
	McAcp6DWaitUntilCmdLblTypeEnum : 
		(
		mcACP6D_WAIT_MOTION_LBL := 0,
		mcACP6D_WAIT_MACRO_LBL := 1
		);
	McAcp6DWaitUntilDispModeEnum : 
		(
		mcACP6D_DISP_MODE_ONLY_X := 0,
		mcACP6D_DISP_MODE_ONLY_Y := 1,
		mcACP6D_DISP_MODE_ONLY_XY := 2
		);
	McAcp6DWaitUntilDispTypeEnum : 
		(
		mcACP6D_DISP_TYPE_GT := 0,
		mcACP6D_DISP_TYPE_LT := 1,
		mcACP6D_DISP_TYPE_POS_CROSS := 2,
		mcACP6D_DISP_TYPE_NEG_CROSS := 3
		);
	McAcp6DWaitUntilDITrigEnum : 
		(
		mcACP6D_WAIT_DI_POS_EDGE := 0,
		mcACP6D_WAIT_DI_NEG_EDGE := 1,
		mcACP6D_WAIT_DI_ACTIVE_HIGH := 2,
		mcACP6D_WAIT_DI_ACTIVE_LOW := 3
		);
	McAcp6DWriteCyclicAxisType : 	STRUCT 
		X : BOOL;
		Y : BOOL;
		Z : BOOL;
		Rx : BOOL;
		Ry : BOOL;
		Rz : BOOL;
	END_STRUCT;
END_TYPE
