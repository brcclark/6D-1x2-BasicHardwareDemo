/* Automation Studio generated header file */
/* Do not edit ! */
/* McAcp6D 1.00.2 */

#ifndef _MCACP6D_
#define _MCACP6D_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _McAcp6D_VERSION
#define _McAcp6D_VERSION 1.00.2
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "FileIO.h"
		#include "asstring.h"
		#include "AsMath.h"
		#include "ArEventLog.h"
		#include "AsXml.h"
		#include "standard.h"
#endif
#ifdef _SG4
		#include "FileIO.h"
		#include "asstring.h"
		#include "AsMath.h"
		#include "ArEventLog.h"
		#include "AsXml.h"
		#include "standard.h"
#endif
#ifdef _SGC
		#include "FileIO.h"
		#include "asstring.h"
		#include "AsMath.h"
		#include "ArEventLog.h"
		#include "AsXml.h"
		#include "standard.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 _WEAK const unsigned char TEST[2] = {0U,0U};
 #define mcACP6D_MACRO_PARAM_ARR 36U
 #define mcACP6D_MACRO_CMD_NAME_ARR 20U
 #define mcACP6D_POSITION_COVERSION_MM 1000.0f
#else
 _GLOBAL_CONST unsigned char TEST[2];
 _GLOBAL_CONST unsigned char mcACP6D_MACRO_PARAM_ARR;
 _GLOBAL_CONST unsigned char mcACP6D_MACRO_CMD_NAME_ARR;
 _GLOBAL_CONST float mcACP6D_POSITION_COVERSION_MM;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum McAcp6DMacroCmdNameInternalEnum
{	mcACP6D_CMD_MACRO_CLEAR = 0,
	mcACP6D_CMD_MACRO_SAVE = 1,
	mcACP6D_CMD_MACRO_RUN = 2,
	mcACP6D_CMD_MOVE_IN_PLANE = 3,
	mcACP6D_CMD_MOVE_ARC_ANGLE = 4,
	mcACP6D_CMD_MOVE_ARC_RADIUS = 5,
	mcACP6D_CMD_MOVE_SHORT_AXIS = 6,
	mcACP6D_CMD_WAIT_CMD_LABEL = 7,
	mcACP6D_CMD_WAIT_DIGITAL_INPUT = 8,
	mcACP6D_CMD_WAIT_DISP_TRIGGER = 9,
	mcACP6D_CMD_WAIT_TIME = 10
} McAcp6DMacroCmdNameInternalEnum;

typedef enum McAcp6DMacroGetListInternalEnum
{	mcACP6D_DIR_WAIT = 0,
	mcACP6D_DIR_INFO = 1,
	mcACP6D_DIR_OPEN = 2,
	mcACP6D_DIR_CREATE = 3,
	mcACP6D_DIR_CLOSE = 4,
	mcACP6D_DIR_READ = 5,
	mcACP6D_DIR_DONE = 6,
	mcACP6D_DIR_ERROR = 99
} McAcp6DMacroGetListInternalEnum;

typedef enum McAcp6DMacroLoadInternalEnum
{	mcACP6D_XML_RESET,
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
	mcACP6D_XML_ERROR = 99
} McAcp6DMacroLoadInternalEnum;

typedef enum McAcp6DMacroParamInternalEnum
{	mcACP6D_PARAM_CMD_ID = 0,
	mcACP6D_PARAM_NAME = 1,
	mcACP6D_PARAM_MACRO_ID = 2,
	mcACP6D_PARAM_X_TARGET = 3,
	mcACP6D_PARAM_Y_TARGET = 4,
	mcACP6D_PARAM_Z_TARGET = 5,
	mcACP6D_PARAM_SHUTTLE_ID = 6,
	mcACP6D_PARAM_CMD_LABEL = 7,
	mcACP6D_PARAM_RX_TARGET = 8,
	mcACP6D_PARAM_RY_TARGET = 9,
	mcACP6D_PARAM_RZ_TARGET = 10,
	mcACP6D_PARAM_ACC = 11,
	mcACP6D_PARAM_VEL = 12,
	mcACP6D_PARAM_END_VEL = 13,
	mcACP6D_PARAM_POSITION_MODE = 14,
	mcACP6D_PARAM_PATH_TYPE = 15,
	mcACP6D_PARAM_RADIUS = 16,
	mcACP6D_PARAM_ARC_TYPE = 17,
	mcACP6D_PARAM_ANGLE = 18,
	mcACP6D_PARAM_DIRECTION = 19,
	mcACP6D_PARAM_ARC_MODE = 20,
	mcACP6D_PARAM_TIME_DELAY = 21,
	mcACP6D_PARAM_DISP_TRIGG = 22,
	mcACP6D_PARAM_DI_ID = 23,
	mcACP6D_PARAM_FACTOR_A = 24,
	mcACP6D_PARAM_FACTOR_B = 25,
	mcACP6D_PARAM_TRIGG_CMDLBL = 26,
	mcACP6D_PARAM_TRIGG_TYPE = 27,
	mcACP6D_PARAM_TRIGG_SH_ID = 28,
	mcACP6D_PARAM_ROT_CENTER_X = 29,
	mcACP6D_PARAM_ROT_CENTER_Y = 30,
	mcACP6D_PARAM_VEL_RX = 31,
	mcACP6D_PARAM_VEL_RY = 32,
	mcACP6D_PARAM_VEL_RZ = 33,
	mcACP6D_PARAM_VEL_Z = 34,
	mcACP6D_PARAM_LABEL_TYPE = 35,
	mcACP6D_PARAM_THRESHOLD = 36
} McAcp6DMacroParamInternalEnum;

typedef enum McAcp6DArcDirectionEnum
{	mcACP6D_ARC_CLOCKWISE = 0,
	mcACP6D_ARC_COUNTER_CLOCKWISE = 1
} McAcp6DArcDirectionEnum;

typedef enum McAcp6DArcTypeEnum
{	mcACP6D_ARC_MINOR,
	mcACP6D_ARC_MAJOR
} McAcp6DArcTypeEnum;

typedef enum McAcp6DAxisIDEnum
{	mcACP6D_AXIS_ID_X = 0,
	mcACP6D_AXIS_ID_Y = 1,
	mcACP6D_AXIS_ID_Z = 2,
	mcACP6D_AXIS_ID_RX = 3,
	mcACP6D_AXIS_ID_RY = 4,
	mcACP6D_AXIS_ID_RZ = 5
} McAcp6DAxisIDEnum;

typedef enum McAcp6DBufferOptionEnum
{	mcACP6D_BUFFER_BLOCK = 0,
	mcACP6D_BUFFER_RELEASE = 1,
	mcACP6D_BUFFER_CLEAR = 2
} McAcp6DBufferOptionEnum;

typedef enum McAcp6DCmdIDEnum
{	mcACP6D_CMDID_BUFFER_CTRL = 2837,
	mcACP6D_CMDID_CAM = 2834,
	mcACP6D_CMDID_CONFIG_DI = 2844,
	mcACP6D_CMDID_CONFIG_DO = 2843,
	mcACP6D_CMDID_CONFIG_CYCLIC_CH = 2828,
	mcACP6D_CMDID_FORCE_MODE_CTRL = 2833,
	mcACP6D_CMDID_GET_PAYLOAD = 2848,
	mcACP6D_CMDID_JOG = 2842,
	mcACP6D_CMDID_LEVITATION = 2829,
	mcACP6D_CMDID_MACRO_EDIT = 2839,
	mcACP6D_CMDID_MACRO_RUN = 2840,
	mcACP6D_CMDID_MOVE_6D = 2851,
	mcACP6D_CMDID_ARC = 2826,
	mcACP6D_CMDID_MOVE_INPLANE_SYNC = 2835,
	mcACP6D_CMDID_MOVE_INPLANE_ASYNC = 2836,
	mcACP6D_CMDID_MOVE_INPLANE = 2824,
	mcACP6D_CMDID_MOVE_SHORTAX = 2825,
	mcACP6D_CMDID_MOVE_TRAJECTORY = 2823,
	mcACP6D_CMDID_PAUSE_SH = 2849,
	mcACP6D_CMDID_PLANET_CTRL = 2847,
	mcACP6D_CMDID_REBOOT = 2562,
	mcACP6D_CMDID_RESUME_SH = 2849,
	mcACP6D_CMDID_SEG_GET_STATUS = 2582,
	mcACP6D_CMDID_SH_GET_PROPERTY = 2846,
	mcACP6D_CMDID_SH_GET_STATUS = 2831,
	mcACP6D_CMDID_SH_GROUP = 2838,
	mcACP6D_CMDID_SH_SET_PROPERTY = 2845,
	mcACP6D_CMDID_STOP = 2827,
	mcACP6D_CMDID_SYS_GET_STATUS = 2565,
	mcACP6D_CMDID_GET_ERROR_CODE = 2573,
	mcACP6D_CMDID_SYS_POWER_OFF = 2570,
	mcACP6D_CMDID_SYS_POWER_ON = 2568,
	mcACP6D_CMDID_WAIT = 2841,
	mcACP6D_CMDID_WRITE_CYCLIC_CH = 2830,
	mcACP6D_CMDID_ZONE_CTRL = 3078,
	mcACP6D_CMDID_ZONE_UNLOAD = 3079,
	mcACP6D_CMDID_ZONE_CLEAR = 3080,
	mcACP6D_CMDID_ZONE_GET_STATUS = 3081
} McAcp6DCmdIDEnum;

