WadePhoneCalleeScript: ; You call 
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	checkflag ENGINE_WADE_HAS_BERRY
	iftrue WadeBerryReminder
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue WadeBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime NITE
	iftrue WadeWantsBattle

.NotTuesday:
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContestCallee
	readvar VAR_WEEKDAY
	ifequal TUESDAY, WadeContestToday
	ifequal THURSDAY, WadeContestToday
	ifequal SATURDAY, WadeContestToday

.NoContestCallee:
	checkflag ENGINE_WADE_GAVE_BERRY
	iftrue .Generic
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, WadeHasBerry
	setflag ENGINE_WADE_GAVE_BERRY

.Generic:
	farsjump WadeNoBerriesScript

WadeContestToday:
	farsjump PhoneScript_BugCatchingContest

WadeBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	farsjump WadeReminderScript

WadePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue WadeBattleReminder
	checkflag ENGINE_WADE_HAS_BERRY
	iftrue WadeBerryReminder
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContestCaller
	readvar VAR_WEEKDAY
	ifequal TUESDAY, WadeContestToday
	ifequal THURSDAY, WadeContestToday
	ifequal SATURDAY, WadeContestToday

.NoContestCaller:
	farscall PhoneScript_Random2 ; 33% chance when they call you
	ifequal 0, WadeHasBerry
	setflag ENGINE_WADE_GAVE_BERRY
	farscall PhoneScript_Random2
	ifequal 0, WadeWantsBattle ; 33% chance for a rematch
	farscall PhoneScript_Random3
	ifequal 0, WadeFoundRare
	farjump Phone_GenericCall_Male

WadeBerryReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	farsjump WadeComeQuickScript

WadeWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	setflag ENGINE_WADE_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

WadeHasBerry:
	setflag ENGINE_WADE_HAS_BERRY
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump PhoneScript_FoundItem_Male

WadeFoundRare:
	farjump Phone_CheckIfUnseenRare_Male
