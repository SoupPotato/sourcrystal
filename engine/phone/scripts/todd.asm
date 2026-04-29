ToddPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	checkflag ENGINE_TODD_READY_FOR_REMATCH
	iftrue ToddBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .NotSaturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue ToddWantsBattle

.NotSaturday:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleOn
	farsjump ToddNoItemScript

.SaleOn:
	farsjump ToddHurryScript

ToddBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	farsjump ToddReminderScript

ToddPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	checkflag ENGINE_TODD_READY_FOR_REMATCH
	iftrue ToddBattleReminder
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .TryForSale
	farscall PhoneScript_Random2
	ifequal 0, ToddWantsBattle
	farscall PhoneScript_Random3
	ifequal 0, ToddFoundRare
	farsjump Phone_GenericCall_Male

.TryForSale:
	farscall PhoneScript_Random2
	ifequal 0, ToddDeptStoreSale
	farsjump Phone_GenericCall_Male

ToddWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_34
	setflag ENGINE_TODD_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

ToddDeptStoreSale:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farsjump ToddItemScript

ToddFoundRare:
	farjump Phone_CheckIfUnseenRare_Male