typedef enum McAcp6DLogBufferTypeEnum
{	mcACP6D_LOGGER_CMD = 0,
	mcACP6D_LOGGER_READ = 1
} McAcp6DLogBufferTypeEnum;

typedef enum McAcp6DDOTypeEnum
{	mcACP6D_DO_RISING_EDGE,
	mcACP6D_DO_NEGATIVE_EDGE = 1,
	mcACP6D_DO_ACTIVE_HIGH = 2
} McAcp6DDOTypeEnum;

typedef enum McAcp6DDODisplacementModeEnum
{	mcACP6D_DISP_ONLY_X,
	mcACP6D_DISP_ONLY_Y,
	mcACP6D_DISP_XY_FACTOR
} McAcp6DDODisplacementModeEnum;

typedef enum McAcp6DErrorEnum
{	mcACP6D_ERR_OK = 0,
	mcACP6D_ERR_SYS_ERROR = 1,
	mcACP6D_ERR_WRONG_CTRL_STATE = 8192,
	mcACP6D_ERR_NO_MASTERSHIP = 8193,
	mcACP6D_ERR_MASTERSHIP_TIMEOUT = 8194,
	mcACP6D_ERR_WRONG_GROUP_STATE = 8195,
	mcACP6D_ERR_WRONG_MACRO_STATE = 8196,
	mcACP6D_ERR_WRONG_IO_STATE = 8197,
	mcACP6D_ERR_WRONG_SEGMENT_STATE = 8198,
	mcACP6D_ERR_NO_ROUTING_SOLUTION = 8200,
	mcACP6D_ERR_TIMEOUT = 8201,
	mcACP6D_ERR_NO_LICENSE = 8202,
	mcACP6D_ERR_STEREOTYPE_STATE = 8203,
	mcACP6D_ERR_WRONG_SH_STATE = 12288,
	mcACP6D_ERR_INVALID_PARAMETERS = 16384,
	mcACP6D_ERR_WRONG_QUEUE_STATE = 20480,
	mcACP6D_ERR_WRONG_ZONE_STATE = 20481,
	mcACP6D_ERR_ZONE_SH_ON_BOUNDARY = 20482,
	mcACP6D_ERR_CONTROLLER_REFERENCE = 999
} McAcp6DErrorEnum;

typedef enum McAcp6DForceModeLevelEnum
{	mcACP6D_FORCE_MODE_EXIT = 0,
	mcACP6D_FORCE_MODE_Z_AXIS = 1,
	mcACP6D_FORCE_MODE_X_AXIS = 2,
	mcACP6D_FORCE_MODE_Y_AXIS = 3,
	mcACP6D_FORCE_MODE_XY_AXES = 4
} McAcp6DForceModeLevelEnum;

typedef enum McAcp6DGetShStatusFeedbackEnum
{	mcACP6D_FEEDBACK_POSITION,
	mcACP6D_FEEDBACK_FORCE
} McAcp6DGetShStatusFeedbackEnum;

typedef enum McAcp6DGetShStatusForceModeEnum
{	mcACP6D_SH_FORCE_MODE_OFF = 0,
	mcACP6D_SH_FORCE_MODE_X_AXIS = 1,
	mcACP6D_SH_FORCE_MODE_Y_AXIS = 2,
	mcACP6D_SH_FORCE_MODE_Z_AXIS = 3,
	mcACP6D_SH_FORCE_MODEXY_AXES = 4
} McAcp6DGetShStatusForceModeEnum;

typedef enum McAcp6DInPlaneMovePathEnum
{	mcACP6D_PATH_DIRECT = 0,
	mcACP6D_PATH_X_THEN_Y = 1,
	mcACP6D_PATH_Y_THEN_X = 2
} McAcp6DInPlaneMovePathEnum;

typedef enum McAcp6DJogAxisEnum
{	mcACP6D_JOG_X_AXIS,
	mcACP6D_JOG_Y_AXIS
} McAcp6DJogAxisEnum;

typedef enum McAcp6DLevitationLevelEnum
{	mcACP6D_LEVEL_LAND = 0,
	mcACP6D_LEVEL_LEVITATE = 1
} McAcp6DLevitationLevelEnum;

typedef enum McAcp6DMacroStatusEnum
{	mcACP6D_MACRO_STATUS_UNSAVED = 0,
	mcACP6D_MACRO_STATUS_RESERVED = 1,
	mcACP6D_MACRO_STATUS_SAVED = 2
} McAcp6DMacroStatusEnum;

typedef enum McAcp6DMoveModeEnum
{	mcACP6D_MOVE_ABSOLUTE = 0,
	mcACP6D_MOVE_RELATIVE = 1
} McAcp6DMoveModeEnum;

typedef enum McAcp6DPlanetLevelEnum
{	mcACP6D_PLANET_DISCONNECT = 0,
	mcACP6D_PLANET_CONNECT = 1
} McAcp6DPlanetLevelEnum;

typedef enum McAcp6DReadCycPosEnum
{	mcACP6D_READ_CYCLIC_POSITION = 0,
	mcACP6D_READ_CYCLIC_FORCE = 1
} McAcp6DReadCycPosEnum;

typedef enum McAcp6DSetPropertyEnum
{	mcACP6D_PROPERTY_SHUTTLE_TYPE = 0,
	mcACP6D_PROPERTY_PAYLOAD = 1,
	mcACP6D_PROPERTY_Z_CENTR_GRAVITY = 2,
	mcACP6D_PROPERTY_X_DIM = 3,
	mcACP6D_PROPERTY_Y_DIM = 5,
	mcACP6D_PROPERTY_ACC_LIMIT = 7
} McAcp6DSetPropertyEnum;

typedef enum McAcp6DShGroupBufferOptionEnum
{	mcACP6D_GROUP_BUFFER_BLOCK = 0,
	mcACP6D_GROUP_BUFFER_RELEASE = 1
} McAcp6DShGroupBufferOptionEnum;

typedef enum McAcp6DShGroupCoupleModeEnum
{	mcACP6D_GROUP_COUPLE_ONLY_XY = 0,
	mcACP6D_GROUP_COUPLE_XY_RZ = 1
} McAcp6DShGroupCoupleModeEnum;

typedef enum McAcp6DShGroupCoupleOptionEnum
{	mcACP6D_GROUP_DECOUPLE = 0,
	mcACP6D_GROUP_COUPLE = 1
} McAcp6DShGroupCoupleOptionEnum;

typedef enum McAcp6DShortAxisRotationEnum
{	mcACP6D_SHORT_AX_ROTATION_ONLY,
	mcACP6D_SHORT_AX_ROTATION_CENTER
} McAcp6DShortAxisRotationEnum;

