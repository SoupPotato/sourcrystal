TimAndSuePhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, COUPLE, TIMANDSUE1
	checkflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	iftrue TimAndSueBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue TimAndSueWantsBattle
	checktime EVE
	iftrue TimAndSueWantsBattle

.NotFriday:
	farjump TimAndSueThatsHowItIsScript

TimAndSueBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	farjump TimAndSueReminderScript

TimAndSuePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, COUPLE, TIMANDSUE1
	checkflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	iftrue TimAndSueBattleReminder
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random2
	ifequal 0, TimAndSueWantsBattle ; 33% chance for a rematch
	farjump Phone_GenericCall_Female

TimAndSueWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_13
	setflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	farjump PhoneScript_WantsToBattle_Female