ChadPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftrue ChadBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime MORN
	iftrue ChadWantsBattle

.NotFriday:
	farsjump ChadHangUpScript

ChadBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_38
	farsjump ChadReminderScript

ChadPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftrue ChadBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, ChadWantsBattle ; 33% chance for a rematch
	farscall PhoneScript_Random2
	ifequal 0, ChadOakGossip
	farscall PhoneScript_Random3
	ifequal 0, ChadFoundRare
	farsjump Phone_GenericCall_Male

ChadWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_38
	setflag ENGINE_CHAD_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

ChadFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ChadOakGossip:
	farsjump ChadOakGossipScript