typedef enum McAcp6DShuttleStateEnum
{	mcACP6D_SH_STATE_UNDETECTED = 0,
	mcACP6D_SH_STATE_DISCOVERING = 1,
	mcACP6D_SH_STATE_LANDED = 2,
	mcACP6D_SH_STATE_IDLING = 3,
	mcACP6D_SH_STATE_DISABLED = 4,
	mcACP6D_SH_STATE_MOTION = 5,
	mcACP6D_SH_STATE_WAIT = 6,
	mcACP6D_SH_STATE_STOPPING = 7,
	mcACP6D_SH_STATE_OBSTACLE = 8,
	mcACP6D_SH_STATE_HOLD = 9,
	mcACP6D_SH_STATE_STOPPED = 10,
	mcACP6D_SH_STATE_ERROR = 14,
	mcACP6D_SH_STATE_RESERVED = 15
} McAcp6DShuttleStateEnum;

typedef enum McAcp6DSystemStateEnum
{	mcACP6D_STATE_BOOTING = 0,
	mcACP6D_STATE_INACTIVE = 1,
	mcACP6D_STATE_ACTIVATING = 2,
	mcACP6D_STATE_OPERATION = 5,
	mcACP6D_STATE_DEACTIVATING = 7,
	mcACP6D_STATE_ERROR_HANDLING = 8,
	mcACP6D_STATE_ERROR = 9
} McAcp6DSystemStateEnum;

typedef enum McAcp6DUnitType
{	mcACP6D_UNIT_METER = 1,
	mcACP6D_UNIT_MM = 1000,
	mcACP6D_UNIT_UM = 1000000
} McAcp6DUnitType;

typedef enum McAcp6DWaitUntilCmdLblTrigEnum
{	mcACP6D_WAIT_CMDLBL_POS_EDGE = 0,
	mcACP6D_WAIT_CMDLBL_NEG_EDGE = 1,
	mcACP6D_WAIT_CMDLBL_ACTIVE_HIGH = 2
} McAcp6DWaitUntilCmdLblTrigEnum;

typedef enum McAcp6DWaitUntilCmdLblTypeEnum
{	mcACP6D_WAIT_MOTION_LBL = 0,
	mcACP6D_WAIT_MACRO_LBL = 1
} McAcp6DWaitUntilCmdLblTypeEnum;

typedef enum McAcp6DWaitUntilDispModeEnum
{	mcACP6D_DISP_MODE_ONLY_X = 0,
	mcACP6D_DISP_MODE_ONLY_Y = 1,
	mcACP6D_DISP_MODE_ONLY_XY = 2
} McAcp6DWaitUntilDispModeEnum;

typedef enum McAcp6DWaitUntilDispTypeEnum
{	mcACP6D_DISP_TYPE_GT = 0,
	mcACP6D_DISP_TYPE_LT = 1,
	mcACP6D_DISP_TYPE_POS_CROSS = 2,
	mcACP6D_DISP_TYPE_NEG_CROSS = 3
} McAcp6DWaitUntilDispTypeEnum;

typedef enum McAcp6DWaitUntilDITrigEnum
{	mcACP6D_WAIT_DI_POS_EDGE = 0,
	mcACP6D_WAIT_DI_NEG_EDGE = 1,
	mcACP6D_WAIT_DI_ACTIVE_HIGH = 2,
	mcACP6D_WAIT_DI_ACTIVE_LOW = 3
} McAcp6DWaitUntilDITrigEnum;

typedef struct McAcp6DEventLogType
{	unsigned short BufferIn[200];
	unsigned short BufferOut[200];
	plcstring LoggerName[81];
	plcbit Acknowledge;
	plcbit Done;
	plcbit Error;
	plcbit Aborted;
	signed long StatusID;
	plcstring ObjectID[37];
} McAcp6DEventLogType;

typedef struct McAcp6DDBType
{	unsigned char PMCState;
	float PosX[255];
	float PosY[255];
	float PosZ[255];
	float PosRx[255];
	float PosRy[255];
	float PosRz[255];
} McAcp6DDBType;

typedef struct McAcp6DTicketType
{	unsigned char AvailableTicket;
	unsigned char ExecutingTicket;
	plcbit TicketStatus[256];
} McAcp6DTicketType;

typedef struct McAcp6DConstantsType
{	unsigned short H2P_FRMC_OFFSET;
	unsigned short H2P_CMDC_OFFSET;
	unsigned short H2P_CMDID_OFFSET;
	unsigned short H2P_CMDLB_OFFSET;
	unsigned short H2P_DATA_OFFSET;
	unsigned short H2P_EVENTID_OFFSET;
	unsigned short H2P_EVENTACK_OFFSET;
	unsigned short H2P_STM_OFFSET;
	unsigned short H2P_DO_OFFSET;
	unsigned short P2H_FRMC_OFFSET;
	unsigned short P2H_CMDC_OFFSET;
	unsigned short P2H_CMDID_OFFSET;
	unsigned short P2H_CMDLB_OFFSET;
	unsigned short P2H_RTN_OFFSET;
	unsigned short P2H_DATA_OFFSET;
	unsigned short P2H_PMC_STATE_OFFSET;
	unsigned short P2H_REGION_STATE_OFFSET;
	unsigned short P2H_EVENT_OFFSET;
	unsigned short P2H_XBOT_STATE_OFFSET;
	unsigned short P2H_MUX_OFFSET;
	unsigned short P2H_REAL_TIME_OFFSET;
	unsigned short P2H_DI_OFFSET;
	unsigned short P2H_PROTOCOL_OFFSET;
	unsigned short PMC_TIMEOUT;
} McAcp6DConstantsType;

typedef struct McAcp6DEventType
{	unsigned short AvailableEventID;
	plcbit ExecutingEventID[5001];
	unsigned char EventCode[5001];
} McAcp6DEventType;

typedef struct McAcp6DLoggerInfoType
{	ArEventLogIdentType Ident;
	plcstring Name[81];
	unsigned long Size;
} McAcp6DLoggerInfoType;

typedef struct McAcp6DControllerType
{	unsigned long H2P_START;
	unsigned long P2H_START;
	unsigned char ConfiguredFeedbackStreamAxis;
	struct McAcp6DDBType PMCDB;
	struct McAcp6DTicketType TicketMgmt;
	struct McAcp6DConstantsType PMC_Constants;
	struct McAcp6DEventType EventMgmt;
	enum McAcp6DUnitType Unit;
	struct McAcp6DLoggerInfoType Logger;
} McAcp6DControllerType;

typedef struct McAcp6DCmdEventLogInternalType
{	struct ArEventLogGetIdent ArEventLogGetIdent_0;
	struct ArEventLogCreate ArEventLogCreate_0;
	struct ArEventLogWrite ArEventLogWrite_0;
	unsigned short cmdID;
	signed long EventID;
	unsigned char Severity;
	signed long WriteState;
	unsigned char CreateState;
	unsigned short Facility;
	unsigned short ErrorCode;
	plcstring Message[301];
	plcstring HelpStr[81];
	unsigned char Buffer[1000];
	plcbit Status;
	unsigned short ErrorType;
	unsigned long State;
	unsigned long ShuttleID;
	unsigned long SegmentID;
	unsigned long Axis;
	unsigned long DetailedCode;
	unsigned char CurrError;
	unsigned char NumOfErrors;
	signed long GetErrorCode;
} McAcp6DCmdEventLogInternalType;

typedef struct MC_BR_CmdEventLog_Acp6D
{
	/* VAR_INPUT (analog) */
	signed long ErrorID;
	struct McAcp6DControllerType* Controller;
	struct McAcp6DFuncInfoType* FuncInfo;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct McAcp6DCmdEventLogInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Aborted;
	plcbit Acknowledge;
	plcbit CommandDone;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_CmdEventLog_Acp6D_typ;

typedef struct McAcp6DFuncInfoType
{	unsigned char CmdSta;
	unsigned char TicketNumber;
	unsigned short EventID;
	plcbit SendToPMC;
	plcbit ReadFromPMC;
	signed long MsgPartNStatus;
	struct McAcp6DEventLogType Logger;
	struct MC_BR_CmdEventLog_Acp6D MC_BR_CmdEventLog_Acp6D_0;
} McAcp6DFuncInfoType;

typedef struct McAcp6D6DMoveInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
} McAcp6D6DMoveInternalType;

