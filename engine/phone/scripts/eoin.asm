EoinPhoneCalleeScript: ; You call Eoin
	gettrainername STRING_BUFFER_3, BIKER, EOIN1
	checkflag ENGINE_EOIN_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime DAY
	iftrue EoinWantsBattle
	checktime EVE
	iftrue EoinWantsBattle

.NotSunday:
	farjump EoinBikerMons

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	farjump EoinReminderScript

EoinPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIKER, EOIN1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .GenericEoinCall
	checktime DAY
	iftrue EoinWantsBattle
	checktime EVE
	iftrue EoinWantsBattle
	jump .GenericEoinCall

.GenericEoinCall:
	farjump Phone_GenericCall_Male

EoinWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	setflag ENGINE_EOIN_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
