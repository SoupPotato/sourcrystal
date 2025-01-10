KrisePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, LASS, KRISE1
	checkflag ENGINE_KRISE_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime MORN
	iftrue KriseWantsToBattle

.NotSunday:
	farjump KriseMiniSkirt

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	farjump KriseReminderScript

KrisePhoneCallerScript:
	gettrainername STRING_BUFFER_3, LASS, KRISE1
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random2
	ifequal 0, KriseWantsToBattle

.GenericKriseCall:
	farscall PhoneScript_Random3
	ifequal 0, KriseFoundRare
	farjump Phone_GenericCall_Female

KriseWantsToBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	setflag ENGINE_KRISE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Female

KriseFoundRare:
	farjump Phone_CheckIfUnseenRare_Female
