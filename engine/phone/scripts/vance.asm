VancePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	checkflag ENGINE_VANCE_READY_FOR_REMATCH
	iftrue VanceBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue VanceWantsRematch

.NotWednesday:
	farsjump VanceLookingForwardScript

VanceBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_44
	farsjump VanceReminderScript

VancePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	checkflag ENGINE_VANCE_READY_FOR_REMATCH
	iftrue VanceBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random3
	ifequal 0, VanceWantsRematch ; 33% chance for a rematch
	farsjump Phone_GenericCall_Male

VanceWantsRematch:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_44
	setflag ENGINE_VANCE_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male
