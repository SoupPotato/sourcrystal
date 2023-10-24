KayAndTiaPhoneCalleeScript: ; You call Kay & Tia
	gettrainername STRING_BUFFER_3, TWINS, KAYANDTIA1
	checkflag ENGINE_KAY_AND_TIA_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue KayAndTiaWantsBattle

.NotSaturday:
	farjump KayAndTiaQuiz

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	farjump KayAndTiaReminderScript

KayAndTiaPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, TWINS, KAYANDTIA1
	farscall PhoneScript_GreetPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .GenericKayAndTiaCall
	checktime NITE
	iftrue KayAndTiaWantsBattle
	jump .GenericKayAndTiaCall

.GenericKayAndTiaCall:
	farjump Phone_GenericCall_Female

KayAndTiaWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	setflag ENGINE_KAY_AND_TIA_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Female