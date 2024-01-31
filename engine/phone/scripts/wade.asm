WadePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue .NotTuesday
	checkflag ENGINE_WADE_HAS_BERRY
	iftrue .HasItem
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime NITE
	iftrue WadeWantsBattle2

.NotTuesday:
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farsjump WadeNoBerriesScript

.ContestToday:
	farsjump PhoneScript_BugCatchingContest

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	farsjump WadeReminderScript

.HasItem:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	farsjump WadeComeQuickScript

WadePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue .next
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue .next
	checkflag ENGINE_WADE_HAS_BERRY
	iftrue .next
	farscall PhoneScript_Random2
	ifequal 0, WadeHasItem2
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .next
	farscall PhoneScript_Random2
	ifequal 0, WadeWantsBattle2

.next:
	farscall PhoneScript_Random3
	ifequal 0, WadeFoundRare
	farsjump Phone_GenericCall_Male

.ContestToday:
	farsjump PhoneScript_BugCatchingContest

WadeWantsBattle2:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	setflag ENGINE_WADE_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

WadeFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

WadeHasItem2:
	setflag ENGINE_WADE_HAS_BERRY
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_31
	clearevent EVENT_WADE_HAS_ORAN_BERRY
	clearevent EVENT_WADE_HAS_PECHA_BERRY
	clearevent EVENT_WADE_HAS_CHERI_BERRY
	clearevent EVENT_WADE_HAS_PERSIM_BERRY
	random 4
	ifequal 0, .OranBerry
	ifequal 1, .PechaBerry
	ifequal 2, .CheriBerry
	ifequal 3, .PersimBerry

.OranBerry:
	setevent EVENT_WADE_HAS_ORAN_BERRY
	sjump .FoundBerry

.PechaBerry:
	setevent EVENT_WADE_HAS_PECHA_BERRY
	sjump .FoundBerry

.CheriBerry:
	setevent EVENT_WADE_HAS_CHERI_BERRY
	sjump .FoundBerry

.PersimBerry:
	setevent EVENT_WADE_HAS_PERSIM_BERRY

.FoundBerry:
	farsjump PhoneScript_FoundItem_Male
