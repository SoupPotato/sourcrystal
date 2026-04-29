JoeyPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
	iftrue JoeyBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue JoeyWantsBattle
	checktime EVE
	iftrue JoeyWantsBattle

.NotMonday:
	special RandomPhoneMon
	farsjump JoeyHangUpScript

JoeyBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_30
	farsjump JoeyReminderScript

JoeyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
	iftrue JoeyBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JoeyWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

JoeyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_30
	setflag ENGINE_JOEY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male
