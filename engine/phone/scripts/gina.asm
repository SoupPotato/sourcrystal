GinaPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue GinaLeafStoneReminder
	checkflag ENGINE_GINA_READY_FOR_REMATCH
	iftrue GinaBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue .NotSunday
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime DAY
	iftrue GinaWantsBattle
	checktime EVE
	iftrue GinaWantsBattle

.NotSunday:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRockets
	farscall PhoneScript_Random11 ; 9% chance when you call them
	ifequal 0, GinaHasLeafStone
	setflag ENGINE_GINA_GAVE_LEAF_STONE
	farsjump GinaHangUpScript

GinaLeafStoneReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	farsjump GinaComePickUpScript

GinaBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	farsjump GinaReminderScript

GinaPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue GinaLeafStoneReminder
	checkflag ENGINE_GINA_READY_FOR_REMATCH
	iftrue GinaBattleReminder
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRockets
	farscall PhoneScript_Random3 ; 25% chance when they call you
	ifequal 0, GinaHasLeafStone
	setflag ENGINE_GINA_GAVE_LEAF_STONE
	farscall PhoneScript_Random2
	ifequal 0, GinaWantsBattle
	farsjump Phone_GenericCall_Female

GinaWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	setflag ENGINE_GINA_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female

GinaRockets:
	farsjump GinaRocketRumorScript

GinaHasLeafStone:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	farsjump PhoneScript_FoundItem_Female
