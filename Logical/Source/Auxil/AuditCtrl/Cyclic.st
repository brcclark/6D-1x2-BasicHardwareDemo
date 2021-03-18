
PROGRAM _CYCLIC
	AuditCoreFb.MpLink := ADR(gAuditTrail);
	AuditCoreFb.Enable := TRUE;
	AuditCoreFb.DeviceName := ADR('AuditFileDev');
	AuditCoreFb();
	 
END_PROGRAM
