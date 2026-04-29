DerekPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue DerekNuggetReminder
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_GAVE_NUGGET
	iftrue .SkipNugget
	farscall PhoneScript_Random4 ; 20% chance when you call them
	ifequal 0, DerekFoundNugget
	setflag ENGINE_DEREK_GAVE_NUGGET
.SkipNugget
	farscall PhoneScript_Random2
	ifequal 0, .NoContestCallee
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContestCallee
	readvar VAR_WEEKDAY
	ifequal TUESDAY, DerekContestToday
	ifequal THURSDAY, DerekContestToday
	ifequal SATURDAY, DerekContestToday

.NoContestCallee:
	farsjump DerekHangUpScript

DerekNuggetReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump DerekComePickUpScript

DerekPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue DerekNuggetReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random4 ; 20% chance when you call them
	ifequal 0, DerekFoundNugget
	farscall PhoneScript_Random2
	ifequal 0, .NoContestCaller
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContestCaller
	readvar VAR_WEEKDAY
	ifequal TUESDAY, DerekContestToday
	ifequal THURSDAY, DerekContestToday
	ifequal SATURDAY, DerekContestToday

.NoContestCaller:
	farsjump Phone_GenericCall_Male

DerekContestToday:
	farsjump PhoneScript_BugCatchingContest

DerekFoundNugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump PhoneScript_FoundItem_Male
