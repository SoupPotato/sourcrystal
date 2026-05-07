KennyPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, HIKER, KENNY1
	checkflag ENGINE_KENNY_READY_FOR_REMATCH
	iftrue KennyBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime DAY
	iftrue KennyWantsBattle
	checktime EVE
	iftrue KennyWantsBattle

.NotSaturday:
	farjump KennyBathsScript

KennyBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump KennyReminderScript

KennyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, HIKER, KENNY1
	checkflag ENGINE_KENNY_READY_FOR_REMATCH
	iftrue KennyBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, KennyWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Male

KennyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_KENNY_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male