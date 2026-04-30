DougPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, BUG_CATCHER, DOUG1
	checkflag ENGINE_DOUG_HAS_BERRY
	iftrue DougRematchAndBerryReminder
	checkflag ENGINE_DOUG_READY_FOR_REMATCH
	iftrue DougRematchAndBerryReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime MORN
	iftrue DougWantsBattle

.NotWednesday:
	checkflag ENGINE_DOUG_GAVE_BERRY
	iftrue .Generic
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, DougHasBerry
	setflag ENGINE_DOUG_GAVE_BERRY

.Generic:
	farjump DougDadStoryScript

DougRematchAndBerryReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump DougRematchAndBerryReminderScript

DougPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BUG_CATCHER, DOUG1
	checkflag ENGINE_DOUG_HAS_BERRY
	iftrue DougRematchAndBerryReminder
	checkflag ENGINE_DOUG_READY_FOR_REMATCH
	iftrue DougRematchAndBerryReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2 ; 33% chance when they call you
	ifequal 0, DougHasBerry
	setflag ENGINE_DOUG_GAVE_BERRY
	farscall PhoneScript_Random2
	ifequal 0, DougWantsBattle
	farsjump Phone_GenericCall_Male

DougWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	setflag ENGINE_DOUG_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

DougHasBerry:
	setflag ENGINE_DOUG_HAS_BERRY
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_2
	farjump PhoneScript_FoundItem_Male
