BethPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue BethBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue BethWantsBattle
	checktime EVE
	iftrue BethWantsBattle

.NotFriday:
	farsjump BethHangUpScript

BethBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_26
	farsjump BethReminderScript

BethPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue BethBattleReminder
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random2
	ifequal 0, BethWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Female

BethWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_26
	setflag ENGINE_BETH_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female
