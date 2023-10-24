BillyPhoneCalleeScript: ; You call Billy
	gettrainername STRING_BUFFER_3, SCHOOLBOY, BILLY1
	checkflag ENGINE_BILLY_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime NITE
	iftrue BillyWantsBattle

.NotFriday:
	farjump BillyResearch

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	farjump BillyReminderScript

BillyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, SCHOOLBOY, BILLY1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .GenericBillyCall
	checktime NITE
	iftrue BillyWantsBattle
	jump .GenericBillyCall

.GenericBillyCall:
	farjump Phone_GenericCall_Male

BillyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_15
	setflag ENGINE_BILLY_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male