DougPhoneCalleeScript: ; You call Doug
	gettrainername STRING_BUFFER_3, BUG_CATCHER, DOUG1
	checkflag ENGINE_DOUG_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DOUG_HAS_BERRY
	iftrue .HasBerry
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .CheckDougBerryNotWednesday1
	checktime MORN
	iftrue DougCheckBerry

.CheckDougBerryNotWednesday1
	checkflag ENGINE_DOUG_HAS_BERRY
	iftrue .HasBerry
	checkflag ENGINE_DOUG_GAVE_BERRY
	iftrue .Generic
	farscall PhoneScript_Random5
	ifequal 0, DougHasBerry
	setflag ENGINE_DOUG_GAVE_BERRY

.Generic:
	farjump DougStory

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump DougReminderScript

.HasBerry:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump DougBerryReminderScript

DougPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BUG_CATCHER, DOUG1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_DOUG_HAS_BERRY
	iftrue .HasBerry
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, CheckDougBerryNotWednesday2
	checktime MORN
	iftrue DougCheckBerry
	jump CheckDougBerryNotWednesday2

.HasBerry:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump DougBerryReminderScript

CheckDougBerryNotWednesday2:
	checkflag ENGINE_DOUG_GAVE_BERRY
	iftrue GenericDougCall
	farscall PhoneScript_Random5
	ifequal 0, DougHasBerry
	setflag ENGINE_DOUG_GAVE_BERRY
	jump GenericDougCall

DougCheckBerry:
	checkflag ENGINE_DOUG_GAVE_BERRY
	iftrue DougWantsBattle
	farscall PhoneScript_Random5
	ifequal 0, DougHasBerry
	setflag ENGINE_DOUG_GAVE_BERRY

DougWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	setflag ENGINE_DOUG_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

DougHasBerry:
	setflag ENGINE_DOUG_HAS_BERRY
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump PhoneScript_FoundItem_Male

GenericDougCall:
	farjump Phone_GenericCall_Male
