BrentPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftrue BrentBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue BrentWantsBattle

.NotMonday:
	farsjump BrentHangUpScript

BrentBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump BrentReminderScript

BrentPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftrue BrentBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, BrentWantsBattle ; 33% chance for a rematch
	farscall PhoneScript_Random2
	ifequal 0, BrentBillTrivia
	farsjump Phone_GenericCall_Male

BrentWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	setflag ENGINE_BRENT_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farsjump BrentBillTriviaScript
