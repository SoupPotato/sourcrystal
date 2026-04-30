RobPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ROB1
	checkflag ENGINE_ROB_HAS_BERRY
	iftrue RobRematchAndBerryReminder
	checkflag ENGINE_ROB_READY_FOR_REMATCH
	iftrue RobRematchAndBerryReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime MORN
	iftrue RobWantsBattle

.NotFriday:
	checkflag ENGINE_ROB_GAVE_BERRY
	iftrue .Generic
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, RobHasBerry
	setflag ENGINE_ROB_GAVE_BERRY

.Generic:
	farjump RobCutFingerScript

RobRematchAndBerryReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump RobRematchAndBerryReminderScript

RobPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ROB1
	checkflag ENGINE_ROB_HAS_BERRY
	iftrue RobRematchAndBerryReminder
	checkflag ENGINE_ROB_READY_FOR_REMATCH
	iftrue RobRematchAndBerryReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, RobHasBerry
	setflag ENGINE_ROB_GAVE_BERRY
	farscall PhoneScript_Random2
	ifequal 0, RobWantsBattle
	farsjump Phone_GenericCall_Male

RobWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	setflag ENGINE_ROB_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

RobHasBerry:
	setflag ENGINE_ROB_HAS_BERRY
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump PhoneScript_FoundItem_Male