typedef struct McAcp6DActivateShInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
} McAcp6DActivateShInternalType;

typedef struct McAcp6DArcMotionInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	unsigned char aDef;
	unsigned char Mode;
	unsigned char Direction;
	unsigned char Arc;
} McAcp6DArcMotionInternalType;

typedef struct McAcp6DAutoRefreshInternalType
{	unsigned char FrmCount;
	unsigned long RegVal;
	unsigned long curXID;
	unsigned short EventID1;
	unsigned short EventID2;
	unsigned short PrevEventID1;
	unsigned short PrevEventID2;
	signed char PrevEventCode1;
	signed char PrevEventCode2;
	signed char EventAck;
} McAcp6DAutoRefreshInternalType;

typedef struct McAcp6DCamInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char axisNum;
	signed char xIndex;
	unsigned short cmdID;
	unsigned char maxNAxis;
	plcbit DummyDone;
} McAcp6DCamInternalType;

typedef struct McAcp6DLogBufferType
{	ArEventLogIdentType EventID;
	unsigned char Type;
	unsigned char Data[101];
} McAcp6DLogBufferType;

typedef struct McAcp6DCmdLogAddBufInternalType
{	unsigned short CmdID;
	struct McAcp6DLogBufferType LogBuffer;
	unsigned char Severity;
	unsigned short Facility;
	unsigned short ErrorCode;
	plcbit Status;
} McAcp6DCmdLogAddBufInternalType;

typedef struct McAcp6DCmdProcesserInternalType
{	plcbit TicketCompleted;
	unsigned char CmdCounterFromPMC;
	unsigned char CmdCounterToPMC;
	unsigned short CmdID;
	unsigned short CmdIDRtn;
	unsigned char nextTicketIndex;
	signed short tempCounter;
	plcbit EventIDFound;
	unsigned short loopcounter;
} McAcp6DCmdProcesserInternalType;

typedef struct McAcp6DConfigDIInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char diNum;
	signed char xIndex;
	unsigned short cmdID;
	signed char maxNDi;
	plcbit DummyDone;
	unsigned char Type_;
} McAcp6DConfigDIInternalType;

typedef struct McAcp6DConfigDOInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char doNum;
	signed char xIndex;
	unsigned char eventID;
	unsigned short cmdID;
	signed char maxNDo;
	unsigned char Type[5];
	unsigned char Mode[5];
	unsigned char AxisID[5];
	plcbit DummyDone;
} McAcp6DConfigDOInternalType;

typedef struct McAcp6DConfigStreamInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	unsigned char stmNum;
	unsigned char Index;
	signed char maxNStm;
	unsigned char FeedbackMode[8];
	plcbit DummyDone;
} McAcp6DConfigStreamInternalType;

typedef struct McAcp6DCreateGroupInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char xbotNum;
	signed char xIndex;
	unsigned short cmdID;
	signed char maxNXbot;
	unsigned char Level;
	plcbit DummyDone;
} McAcp6DCreateGroupInternalType;

typedef struct McAcp6DDeactivateShInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
} McAcp6DDeactivateShInternalType;

typedef struct McAcp6DSysGetConfigInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed long totalByteNum;
	signed long numFrames;
	signed short cmdHB;
	signed long xIndex;
	signed long beginning_index;
	signed char numBytesToRead;
	plcbit DummyDone;
	unsigned short cmdID;
	signed char maxNBytePerFrame;
} McAcp6DSysGetConfigInternalType;

typedef struct McAcp6DForceModeInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Mode;
	plcbit DummyDone;
} McAcp6DForceModeInternalType;

typedef struct McAcp6DGetBufStatusInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Level;
	plcbit DummyDone;
} McAcp6DGetBufStatusInternalType;

typedef struct McAcp6DGetErrorCodeInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	signed short errIndex;
	plcbit DummyDone;
	signed char maxErrors;
} McAcp6DGetErrorCodeInternalType;

typedef struct McAcp6DGetGrpStatusInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char xbotNum;
	signed char xIndex;
	unsigned short cmdID;
	signed char maxNXbot;
	unsigned char Level;
	unsigned char State;
	plcbit DummyDone;
} McAcp6DGetGrpStatusInternalType;

typedef struct McAcp6DGetPayloadInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	plcdword nTemp;
	unsigned short cmdID;
	plcbit DummyDone;
} McAcp6DGetPayloadInternalType;

typedef struct McAcp6DGetSegStatusInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	plcbit DummyDone;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	unsigned char intTemp;
} McAcp6DGetSegStatusInternalType;

typedef struct McAcp6DGetShPropertyInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	plcdword nTemp;
	unsigned short cmdID;
	plcbit DummyDone;
} McAcp6DGetShPropertyInternalType;

typedef struct McAcp6DGetShStatusInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char State;
	unsigned short timeout;
	signed short cmdHB;
	plcdword nTemp;
	plcbyte bTemp;
	unsigned short cmdID;
	unsigned char FeedbackType;
	float PosTemp;
	plcbit DummyDone;
} McAcp6DGetShStatusInternalType;

typedef struct McAcp6DGetSysStatusInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char State;
	unsigned short timeout;
	signed short cmdHB;
	plcdword nTemp;
	plcbyte mTemp;
	unsigned short cmdID;
	plcbit DummyDone;
} McAcp6DGetSysStatusInternalType;

typedef struct McAcp6DGroupInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Level;
	unsigned char Mode;
	plcbit DummyDone;
} McAcp6DGroupInternalType;

typedef struct McAcp6DInPlaneMoveInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	unsigned char nTemp;
	unsigned char Mode;
	unsigned char Path;
	float PosTemp;
} McAcp6DInPlaneMoveInternalType;

typedef struct McAcp6DJogVelInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcbit DummyDone;
} McAcp6DJogVelInternalType;

typedef struct McAcp6DLevCtrlInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Level;
} McAcp6DLevCtrlInternalType;

typedef struct McAcp6DMacroErrorInternalType
{	signed long ErrorID;
	plcbit Error;
} McAcp6DMacroErrorInternalType;

typedef struct McAcp6DMacroErrInfoInternalType
{	unsigned short CommandID;
	plcstring Parameter[81];
	struct McAcp6DMacroErrorInternalType FileIO;
	struct McAcp6DMacroErrorInternalType Syntax;
	struct McAcp6DMacroErrorInternalType Command;
	struct McAcp6DMacroErrorInternalType Xml;
} McAcp6DMacroErrInfoInternalType;

typedef struct McAcp6DMacroInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Level;
	unsigned char State;
	plcbit DummyDone;
} McAcp6DMacroInternalType;

typedef struct MC_BR_MacroClear_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char MacroID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMacroInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MacroClear_Acp6D_typ;

typedef struct MC_BR_MacroSave_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char MacroID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMacroInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MacroSave_Acp6D_typ;

typedef struct MC_BR_MacroRun_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char MacroID;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMacroInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MacroRun_Acp6D_typ;

typedef struct MC_BR_MoveInPlane_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	enum McAcp6DMoveModeEnum Mode;
	enum McAcp6DInPlaneMovePathEnum Path;
	float PositionX;
	float PositionY;
	float Velocity;
	float EndVelocity;
	float Acceleration;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6DInPlaneMoveInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveInPlane_Acp6D_typ;

typedef struct MC_BR_MoveArcAngle_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	enum McAcp6DMoveModeEnum Mode;
	enum McAcp6DArcDirectionEnum Direction;
	float EndVelocity;
	float Velocity;
	float Acceleration;
	float CenterX;
	float CenterY;
	float Angle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6DArcMotionInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveArcAngle_Acp6D_typ;

typedef struct MC_BR_MoveArcRadius_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	enum McAcp6DMoveModeEnum Mode;
	enum McAcp6DArcTypeEnum Arc;
	enum McAcp6DArcDirectionEnum Direction;
	float EndVelocity;
	float Velocity;
	float Acceleration;
	float PositionX;
	float PositionY;
	float Radius;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6DArcMotionInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveArcRadius_Acp6D_typ;

