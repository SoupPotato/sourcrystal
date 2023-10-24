JamiePhoneCalleeScript: ; You call Jamie
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JAMIE1
	checkflag ENGINE_JAMIE_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JAMIE_HAS_MOON_STONE
	iftrue .HasMoonStone
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .CheckMoonStoneNotTuesday1
	checktime NITE
	iftrue CheckMoonStone

.CheckMoonStoneNotTuesday1:
	checkflag ENGINE_JAMIE_HAS_MOON_STONE
	iftrue .HasMoonStone
	checkflag ENGINE_JAMIE_GAVE_MOON_STONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, JamieHasMoonStone
	setflag ENGINE_JAMIE_GAVE_MOON_STONE

.Generic:
	farjump JamieSneezing

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	farjump JamieReminderScript

.HasMoonStone:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	farjump JamieGiftReminderScript

JamiePhoneCallerScript:  ; Calls you
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JAMIE1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JAMIE_HAS_MOON_STONE
	iftrue .HasMoonStone
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, CheckMoonStoneNotTuesday2
	checktime NITE
	iftrue CheckMoonStone
	jump CheckMoonStoneNotTuesday2

.HasMoonStone:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	farjump JamieGiftReminderScript

CheckMoonStoneNotTuesday2:
	checkflag ENGINE_JAMIE_GAVE_MOON_STONE
	iftrue GenericJamieCall
	farscall PhoneScript_Random11
	ifequal 0, JamieHasMoonStone
	setflag ENGINE_JAMIE_GAVE_MOON_STONE
	jump GenericJamieCall

CheckMoonStone:
	checkflag ENGINE_JAMIE_GAVE_MOON_STONE
	iftrue JamieWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, JamieHasMoonStone
	setflag ENGINE_JAMIE_GAVE_MOON_STONE

JamieWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	setflag ENGINE_JAMIE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male

JamieHasMoonStone:
	setflag ENGINE_JAMIE_HAS_MOON_STONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_14
	farjump PhoneScript_FoundItem_Male

GenericJamieCall:
	farjump Phone_GenericCall_Male