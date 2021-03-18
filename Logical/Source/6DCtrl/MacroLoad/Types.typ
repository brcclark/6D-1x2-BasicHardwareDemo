
TYPE
	MacroLoadFbsTyp : 	STRUCT  (*Fbs for the macro load functionality*)
		MacroLoadFb : MC_BR_MacroLoad_Acp6D; (*FB to load a macro from an XML file*)
		MacroClearFb : MC_BR_MacroClear_Acp6D; (*FB to clear a defined macro*)
	END_STRUCT;
	MacroLoadStateEnum : 
		(
		MACLOAD_IDLE, (*Idle state for the macro load process*)
		MACLOAD_LOAD, (*Load state for the macro load process*)
		MACLOAD_COUNT_CHECK, (*State to determine if we have finished the load of all macros*)
		MACLOAD_CLEAR, (*State to exectue a macro clear FB*)
		MACLOAD_DONE, (*State to denote completion of the initalize load process*)
		MACLOAD_ERROR (*Macro Load error state*)
		);
END_TYPE
