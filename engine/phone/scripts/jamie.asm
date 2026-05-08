JamiePhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JAMIE1
	checkflag ENGINE_JAMIE_READY_FOR_REMATCH
	iftrue JamieBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime NITE
	iftrue JamieWantsBattle

.NotTuesday:
	farjump JamieSneezingScript

JamieBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	farjump JamieReminderScript

JamiePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JAMIE1
	checkflag ENGINE_JAMIE_READY_FOR_REMATCH
	iftrue JamieBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JamieWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

JamieWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	setflag ENGINE_JAMIE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
