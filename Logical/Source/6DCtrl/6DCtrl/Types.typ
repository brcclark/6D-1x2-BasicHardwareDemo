
TYPE
	Acp6DStateEnum : 
		( (*6D Control States*)
		ACP6D_RESET, (*Reset the 6D controller state*)
		ACP6D_POWER_OFF, (*System Power Off state*)
		ACP6D_INACTIVE, (*System inactive state*)
		ACP6D_POWER_ON, (*Powering on the system state*)
		ACP6D_WAIT_ACTIVATION, (*waiting for activation (needed for autoID)*)
		ACP6D_INIT_MACRO, (*Waiting for the initalization of the macros to be done*)
		ACP6D_CFG_CYCLIC_CHANNEL, (*Configure the cyclic channel*)
		ACP6D_READY, (*System Ready for operation*)
		ACP6D_ERROR := 255 (*System in an error state*)
		);
	Sys6DCtrlFbTyp : 	STRUCT 
		AutoRefreshFB : MC_BR_AutoRefresh_Acp6D; (*FB that auto refreshes the 6D data*)
		PowerOnFb : MC_BR_SysPowerOn_Acp6D; (*FB to power on the 6D controller/system*)
		PowerOffFb : MC_BR_SysPowerOff_Acp6D; (*FB to power off the 6D controller/system*)
		SysReadStateFb : MC_BR_SysReadState_Acp6D; (*FB to read the state of the 6D controller*)
		ShReadPositionFb : ARRAY[0..MAX_SHUTTLE_COUNT_ARRAY]OF MC_BR_ShReadPosition_Acp6D; (*FB(s) to read the position of the shuttles*)
		ShReadForceFb : ARRAY[0..MAX_SHUTTLE_COUNT_ARRAY]OF MC_BR_ShReadForce_Acp6D; (*FB(s) to read the force acting on the shuttle*)
		ShReadState : ARRAY[0..MAX_SHUTTLE_COUNT_ARRAY]OF MC_BR_ShReadState_Acp6D; (*FB(s) to read the states of the shuttles*)
		GetErrorCodesFb : MC_BR_GetErrorCode_Acp6D; (*FB to read the error codes on the 6D controller*)
		CfgReadCyclicPos : MC_BR_ConfigReadCyclicCh_Acp6D; (*FB to configure the reading of the cyclic channels for the system*)
	END_STRUCT;
END_TYPE
