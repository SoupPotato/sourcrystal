GavenPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue GavenBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue GavenWantsRematch

.NotThursday:
	farsjump GavenHangUpNotThursdayScript

GavenBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_26
	farsjump GavenReminderScript

GavenPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue GavenBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2 ; 33% chance for a rematch
	ifequal 0, GavenWantsRematch
	farscall PhoneScript_Random3
	ifequal 0, GavenFoundRare
	farsjump Phone_GenericCall_Male

GavenWantsRematch:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_26
	setflag ENGINE_GAVEN_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male
