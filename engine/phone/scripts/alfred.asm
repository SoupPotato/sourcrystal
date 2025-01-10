AlfredPhoneCalleeScript: ; You call Alfred
	gettrainername STRING_BUFFER_3, GENTLEMAN, ALFRED1
	checkflag ENGINE_ALFRED_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime DAY
	iftrue AlfredWantsBattle
	checktime EVE
	iftrue AlfredWantsBattle

.NotTuesday:
	farjump AlfredPokemonBlurb

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_LIGHTHOUSE
	farjump AlfredReminderScript

AlfredPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, GENTLEMAN, ALFRED1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, AlfredWantsBattle

.Generic:
	farjump AlfredNoctowlTrade

AlfredWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_LIGHTHOUSE
	setflag ENGINE_ALFRED_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
