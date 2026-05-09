AidenPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, BIKER, AIDEN1
	checkflag ENGINE_AIDEN_READY_FOR_REMATCH
	iftrue AidenBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue AidenWantsBattle

.NotMonday:
	farjump AidenTalkOnBikeScript

AidenBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	farjump AidenReminderScript

AidenPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIKER, AIDEN1
	checkflag ENGINE_AIDEN_READY_FOR_REMATCH
	iftrue AidenBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, AidenWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Male

AidenWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	setflag ENGINE_AIDEN_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
