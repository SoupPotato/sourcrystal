TullyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .NotSunday
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .WaterStone
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue TullyWantsBattle

.NotSunday:
	farsjump TullyNoItemScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	farsjump TullyReminderScript

.WaterStone:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	farsjump TullyHurryScript

TullyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftrue .Generic
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, TullyFoundWaterStone
	farscall PhoneScript_Random2
	ifequal 0, TullyWantsBattle

.Generic:
	farsjump Phone_GenericCall_Male

TullyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	setflag ENGINE_TULLY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

TullyFoundWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_42
	farsjump PhoneScript_FoundItem_Male