typedef struct McAcp6DShortAxMotionInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char nTemp;
	unsigned short cmdID;
	unsigned char Mode;
	unsigned char RotationType;
} McAcp6DShortAxMotionInternalType;

typedef struct MC_BR_MoveShortAxis_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	enum McAcp6DMoveModeEnum Mode;
	enum McAcp6DShortAxisRotationEnum RotationType;
	float PositionZ;
	float PositionRx;
	float PositionRy;
	float PositionRz;
	float VelocityZ;
	float VelocityRx;
	float VelocityRy;
	float VelocityRz;
	float RotationCenterX;
	float RotationCenterY;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6DShortAxMotionInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveShortAxis_Acp6D_typ;

typedef struct McAcp6DWaitUntilInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	unsigned char type_;
	unsigned char count;
	unsigned char option;
	unsigned char TriggerType;
	unsigned char LabelType;
	unsigned char Mode;
	unsigned char Type;
} McAcp6DWaitUntilInternalType;

typedef struct MC_BR_WaitUntilCmdLabel_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	unsigned char TriggerShuttleID;
	enum McAcp6DWaitUntilCmdLblTrigEnum TriggerType;
	unsigned short TriggerCmdLabel;
	enum McAcp6DWaitUntilCmdLblTypeEnum LabelType;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DWaitUntilInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_WaitUntilCmdLabel_Acp6D_typ;

typedef struct MC_BR_WaitUntilDI_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	unsigned char TriggerDigitalInputID;
	enum McAcp6DWaitUntilDITrigEnum TriggerType;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DWaitUntilInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_WaitUntilDI_Acp6D_typ;

typedef struct MC_BR_WaitUntilDisp_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	unsigned char TriggerShuttleID;
	enum McAcp6DWaitUntilDispModeEnum Mode;
	enum McAcp6DWaitUntilDispTypeEnum TriggerType;
	float Threshold;
	float XFactor;
	float YFactor;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DWaitUntilInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_WaitUntilDisp_Acp6D_typ;

typedef struct MC_BR_WaitUntilTime_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	float Time;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DWaitUntilInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_WaitUntilTime_Acp6D_typ;

typedef struct McAcp6DMacroFubInternalType
{	struct MC_BR_MacroClear_Acp6D MC_BR_MacroClear_Acp6D_0;
	struct MC_BR_MacroSave_Acp6D MC_BR_MacroSave_Acp6D_0;
	struct MC_BR_MacroRun_Acp6D MC_BR_MacroRun_Acp6D_0;
	struct MC_BR_MoveInPlane_Acp6D MC_BR_MoveInPlane_Acp6D_0;
	struct MC_BR_MoveArcAngle_Acp6D MC_BR_MoveArcAngle_Acp6D_0;
	struct MC_BR_MoveArcRadius_Acp6D MC_BR_MoveArcRadius_Acp6D_0;
	struct MC_BR_MoveShortAxis_Acp6D MC_BR_MoveShortAxis_Acp6D_0;
	struct MC_BR_WaitUntilCmdLabel_Acp6D MC_BR_WaitUntilCmdLabel_Acp6D_0;
	struct MC_BR_WaitUntilDI_Acp6D MC_BR_WaitUntilDI_Acp6D_0;
	struct MC_BR_WaitUntilDisp_Acp6D MC_BR_WaitUntilDisp_Acp6D_0;
	struct MC_BR_WaitUntilTime_Acp6D MC_BR_WaitUntilTime_Acp6D_0;
	struct FileOpen FileOpen_0;
	struct FileRead FileRead_0;
	struct xmlCreateMemoryReader xmlCreateMemoryReader_0;
	struct xmlReadNextNode xmlReadNextNode_0;
	struct xmlReadAttributeNr xmlReadAttributeNr_0;
	struct xmlCloseMemoryReader xmlCloseMemoryReader_0;
	struct FileClose FileClose_0;
} McAcp6DMacroFubInternalType;

typedef struct McAcp6DMacroGetListInternalType
{	enum McAcp6DMacroGetListInternalEnum ReadDirState;
	struct DirInfo DirInfo_0;
	unsigned short DirStatus;
	unsigned long DirNum;
	signed short FileCount;
	struct DirCreate DirCreate_0;
	struct DirRead DirRead_0;
	struct fiDIR_READ_DATA ReadData;
	unsigned char i;
	unsigned char NUM_MACRO_FILES;
	plcstring FileName[261];
	unsigned long NumOfFiles;
} McAcp6DMacroGetListInternalType;

typedef struct McAcp6DMacroLoadInternalType
{	struct McAcp6DMacroFubInternalType FuB;
	enum McAcp6DMacroLoadInternalEnum XmlState;
	signed short ErrorState;
	unsigned long FileIdent;
	unsigned char XmlData[10025];
	unsigned long XmlIdent;
	plcstring ElementName[81];
	plcstring ElementValue[81];
	unsigned char AttrIndex;
	plcstring AttributeName[81];
	plcstring AttributeValue[81];
	unsigned char ErrorCount;
	unsigned short ReadMacroStatus;
	plcbit IsClosed;
	float ParameterList[37];
	plcstring ParameterStrList[37][81];
	plcstring CmdNameList[21][81];
	struct McAcp6DMacroErrInfoInternalType ErrorInfo;
	signed short i;
	signed short k;
	enum McAcp6DMacroCmdNameInternalEnum CmdState;
} McAcp6DMacroLoadInternalType;

typedef struct McAcp6DMotionBufInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Level;
	plcbit DummyDone;
} McAcp6DMotionBufInternalType;

typedef struct McAcp6DMultShInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed long numFrames;
	signed short cmdHB;
	signed char xIndex;
	signed char totalXbotNum;
	signed char beginning_index;
	signed char numXbotsToSend;
	plcbit requestEventID;
	unsigned short cmdID;
	signed char maxNXbot;
	signed char maxNXbotPerFrame;
} McAcp6DMultShInternalType;

typedef struct McAcp6DPauseShInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	unsigned char Level;
} McAcp6DPauseShInternalType;

typedef struct McAcp6DPlanetMotionInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char xbotNum;
	signed char xIndex;
	unsigned short cmdID;
	signed char maxNXbot;
	unsigned char Level;
	plcbit DummyDone;
} McAcp6DPlanetMotionInternalType;

typedef struct McAcp6DReadDigSignalInternalType
{	signed long ByteOffset;
	signed long BitOffset;
	unsigned char RegVal;
} McAcp6DReadDigSignalInternalType;

typedef struct McAcp6DReadShInfoInternalType
{	unsigned long RegVal;
	unsigned char curXID;
	unsigned char maxID;
} McAcp6DReadShInfoInternalType;

typedef struct McAcp6DReadShStateInternalType
{	unsigned char ByteOffset;
	unsigned char BitOffset;
	unsigned char uTemp;
	unsigned char MaxXbots;
	unsigned char State;
} McAcp6DReadShStateInternalType;

typedef struct McAcp6DReadStreamInternalType
{	unsigned char AxisCount;
	unsigned short ByteOffset;
	unsigned char tempFBAxis;
	signed char index;
	unsigned char CurrentAxisOffset;
	plcdword RegVal;
} McAcp6DReadStreamInternalType;

typedef struct McAcp6DRebootInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
} McAcp6DRebootInternalType;

typedef struct McAcp6DSendDigSignalInternalType
{	signed long ByteOffset;
	signed long BitOffset;
	unsigned char step1;
	unsigned char step2;
	unsigned char step3;
	unsigned char RegVal;
} McAcp6DSendDigSignalInternalType;

typedef struct McAcp6DSetShPropertyInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char xbotNum;
	signed char xIndex;
	unsigned short cmdID;
	signed char maxNXbots;
	unsigned char Property[14];
	plcbit DummyDone;
} McAcp6DSetShPropertyInternalType;

typedef struct McAcp6DStopShInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
} McAcp6DStopShInternalType;

typedef struct McAcp6DStreamModeInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char xbotNum;
	signed char xIndex;
	unsigned short cmdID;
	signed char maxNXbot;
	unsigned char AxisID[8];
	plcbit DummyDone;
} McAcp6DStreamModeInternalType;

