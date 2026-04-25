KylerPhoneCalleeScript: ; You call Kyler
	gettrainername STRING_BUFFER_3, FISHER, KYLER1
	checkflag ENGINE_KYLER_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotWednesday
	checktime DAY
	iftrue KylerWantsBattle
	checktime EVE
	iftrue KylerWantsBattle

.NotWednesday:
	farjump KylerFishingTips

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_12
	farjump KylerReminderScript

KylerPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, FISHER, KYLER1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .GenericKylerCall
	checktime DAY
	iftrue KylerWantsBattle
	checktime EVE
	iftrue KylerWantsBattle
	jump .GenericKylerCall

.GenericKylerCall:
	farjump Phone_GenericCall_Male

KylerWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_12
	setflag ENGINE_KYLER_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male