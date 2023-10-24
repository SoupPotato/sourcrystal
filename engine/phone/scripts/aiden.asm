AidenPhoneCalleeScript: ; You call Aiden
	gettrainername STRING_BUFFER_3, BIKER, AIDEN1
	checkflag ENGINE_AIDEN_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue AidenWantsBattle

.NotMonday:
	farjump AidenTalkOnBike

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	farjump AidenReminderScript

AidenPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIKER, AIDEN1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .GenericAidenCall
	checktime MORN
	iftrue AidenWantsBattle
	jump .GenericAidenCall

.GenericAidenCall:
	farjump Phone_GenericCall_Male

AidenWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	setflag ENGINE_AIDEN_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male