typedef struct McAcp6DSyncMotionInternalType
{	struct McAcp6DFuncInfoType FuncInfo;
	unsigned short timeout;
	signed short cmdHB;
	unsigned char xbotNum;
	signed char xIndex;
	plcdword nTemp;
	unsigned short cmdID;
	signed char maxNXbot;
} McAcp6DSyncMotionInternalType;

typedef struct McAcp6DWriteInternalType
{	unsigned long ByteOffset;
} McAcp6DWriteInternalType;

typedef struct McAcp6DZoneActivateInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
	unsigned char Mode;
} McAcp6DZoneActivateInternalType;

typedef struct McAcp6DZoneClearInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
} McAcp6DZoneClearInternalType;

typedef struct McAcp6DZoneCreateInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
	unsigned char Mode;
} McAcp6DZoneCreateInternalType;

typedef struct McAcp6DZoneDeactivInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
	unsigned char Mode;
} McAcp6DZoneDeactivInternalType;

typedef struct McAcp6DZoneDeleteInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
	unsigned char Mode;
} McAcp6DZoneDeleteInternalType;

typedef struct McAcp6DZoneGetStatusInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
} McAcp6DZoneGetStatusInternalType;

typedef struct McAcp6DZoneStatusType
{	unsigned char ZoneState;
	unsigned char EntranceExitState;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID;
	float ZoneX;
	float ZoneY;
} McAcp6DZoneStatusType;

typedef struct MC_BR_ZoneGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DZoneStatusType ZoneStatus;
	/* VAR (analog) */
	struct McAcp6DZoneGetStatusInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneGetStatus_Acp6D_typ;

typedef struct McAcp6DZoneHoldReadyInternalType
{	signed short CmdSta;
	plcbit DummyDone;
	unsigned char Mode;
	plcbit wait_to_appear_bool;
	struct MC_BR_ZoneGetStatus_Acp6D wait_for_xbot_to_appear;
	plcbit xbot_is_in_zone_or_error;
	signed short PMC_ReadXbotState_db;
} McAcp6DZoneHoldReadyInternalType;

typedef struct McAcp6DZoneUnloadInternalType
{	unsigned short timeout;
	signed short cmdHB;
	unsigned short cmdID;
	struct McAcp6DFuncInfoType FuncInfo;
	plcdword nTemp;
	plcbit DummyDone;
} McAcp6DZoneUnloadInternalType;

typedef struct McAcp6DGetSegStatusInfoType
{	float Power;
	float CPUTemp;
	float AmplifierTemp;
	float MotorTemp;
} McAcp6DGetSegStatusInfoType;

typedef struct McAcp6DShPositionInfoType
{	float X;
	float Y;
	float Z;
	float RX;
	float RY;
	float RZ;
} McAcp6DShPositionInfoType;

typedef struct McAcp6DShForceInfoType
{	float Fx;
	float Fy;
	float Fz;
	float Tx;
	float Ty;
	float Tz;
} McAcp6DShForceInfoType;

typedef struct McAcp6DGetShStatusInfoType
{	struct McAcp6DShPositionInfoType Position;
	struct McAcp6DShForceInfoType Force;
	enum McAcp6DShuttleStateEnum State;
	unsigned short CommandLabel;
	enum McAcp6DGetShStatusForceModeEnum ForceModeState;
	unsigned char StarShuttleID;
	unsigned char GroupID;
	unsigned short NumberOfCommands;
	plcbit IsBlocked;
	plcbit IsPaused;
	unsigned char StereotypeID;
} McAcp6DGetShStatusInfoType;

typedef struct McAcp6DGetSysStatusInfoType
{	enum McAcp6DSystemStateEnum State;
	unsigned short NumberOfShuttles;
	float Power;
	float MaxCPUTemp;
	float MaxAmplifierTemp;
	float MaxMotorTemp;
} McAcp6DGetSysStatusInfoType;

typedef struct McAcp6DWriteCyclicAxisType
{	plcbit X;
	plcbit Y;
	plcbit Z;
	plcbit Rx;
	plcbit Ry;
	plcbit Rz;
} McAcp6DWriteCyclicAxisType;

typedef struct MC_BR_AutoRefresh_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DAutoRefreshInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} MC_BR_AutoRefresh_Acp6D_typ;

typedef struct MC_BR_BufferCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	enum McAcp6DBufferOptionEnum Option;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMotionBufInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_BufferCtrl_Acp6D_typ;

typedef struct MC_BR_BufferGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned char State;
	unsigned short NumberOfCommands;
	unsigned short NextCmdLabel;
	unsigned short NewCmdLabel;
	/* VAR (analog) */
	struct McAcp6DGetBufStatusInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_BufferGetStatus_Acp6D_typ;

typedef struct MC_BR_CamMotion_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char Level;
	unsigned char SlaveShuttleID;
	unsigned char NumberOfAxes;
	unsigned char SlaveAxisID[7];
	unsigned char CamID[7];
	unsigned char MasterShuttleID[7];
	unsigned char MasterAxisID[7];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DCamInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_CamMotion_Acp6D_typ;

typedef struct MC_BR_ConfigDIMacroRun_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalInputs;
	unsigned char DigitalInputID[22];
	unsigned char MacroID[22];
	unsigned char ShuttleID[22];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDIInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDIMacroRun_Acp6D_typ;

typedef struct MC_BR_ConfigDIResetDO_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalInputs;
	unsigned char DigitalInputID[22];
	unsigned char DigitalOutputID[22];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDIInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDIResetDO_Acp6D_typ;

typedef struct MC_BR_ConfigDIWaitTrigger_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalInputs;
	unsigned char DigitalInputID[22];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDIInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDIWaitTrigger_Acp6D_typ;

typedef struct MC_BR_ConfigDOCmdLabel_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalOutputs;
	unsigned char DigitalOutputID[5];
	unsigned char ShuttleID[5];
	unsigned short CommandLabel[5];
	enum McAcp6DDOTypeEnum Type[5];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDOInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDOCmdLabel_Acp6D_typ;

typedef struct MC_BR_ConfigDODisplacement_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalOutputs;
	unsigned char DigitalOutputID[5];
	unsigned char ShuttleID[5];
	enum McAcp6DDOTypeEnum Type[5];
	enum McAcp6DDODisplacementModeEnum Mode[5];
	float Threshold[5];
	float XFactor[5];
	float YFactor[5];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDOInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDODisplacement_Acp6D_typ;

typedef struct MC_BR_ConfigDOForce_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalOutputs;
	unsigned char DigitalOutputID[5];
	unsigned char ShuttleID[5];
	enum McAcp6DDOTypeEnum Type[5];
	enum McAcp6DAxisIDEnum AxisID[5];
	float Threshold[5];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDOInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDOForce_Acp6D_typ;

typedef struct MC_BR_ConfigDOMotion_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfDigitalOutputs;
	unsigned char DigitalOutputID[5];
	unsigned char ShuttleID[5];
	enum McAcp6DDOTypeEnum Type[5];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigDOInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigDOMotion_Acp6D_typ;

typedef struct MC_BR_ConfigReadCyclicCh_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfChannels;
	unsigned char ChannelID[8];
	unsigned char ShuttleID[8];
	enum McAcp6DReadCycPosEnum FeedbackMode[8];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DConfigStreamInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ConfigReadCyclicCh_Acp6D_typ;

typedef struct MC_BR_ForceModeCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	enum McAcp6DForceModeLevelEnum Mode;
	unsigned char ShuttleID;
	float ForceX;
	float ForceY;
	float ForceZ;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DForceModeInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ForceModeCtrl_Acp6D_typ;

typedef struct MC_BR_GetPayload_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float Payload;
	/* VAR (analog) */
	struct McAcp6DGetPayloadInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_GetPayload_Acp6D_typ;

typedef struct MC_BR_JogVelocity_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	float Direction;
	float Velocity;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DJogVelInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Ready;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_JogVelocity_Acp6D_typ;

typedef struct MC_BR_LevitationCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	enum McAcp6DLevitationLevelEnum Level;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DLevCtrlInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_LevitationCtrl_Acp6D_typ;

