EoinPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, BIKER, EOIN1
	checkflag ENGINE_EOIN_READY_FOR_REMATCH
	iftrue EoinBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime DAY
	iftrue EoinWantsBattle
	checktime EVE
	iftrue EoinWantsBattle

.NotSunday:
	farjump EoinBikerMonsScript

EoinBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	farjump EoinReminderScript

EoinPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIKER, EOIN1
	checkflag ENGINE_EOIN_READY_FOR_REMATCH
	iftrue EoinBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, EoinWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Male

EoinWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	setflag ENGINE_EOIN_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
