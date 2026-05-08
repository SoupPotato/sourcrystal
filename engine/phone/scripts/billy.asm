BillyPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, SCHOOLBOY, BILLY1
	checkflag ENGINE_BILLY_READY_FOR_REMATCH
	iftrue BillyBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime NITE
	iftrue BillyWantsBattle

.NotFriday:
	farjump BillyResearchScript

BillyBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	farjump BillyReminderScript

BillyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, SCHOOLBOY, BILLY1
	checkflag ENGINE_BILLY_READY_FOR_REMATCH
	iftrue BillyBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, BillyWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Male

BillyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	setflag ENGINE_BILLY_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
