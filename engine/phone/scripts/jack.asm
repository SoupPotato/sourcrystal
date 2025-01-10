JackPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue JackWantsToBattle

.NotMonday:
	farsjump JackPhoneTipsScript

.WaitingForBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	farsjump JackReminderScript

JackPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JackWantsToBattle

.GenericJackCall:
	farscall PhoneScript_Random4
	ifequal 0, JackFindsRare
	ifequal 1, JackBattleTrivia
	farsjump Phone_GenericCall_Male

JackWantsToBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	setflag ENGINE_JACK_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

JackFindsRare:
	farsjump Phone_CheckIfUnseenRare_Male

JackBattleTrivia:
	farsjump JackTriviaScript