typedef struct MC_BR_MacroList_Acp6D
{
	/* VAR_INPUT (analog) */
	plcstring FileDevice[81];
	/* VAR_OUTPUT (analog) */
	unsigned long NumOfMacro;
	plcstring MacroList[65][261];
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMacroGetListInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Done;
	plcbit Busy;
} MC_BR_MacroList_Acp6D_typ;

typedef struct MC_BR_MacroGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char MacroID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	enum McAcp6DMacroStatusEnum State;
	unsigned char NumberOfCommands;
	/* VAR (analog) */
	struct McAcp6DMacroInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MacroGetStatus_Acp6D_typ;

typedef struct MC_BR_MacroLoad_Acp6D
{
	/* VAR_INPUT (analog) */
	plcstring FileDevice[81];
	plcstring FileName[81];
	unsigned char MacroID;
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	unsigned char NumberOfCommands;
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMacroLoadInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Done;
	plcbit Aborted;
	plcbit Busy;
} MC_BR_MacroLoad_Acp6D_typ;

typedef struct MC_BR_Move6D_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char ShuttleID;
	float Position[6];
	float InPlaneVelocity;
	float Acceleration;
	float ShortAxisVelocity[4];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6D6DMoveInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_Move6D_Acp6D_typ;

typedef struct MC_BR_MoveInPlanceSync_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID[4];
	float PositionX[4];
	float PositionY[4];
	float EndVelocity[4];
	float Velocity[4];
	float Acceleration[4];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6DSyncMotionInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveInPlanceSync_Acp6D_typ;

typedef struct MC_BR_MoveInPlaneAsync_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID[78];
	float PositionX[78];
	float PositionY[78];
	unsigned char OnlyMoveSelectedShuttle;
	float Velocity;
	float Acceleration;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DMultShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveInPlaneAsync_Acp6D_typ;

typedef struct MC_BR_MoveTrajectory_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned short CommandLabel;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID[12];
	unsigned char TrajectoryID[12];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float TravelTime;
	/* VAR (analog) */
	struct McAcp6DMultShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveTrajectory_Acp6D_typ;

typedef struct MC_BR_MovePause_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DPauseShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MovePause_Acp6D_typ;

typedef struct MC_BR_PlanetCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	enum McAcp6DPlanetLevelEnum Level;
	unsigned char StarShuttleID;
	unsigned char NumberOfPlanets;
	unsigned char PlanetShuttleID[32];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DPlanetMotionInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_PlanetCtrl_Acp6D_typ;

typedef struct MC_BR_ReadCyclicChAxis_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ChannelID;
	unsigned char AxisID;
	/* VAR_OUTPUT (analog) */
	float Value;
	/* VAR (analog) */
	struct McAcp6DReadStreamInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
} MC_BR_ReadCyclicChAxis_Acp6D_typ;

typedef struct MC_BR_ReadDigitalOutput_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char DigitalOutputID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DReadDigSignalInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
	plcbit Value;
} MC_BR_ReadDigitalOutput_Acp6D_typ;

typedef struct MC_BR_Reboot_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DRebootInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_Reboot_Acp6D_typ;

typedef struct MC_BR_MoveResume_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DPauseShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_MoveResume_Acp6D_typ;

typedef struct MC_BR_SegGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char SegmentID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DGetSegStatusInfoType SegmentInfo;
	/* VAR (analog) */
	struct McAcp6DGetSegStatusInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_SegGetStatus_Acp6D_typ;

typedef struct MC_BR_ShGetProperty_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned char ShuttleType;
	float PayloadWeight;
	float CenterOfGravity;
	float DimensionX;
	float DimensionY;
	float AccelerationLimit;
	/* VAR (analog) */
	struct McAcp6DGetShPropertyInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGetProperty_Acp6D_typ;

typedef struct MC_BR_ShGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	enum McAcp6DGetShStatusFeedbackEnum FeedbackType;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DGetShStatusInfoType ShuttleInfo;
	/* VAR (analog) */
	struct McAcp6DGetShStatusInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGetStatus_Acp6D_typ;

typedef struct MC_BR_ShGroupBuffer_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char GroupID;
	enum McAcp6DShGroupBufferOptionEnum BufferOption;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DGroupInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGroupBuffer_Acp6D_typ;

typedef struct MC_BR_ShGroupCoupleCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char GroupID;
	enum McAcp6DShGroupCoupleOptionEnum Option;
	enum McAcp6DShGroupCoupleModeEnum CoupleMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DGroupInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGroupCoupleCtrl_Acp6D_typ;

typedef struct MC_BR_ShGroupCreate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char GroupID;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID[32];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DCreateGroupInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGroupCreate_Acp6D_typ;

typedef struct MC_BR_ShGroupDelete_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char GroupID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DGroupInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGroupDelete_Acp6D_typ;

typedef struct MC_BR_ShGroupGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char GroupID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	enum McAcp6DShGroupCoupleOptionEnum State;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID[32];
	/* VAR (analog) */
	struct McAcp6DGetGrpStatusInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShGroupGetStatus_Acp6D_typ;

typedef struct MC_BR_ShReadForce_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShForceInfoType ForceInfo;
	/* VAR (analog) */
	struct McAcp6DReadShInfoInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} MC_BR_ShReadForce_Acp6D_typ;

typedef struct MC_BR_ShReadPosition_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShPositionInfoType PositionInfo;
	/* VAR (analog) */
	struct McAcp6DReadShInfoInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} MC_BR_ShReadPosition_Acp6D_typ;

typedef struct MC_BR_ShReadState_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	enum McAcp6DShuttleStateEnum State;
	/* VAR (analog) */
	struct McAcp6DReadShStateInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} MC_BR_ShReadState_Acp6D_typ;

typedef struct MC_BR_ShSetProperty_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char NumberOfProperties;
	unsigned char ShuttleID[14];
	enum McAcp6DSetPropertyEnum Property[14];
	float Value[14];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DSetShPropertyInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ShSetProperty_Acp6D_typ;

typedef struct MC_BR_Stop_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DStopShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_Stop_Acp6D_typ;

typedef struct MC_BR_SysGetStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DGetSysStatusInfoType SystemInfo;
	/* VAR (analog) */
	struct McAcp6DGetSysStatusInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_SysGetStatus_Acp6D_typ;

typedef struct MC_BR_SysPowerOff_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DDeactivateShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_SysPowerOff_Acp6D_typ;

typedef struct MC_BR_SysGetConfig_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	signed long NumberOfBytes;
	unsigned char Bytes[500001];
	/* VAR (analog) */
	struct McAcp6DSysGetConfigInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_SysGetConfig_Acp6D_typ;

typedef struct MC_BR_SysPowerOn_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DActivateShInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_SysPowerOn_Acp6D_typ;

typedef struct MC_BR_SysReadState_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	enum McAcp6DSystemStateEnum State;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
} MC_BR_SysReadState_Acp6D_typ;

typedef struct MC_BR_WriteCyclicChCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char Level;
	unsigned char NumberOfShuttles;
	unsigned char ShuttleID[8];
	unsigned char ChannelID[8];
	unsigned char AxisID[8];
	float OffsetX[8];
	float OffsetY[8];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DStreamModeInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_WriteCyclicChCtrl_Acp6D_typ;

typedef struct MC_BR_WriteCyclicCh_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ChannelID;
	unsigned char AxisID;
	float Value;
	/* VAR (analog) */
	struct McAcp6DWriteInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
} MC_BR_WriteCyclicCh_Acp6D_typ;

typedef struct MC_BR_WriteDigitalInput_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char DigitalInputID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DSendDigSignalInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Value;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} MC_BR_WriteDigitalInput_Acp6D_typ;

typedef struct MC_BR_ZoneActivate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DZoneActivateInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneActivate_Acp6D_typ;

typedef struct MC_BR_ZoneDeactivate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DZoneDeactivInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneDeactivate_Acp6D_typ;

