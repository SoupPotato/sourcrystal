ReenaPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	checkflag ENGINE_REENA_READY_FOR_REMATCH
	iftrue ReenaBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime MORN
	iftrue ReenaWantsBattle

.NotSunday:
	farsjump ReenaForwardScript

ReenaBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_27
	farsjump ReenaReminderScript

ReenaPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	checkflag ENGINE_REENA_READY_FOR_REMATCH
	iftrue ReenaBattleReminder
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random2
	ifequal 0, ReenaWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Female

ReenaWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_27
	setflag ENGINE_REENA_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female
