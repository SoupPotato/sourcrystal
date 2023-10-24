TannerPhoneCalleeScript: ; You call Tanner
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	checkflag ENGINE_TANNER_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TANNER_HAS_SUN_STONE
	iftrue .HasSunStone
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .CheckSunStoneNotMonday1
	checktime NITE
	iftrue CheckSunStone

.CheckSunStoneNotMonday1:
	checkflag ENGINE_TANNER_HAS_SUN_STONE
	iftrue .HasSunStone
	checkflag ENGINE_TANNER_GAVE_SUN_STONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, TannerHasSunStone
	setflag ENGINE_TANNER_GAVE_SUN_STONE

.Generic:
	farjump TannerCamping

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TannerReminderScript

.HasSunStone:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TannerGiftReminderScript

TannerPhoneCallerScript:  ; Calls you
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TANNER_HAS_SUN_STONE
	iftrue .HasSunStone
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, CheckSunStoneNotMonday2
	checktime NITE
	iftrue CheckSunStone
	jump CheckSunStoneNotMonday2

.HasSunStone:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TannerGiftReminderScript

CheckSunStoneNotMonday2:
	checkflag ENGINE_TANNER_GAVE_SUN_STONE
	iftrue GenericTannerCall
	farscall PhoneScript_Random11
	ifequal 0, TannerHasSunStone
	setflag ENGINE_TANNER_GAVE_SUN_STONE
	jump GenericTannerCall

CheckSunStone:
	checkflag ENGINE_TANNER_GAVE_SUN_STONE
	iftrue TannerWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, TannerHasSunStone
	setflag ENGINE_TANNER_GAVE_SUN_STONE

TannerWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_TANNER_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

TannerHasSunStone:
	setflag ENGINE_TANNER_HAS_SUN_STONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump PhoneScript_FoundItem_Male

GenericTannerCall:
	farjump Phone_GenericCall_Male