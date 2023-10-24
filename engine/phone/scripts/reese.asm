ReesePhoneCalleeScript: ; You call Reese
	gettrainername STRING_BUFFER_3, BIKER, REESE1
	checkflag ENGINE_REESE_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue ReeseWantsBattle

.NotSunday:
	farjump ReeseBikers

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	farjump ReeseReminderScript

ReesePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIKER, REESE1
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .GenericReeseCall
	checktime NITE
	iftrue ReeseWantsBattle
	jump .GenericReeseCall

.GenericReeseCall:
	farjump Phone_GenericCall_Male

ReeseWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_17
	setflag ENGINE_REESE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Male