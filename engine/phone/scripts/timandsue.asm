TimAndSuePhoneCalleeScript: ; You call Tim & Sue
	gettrainername STRING_BUFFER_3, COUPLE, TIMANDSUE1
	checkflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue TimAndSueWantsBattle
	checktime EVE
	iftrue TimAndSueWantsBattle

.NotFriday:
	farjump TimAndSueWildMon

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TimAndSueReminderScript

TimAndSuePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, COUPLE, TIMANDSUE1
	farscall PhoneScript_GreetPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .GenericTimAndSueCall
	checktime DAY
	iftrue TimAndSueWantsBattle
	checktime EVE
	iftrue TimAndSueWantsBattle
	jump .GenericTimAndSueCall

.GenericTimAndSueCall:
	farjump Phone_GenericCall_Female

TimAndSueWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Female