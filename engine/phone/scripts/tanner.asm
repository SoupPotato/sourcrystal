TannerPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	checkflag ENGINE_TANNER_HAS_SUN_STONE
	iftrue TannerSunStoneReminder
	checkflag ENGINE_TANNER_READY_FOR_REMATCH
	iftrue TannerBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime NITE
	iftrue TannerWantsBattle

.NotMonday:
	checkflag ENGINE_TANNER_GAVE_SUN_STONE
	iftrue .skipSunStone
	farscall PhoneScript_Random11 ; 9% chance when you call them
	ifequal 0, TannerHasSunStone
	setflag ENGINE_TANNER_GAVE_SUN_STONE
.skipSunStone:
	farjump TannerCampingDifferenceScript

TannerBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TannerReminderScript

TannerSunStoneReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TannerComePickUpScript

TannerPhoneCallerScript:  ; Calls you
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	checkflag ENGINE_TANNER_HAS_SUN_STONE
	iftrue TannerSunStoneReminder
	checkflag ENGINE_TANNER_READY_FOR_REMATCH
	iftrue TannerBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random3 ; 25% chance when they call you
	ifequal 0, TannerHasSunStone
	setflag ENGINE_TANNER_GAVE_SUN_STONE
	farscall PhoneScript_Random2
	ifequal 0, TannerWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

TannerWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_TANNER_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

TannerHasSunStone:
	setflag ENGINE_TANNER_HAS_SUN_STONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump PhoneScript_FoundItem_Male
