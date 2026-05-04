KylePhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, FISHER, KYLE1
	checkflag ENGINE_KYLE_READY_FOR_REMATCH
	iftrue KyleBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime DAY
	iftrue KyleWantsBattle
	checktime EVE
	iftrue KyleWantsBattle

.NotWednesday:
	farjump KyleFishingTipsScript

KyleBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_12
	farjump KyleReminderScript

KylePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FISHER, KYLE1
	checkflag ENGINE_KYLE_READY_FOR_REMATCH
	iftrue KyleBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, KyleWantsBattle
	farjump Phone_GenericCall_Male

KyleWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_12
	setflag ENGINE_KYLE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male