WaltPhoneCalleeScript: ; You call Walt
	gettrainername STRING_BUFFER_3, FIREBREATHER, WALT1
	checkflag ENGINE_WALT_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue WaltWantsToBattle
	checktime EVE
	iftrue WaltWantsToBattle

.NotMonday:
	ifequal TUESDAY, WaltContestToday
	ifequal THURSDAY, WaltContestToday
	ifequal SATURDAY, WaltContestToday
	farjump WaltTypesOfPokemon

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	farjump WaltReminderScript

WaltPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FIREBREATHER, WALT1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, WaltWantsToBattle

.NotMonday:
	ifequal TUESDAY, WaltContestToday
	ifequal THURSDAY, WaltContestToday
	ifequal SATURDAY, WaltContestToday
	farscall PhoneScript_Random3
	ifequal 0, WaltFoundRare
	farjump WaltNewTechnique

WaltWantsToBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	setflag ENGINE_WALT_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

WaltFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

WaltContestToday:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	farjump PhoneScript_BugCatchingContest
