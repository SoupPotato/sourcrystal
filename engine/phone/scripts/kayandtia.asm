KayAndTiaPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, TWINS, KAYANDTIA1
	checkflag ENGINE_KAY_AND_TIA_READY_FOR_REMATCH
	iftrue KayAndTiaBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue KayAndTiaWantsBattle

.NotSaturday:
	farjump KayAndTiaQuizScript

KayAndTiaBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	farjump KayAndTiaReminderScript

KayAndTiaPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, TWINS, KAYANDTIA1
	checkflag ENGINE_KAY_AND_TIA_READY_FOR_REMATCH
	iftrue KayAndTiaBattleReminder
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random2
	ifequal 0, KayAndTiaWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Female

KayAndTiaWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	setflag ENGINE_KAY_AND_TIA_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Female
