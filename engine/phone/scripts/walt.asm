WaltPhoneCalleeScript: ; You call Walt
	gettrainername STRING_BUFFER_3, FIREBREATHER, WALT1
	checkflag ENGINE_WALT_READY_FOR_REMATCH
	iftrue WaltBattleReminder
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
	farjump WaltTypesOfPokemonScript

WaltBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	farjump WaltReminderScript

WaltPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FIREBREATHER, WALT1
	checkflag ENGINE_WALT_READY_FOR_REMATCH
	iftrue WaltBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, WaltWantsToBattle
	farscall PhoneScript_Random3
	ifequal 0, WaltFoundRare
	ifequal TUESDAY, WaltContestToday
	ifequal THURSDAY, WaltContestToday
	ifequal SATURDAY, WaltContestToday
	farjump Phone_GenericCall_Male

WaltWantsToBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	setflag ENGINE_WALT_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

WaltContestToday:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	farjump PhoneScript_BugCatchingContest

WaltFoundRare:
	farjump Phone_CheckIfUnseenRare_Male
