RobPhoneCalleeScript: ; You call Rob
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ROB1
	checkflag ENGINE_ROB_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROB_HAS_BERRY
	iftrue .HasBerry
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .CheckRobBerryNotFriday1
	checktime MORN
	iftrue RobCheckBerry

.CheckRobBerryNotFriday1
	checkflag ENGINE_ROB_HAS_BERRY
	iftrue .HasBerry
	checkflag ENGINE_ROB_GAVE_BERRY
	iftrue .Generic
	farscall PhoneScript_Random5
	ifequal 0, RobHasBerry
	setflag ENGINE_ROB_GAVE_BERRY

.Generic:
	farjump RobStory

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump RobReminderScript

.HasBerry:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump RobBerryReminderScript

RobPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ROB1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROB_HAS_BERRY
	iftrue .HasBerry
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, CheckRobBerryNotFriday2
	checktime MORN
	iftrue RobCheckBerry
	jump CheckRobBerryNotFriday2

.HasBerry:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump RobBerryReminderScript

CheckRobBerryNotFriday2:
	checkflag ENGINE_ROB_GAVE_BERRY
	iftrue GenericRobCall
	farscall PhoneScript_Random5
	ifequal 0, RobHasBerry
	setflag ENGINE_ROB_GAVE_BERRY
	jump GenericRobCall

RobCheckBerry:
	checkflag ENGINE_ROB_GAVE_BERRY
	iftrue RobWantsBattle
	farscall PhoneScript_Random5
	ifequal 0, RobHasBerry
	setflag ENGINE_ROB_GAVE_BERRY

RobWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	setflag ENGINE_ROB_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

RobHasBerry:
	setflag ENGINE_ROB_HAS_BERRY
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump PhoneScript_FoundItem_Male

GenericRobCall:
	farjump Phone_GenericCall_Male