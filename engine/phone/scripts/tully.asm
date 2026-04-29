TullyPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue TullyWaterStoneReminder
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftrue TullyBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue TullyWantsBattle

.NotSunday:
	checkflag ENGINE_TULLY_GAVE_WATER_STONE
	iftrue .skipWaterStone
	farscall PhoneScript_Random11 ; 9% chance when you call them
	ifequal 0, TullyHasWaterStone
.skipWaterStone
	farsjump TullyNoItemScript

TullyBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	farsjump TullyReminderScript

TullyWaterStoneReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	farsjump TullyHurryScript

TullyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue TullyWaterStoneReminder
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftrue TullyBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random3 ; 25% chance when you call them
	ifequal 0, TullyHasWaterStone
	setflag ENGINE_TULLY_GAVE_WATER_STONE
	farscall PhoneScript_Random2
	ifequal 0, TullyWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

TullyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	setflag ENGINE_TULLY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

TullyHasWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	farsjump PhoneScript_FoundItem_Male
