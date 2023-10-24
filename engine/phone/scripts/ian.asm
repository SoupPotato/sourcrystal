IanPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, IAN1
	checkflag ENGINE_IAN_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue IanWantsBattle

.NotSaturday:
	farjump IanBattleAgainScript

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	farjump IanWantsBattleScript

IanPhoneCallerScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, IAN1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .GenericIanCall
	checktime MORN
	iftrue IanWantsBattle

.GenericIanCall:
	farjump Phone_GenericCall_Male

IanWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	setflag ENGINE_IAN_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male