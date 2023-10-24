HillaryPhoneCalleeScript: ; You call Hillary
	gettrainername STRING_BUFFER_3, TEACHER, HILLARY1
	checkflag ENGINE_HILLARY_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotFriday
	checktime NITE
	iftrue HillaryWantsBattle

.NotFriday:
	farjump HillaryCutestThing

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	farjump HillaryReminderScript

HillaryPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, TEACHER, HILLARY1
	farscall PhoneScript_GreetPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .GenericHillaryCall
	checktime NITE
	iftrue HillaryWantsBattle
	jump .GenericHillaryCall

.GenericHillaryCall:
	farjump Phone_GenericCall_Female

HillaryWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	setflag ENGINE_HILLARY_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Female