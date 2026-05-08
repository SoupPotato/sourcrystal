TannerPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	checkflag ENGINE_TANNER_READY_FOR_REMATCH
	iftrue TannerBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime NITE
	iftrue TannerWantsBattle

.NotMonday:
	farjump TannerCampingDifferenceScript

TannerBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TannerReminderScript

TannerPhoneCallerScript:  ; Calls you
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	checkflag ENGINE_TANNER_READY_FOR_REMATCH
	iftrue TannerBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, TannerWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

TannerWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_TANNER_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male
