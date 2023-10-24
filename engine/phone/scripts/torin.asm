TorinPhoneCalleeScript: ; You call Torin
	gettrainername STRING_BUFFER_3, SCHOOLBOY, TORIN1
	checkflag ENGINE_TORIN_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue TorinWantsBattle

.NotWednesday:
	farjump TorinSchool

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	farjump TorinReminderScript

TorinPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, SCHOOLBOY, TORIN1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .GenericTorinCall
	checktime NITE
	iftrue TorinWantsBattle
	jump .GenericTorinCall

.GenericTorinCall:
	farjump Phone_GenericCall_Male

TorinWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	setflag ENGINE_TORIN_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male