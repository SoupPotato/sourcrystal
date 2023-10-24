KennyPhoneCalleeScript: ; You call Kenny
	gettrainername STRING_BUFFER_3, HIKER, KENNY1
	checkflag ENGINE_KENNY_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime DAY
	iftrue KennyWantsBattle
	checktime EVE
	iftrue KennyWantsBattle

.NotSaturday:
	farjump KennyBaths

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump KennyReminderScript

KennyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, HIKER, KENNY1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .GenericKennyCall
	checktime DAY
	iftrue KennyWantsBattle
	checktime EVE
	iftrue KennyWantsBattle
	jump .GenericKennyCall

.GenericKennyCall:
	farjump Phone_GenericCall_Male

KennyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_KENNY_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male