AlfredPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, GENTLEMAN, ALFRED1
	checkflag ENGINE_ALFRED_READY_FOR_REMATCH
	iftrue AlfredBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime DAY
	iftrue AlfredWantsBattle
	checktime EVE
	iftrue AlfredWantsBattle

.NotTuesday:
	farjump AlfredExtraordinaryBeingsScript

AlfredBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_LIGHTHOUSE
	farjump AlfredReminderScript

AlfredPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, GENTLEMAN, ALFRED1
	checkflag ENGINE_ALFRED_READY_FOR_REMATCH
	iftrue AlfredBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, AlfredWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Male

AlfredWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_LIGHTHOUSE
	setflag ENGINE_ALFRED_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
