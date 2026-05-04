JosePhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue JoseStarPieceReminder
	checkflag ENGINE_JOSE_READY_FOR_REMATCH
	iftrue JoseBattleReminder
	farscall PhoneScript_AnswerPhone_Male
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue JoseWantsBattle

.NotSaturday:
	checkflag ENGINE_JOSE_GAVE_STAR_PIECE
	iftrue .skipStarPiece
	farscall PhoneScript_Random11 ; 9% chance when you call them
	ifequal 0, JoseHasStarPiece
	setflag ENGINE_JOSE_GAVE_STAR_PIECE
.skipStarPiece
	farsjump JoseHangUpScript

JoseBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_27
	farsjump JoseReminderScript

JoseStarPieceReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_27
	farsjump JoseReminderScript

JosePhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue JoseStarPieceReminder
	checkflag ENGINE_JOSE_READY_FOR_REMATCH
	iftrue JoseBattleReminder
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random3 ; 25% chance when they call you
	ifequal 0, JoseHasStarPiece
	setflag ENGINE_JOSE_GAVE_STAR_PIECE
	farscall PhoneScript_Random2
	ifequal 0, JoseWantsBattle ; 33% chance for a rematch
	farscall PhoneScript_Random3
	ifequal 0, JoseFoundRare
	farsjump Phone_GenericCall_Male

JoseWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_27
	setflag ENGINE_JOSE_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

JoseFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

JoseHasStarPiece:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_27
	farsjump PhoneScript_FoundItem_Male
