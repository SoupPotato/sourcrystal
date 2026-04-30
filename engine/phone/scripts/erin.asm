ErinPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	checkflag ENGINE_ERIN_READY_FOR_REMATCH
	iftrue ErinBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue ErinWantsBattle

.NotSaturday:
	farsjump ErinWorkingHardScript

ErinBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_46
	farsjump ErinReminderScript

ErinPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	checkflag ENGINE_ERIN_READY_FOR_REMATCH
	iftrue ErinBattleReminder
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random3
	ifequal 0, ErinWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Female

ErinWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_46
	setflag ENGINE_ERIN_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female
