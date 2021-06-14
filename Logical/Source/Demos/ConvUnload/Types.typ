
TYPE
	ConvHandOffIfTyp : 	STRUCT 
		Cmd : ConvHandOffCmdTyp;
		Par : ConvHandOffParTyp;
		Sts : ConvHandOffStsTyp;
	END_STRUCT;
	ConvHandOffCmdTyp : 	STRUCT 
		SetupZone : BOOL;
		DeleteZone : BOOL;
		Offload : BOOL;
		Reset : BOOL;
	END_STRUCT;
	ConvHandOffParTyp : 	STRUCT 
		ShuttleID : USINT;
		ZonePars : ZoneParsTyp;
	END_STRUCT;
	ConvHandOffStsTyp : 	STRUCT 
		ZoneSts : McAcp6DZoneStatusType;
		Ready : BOOL;
	END_STRUCT;
	ConvHandOffStateEnum : 
		(
		HAND_IDLE,
		HAND_SETUP_ZONE,
		HAND_ACTIVATE_ZONE,
		HAND_GET_ZONE_STATUS,
		HAND_WAIT,
		HAND_MOVE_SHUTTLE_ENTRANCE,
		HAND_UNLOAD_SHUTTLE,
		HAND_DEACTIVATE_ZONE,
		HAND_DELETE_ZONE,
		HAND_ERROR
		);
	ZoneParsTyp : 	STRUCT 
		ZoneID : USINT;
		ZoneMode : USINT;
		UnloadingMode : USINT;
		ZoneCenterX : REAL;
		ZoneCenterY : REAL;
		ZoneLength : REAL;
		ZoneWidth : REAL;
		MaxShuttleX : REAL;
		MaxShuttleY : REAL;
		Velocity : REAL;
		Accel : REAL;
	END_STRUCT;
	HandOffFbsTyp : 	STRUCT 
		ZoneCreateFb : MC_BR_ZoneCreate_Acp6D;
		ZoneDeactivateFb : MC_BR_ZoneDeactivate_Acp6D;
		ZoneDeleteFb : MC_BR_ZoneDelete_Acp6D;
		ZoneActivateFb : MC_BR_ZoneActivate_Acp6D;
		ZoneGetStsFb : MC_BR_ZoneGetStatus_Acp6D;
		ZoneUnloadFb : MC_BR_ZoneUnload_Acp6D;
		MoveInPlane : MC_BR_MoveInPlane_Acp6D;
	END_STRUCT;
END_TYPE
