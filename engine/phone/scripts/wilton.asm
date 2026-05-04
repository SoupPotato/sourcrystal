WiltonPhoneCalleeScript: ; You call 
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	checkflag ENGINE_WILTON_HAS_BALL_ITEM
	iftrue WiltonItemReminder
	checkflag ENGINE_WILTON_READY_FOR_REMATCH
	iftrue WiltonBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue WiltonWantsBattle

.NotThursday:
	checkflag ENGINE_WILTON_GAVE_BALL_ITEM
	iftrue .Generic
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, WiltonHasItem
	setflag ENGINE_WILTON_GAVE_BALL_ITEM

.Generic:
	farsjump WiltonHaventFoundAnythingScript

WiltonItemReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_44
	farsjump WiltonWantThisScript

WiltonBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_44
	farsjump WiltonReminderScript

WiltonPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	checkflag ENGINE_WILTON_HAS_BALL_ITEM
	iftrue WiltonItemReminder
	checkflag ENGINE_WILTON_READY_FOR_REMATCH
	iftrue WiltonBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, WiltonHasItem
	setflag ENGINE_WILTON_GAVE_BALL_ITEM
	farscall PhoneScript_Random2
	ifequal 0, WiltonWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

WiltonWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_44
	setflag ENGINE_WILTON_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

WiltonHasItem:
	setflag ENGINE_WILTON_HAS_BALL_ITEM
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_44
	farsjump PhoneScript_FoundItem_Male
