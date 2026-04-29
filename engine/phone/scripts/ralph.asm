RalphPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftrue RalphBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime MORN
	iftrue RalphWantsBattle

.NotWednesday:
	farsjump RalphWonderfulFishingScript

RalphBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_32
	farsjump RalphReminderScript

RalphPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftrue RalphBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, RalphWantsBattle
	farsjump Phone_GenericCall_Male

RalphWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_32
	setflag ENGINE_RALPH_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male
