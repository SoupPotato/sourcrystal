ParryPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftrue ParryBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue ParryWantsBattle
	checktime EVE
	iftrue ParryWantsBattle

.NotFriday:
	farsjump ParryBattleWithMeScript ; not a rematch request

ParryBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_45
	farsjump ParryReminderScript

ParryPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftrue ParryBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, ParryWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

ParryWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_45
	setflag ENGINE_PARRY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male