typedef struct MC_BR_ZoneCreate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	unsigned char ZoneMode;
	unsigned char UnloadingMode;
	float ZoneCenterX;
	float ZoneCenterY;
	float ZoneLength;
	float ZoneWidth;
	float MaxShuttleSizeX;
	float MaxShuttleSizeY;
	float Velocity;
	float Acceleration;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DZoneCreateInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneCreate_Acp6D_typ;

typedef struct MC_BR_ZoneDelete_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DZoneDeleteInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneDelete_Acp6D_typ;

typedef struct MC_BR_ZoneHoldReady_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DZoneStatusType ZoneStatus;
	/* VAR (analog) */
	struct McAcp6DZoneHoldReadyInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneHoldReady_Acp6D_typ;

typedef struct MC_BR_ZoneClear_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DZoneClearInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneClear_Acp6D_typ;

typedef struct MC_BR_ZoneUnload_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	unsigned char ZoneID;
	unsigned char ShuttleID;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McAcp6DZoneUnloadInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_ZoneUnload_Acp6D_typ;

typedef struct MC_BR_GetErrorCode_Acp6D
{
	/* VAR_INPUT (analog) */
	struct McAcp6DControllerType* Controller;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned char NumberOfErrors;
	signed long ErrorCodes[9];
	/* VAR (analog) */
	struct McAcp6DGetErrorCodeInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit Aborted;
	plcbit Error;
} MC_BR_GetErrorCode_Acp6D_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MC_BR_AutoRefresh_Acp6D(struct MC_BR_AutoRefresh_Acp6D* inst);
_BUR_PUBLIC void MC_BR_BufferCtrl_Acp6D(struct MC_BR_BufferCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_BufferGetStatus_Acp6D(struct MC_BR_BufferGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_CamMotion_Acp6D(struct MC_BR_CamMotion_Acp6D* inst);
_BUR_PUBLIC void MC_BR_CmdEventLog_Acp6D(struct MC_BR_CmdEventLog_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDIMacroRun_Acp6D(struct MC_BR_ConfigDIMacroRun_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDIResetDO_Acp6D(struct MC_BR_ConfigDIResetDO_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDIWaitTrigger_Acp6D(struct MC_BR_ConfigDIWaitTrigger_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDOCmdLabel_Acp6D(struct MC_BR_ConfigDOCmdLabel_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDODisplacement_Acp6D(struct MC_BR_ConfigDODisplacement_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDOForce_Acp6D(struct MC_BR_ConfigDOForce_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigDOMotion_Acp6D(struct MC_BR_ConfigDOMotion_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ConfigReadCyclicCh_Acp6D(struct MC_BR_ConfigReadCyclicCh_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ForceModeCtrl_Acp6D(struct MC_BR_ForceModeCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_GetPayload_Acp6D(struct MC_BR_GetPayload_Acp6D* inst);
_BUR_PUBLIC void MC_BR_JogVelocity_Acp6D(struct MC_BR_JogVelocity_Acp6D* inst);
_BUR_PUBLIC void MC_BR_LevitationCtrl_Acp6D(struct MC_BR_LevitationCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroClear_Acp6D(struct MC_BR_MacroClear_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroList_Acp6D(struct MC_BR_MacroList_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroGetStatus_Acp6D(struct MC_BR_MacroGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroLoad_Acp6D(struct MC_BR_MacroLoad_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroRun_Acp6D(struct MC_BR_MacroRun_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroSave_Acp6D(struct MC_BR_MacroSave_Acp6D* inst);
_BUR_PUBLIC void MC_BR_Move6D_Acp6D(struct MC_BR_Move6D_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveArcAngle_Acp6D(struct MC_BR_MoveArcAngle_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveArcRadius_Acp6D(struct MC_BR_MoveArcRadius_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveInPlanceSync_Acp6D(struct MC_BR_MoveInPlanceSync_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveInPlaneAsync_Acp6D(struct MC_BR_MoveInPlaneAsync_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveInPlane_Acp6D(struct MC_BR_MoveInPlane_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveShortAxis_Acp6D(struct MC_BR_MoveShortAxis_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveTrajectory_Acp6D(struct MC_BR_MoveTrajectory_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MovePause_Acp6D(struct MC_BR_MovePause_Acp6D* inst);
_BUR_PUBLIC void MC_BR_PlanetCtrl_Acp6D(struct MC_BR_PlanetCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ReadCyclicChAxis_Acp6D(struct MC_BR_ReadCyclicChAxis_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ReadDigitalOutput_Acp6D(struct MC_BR_ReadDigitalOutput_Acp6D* inst);
_BUR_PUBLIC void MC_BR_Reboot_Acp6D(struct MC_BR_Reboot_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveResume_Acp6D(struct MC_BR_MoveResume_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SegGetStatus_Acp6D(struct MC_BR_SegGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGetProperty_Acp6D(struct MC_BR_ShGetProperty_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGetStatus_Acp6D(struct MC_BR_ShGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupBuffer_Acp6D(struct MC_BR_ShGroupBuffer_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupCoupleCtrl_Acp6D(struct MC_BR_ShGroupCoupleCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupCreate_Acp6D(struct MC_BR_ShGroupCreate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupDelete_Acp6D(struct MC_BR_ShGroupDelete_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupGetStatus_Acp6D(struct MC_BR_ShGroupGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShReadForce_Acp6D(struct MC_BR_ShReadForce_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShReadPosition_Acp6D(struct MC_BR_ShReadPosition_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShReadState_Acp6D(struct MC_BR_ShReadState_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShSetProperty_Acp6D(struct MC_BR_ShSetProperty_Acp6D* inst);
_BUR_PUBLIC void MC_BR_Stop_Acp6D(struct MC_BR_Stop_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SysGetStatus_Acp6D(struct MC_BR_SysGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SysPowerOff_Acp6D(struct MC_BR_SysPowerOff_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SysGetConfig_Acp6D(struct MC_BR_SysGetConfig_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SysPowerOn_Acp6D(struct MC_BR_SysPowerOn_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SysReadState_Acp6D(struct MC_BR_SysReadState_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WaitUntilCmdLabel_Acp6D(struct MC_BR_WaitUntilCmdLabel_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WaitUntilDisp_Acp6D(struct MC_BR_WaitUntilDisp_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WaitUntilDI_Acp6D(struct MC_BR_WaitUntilDI_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WaitUntilTime_Acp6D(struct MC_BR_WaitUntilTime_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WriteCyclicChCtrl_Acp6D(struct MC_BR_WriteCyclicChCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WriteCyclicCh_Acp6D(struct MC_BR_WriteCyclicCh_Acp6D* inst);
_BUR_PUBLIC void MC_BR_WriteDigitalInput_Acp6D(struct MC_BR_WriteDigitalInput_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneActivate_Acp6D(struct MC_BR_ZoneActivate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneDeactivate_Acp6D(struct MC_BR_ZoneDeactivate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneCreate_Acp6D(struct MC_BR_ZoneCreate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneDelete_Acp6D(struct MC_BR_ZoneDelete_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneGetStatus_Acp6D(struct MC_BR_ZoneGetStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneHoldReady_Acp6D(struct MC_BR_ZoneHoldReady_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneClear_Acp6D(struct MC_BR_ZoneClear_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneUnload_Acp6D(struct MC_BR_ZoneUnload_Acp6D* inst);
_BUR_PUBLIC void MC_BR_GetErrorCode_Acp6D(struct MC_BR_GetErrorCode_Acp6D* inst);
_BUR_PUBLIC plcbit MC_BR_CmdProcessor_Acp6D(plcbit Execute, unsigned char ExecutionLocation, plcbit EventCommand, struct McAcp6DControllerType* Controller, struct McAcp6DFuncInfoType* FuncInfo, plcbit* Acknowledge, plcbit* Done, plcbit* Busy, plcbit* Error, signed long* ErrorID, plcbit* Aborted);
_BUR_PUBLIC plcbit MC_BR_CmdEventLogAddBuff_Acp6D(plcbit Execute, signed long ErrorID, plcbit Aborted, struct McAcp6DControllerType** Controller, struct McAcp6DFuncInfoType** FuncInfo, enum McAcp6DLogBufferTypeEnum CmdType);


#ifdef __cplusplus
};
#endif
#endif /* _MCACP6D_ */

