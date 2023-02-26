UnusedPhoneScript:
	farwritetext UnusedPhoneText
	end

; Mom

MomPhoneScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .bcec5
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MomPhoneNoPokedexScript
	jump MomPhoneNoPokemonScript

.bcec5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	farwritetext MomPhoneGreetingText
	buttonsound
	mapnametotext MEM_BUFFER_0
	checkcode VAR_ROOFPALETTE
	ifequal 1, MomPhonePalette1
	ifequal 2, MomPhonePalette2
	jump MomPhoneOther

MomPhoneLandmark:
	farwritetext MomPhoneLandmarkText
	buttonsound
	jump MomSavingMoney

MomPhonePalette1:
	checkcode VAR_MAPGROUP
	ifequal GROUP_NEW_BARK_TOWN, .newbark
	ifequal GROUP_CHERRYGROVE_CITY, .cherrygrove
	ifequal GROUP_VIOLET_CITY, .violet
	ifequal GROUP_AZALEA_TOWN, .azalea
	ifequal GROUP_GOLDENROD_CITY, .goldenrod
	farwritetext MomPhoneGenericAreaText
	buttonsound
	jump MomSavingMoney

.newbark
	farwritetext MomPhoneNewBarkText
	buttonsound
	jump MomSavingMoney

.cherrygrove
	farwritetext MomPhoneCherrygroveText
	buttonsound
	jump MomSavingMoney

.violet
	landmarktotext SPROUT_TOWER, MEM_BUFFER_1
	jump MomPhoneLandmark
.azalea
	landmarktotext SLOWPOKE_WELL, MEM_BUFFER_1
	jump MomPhoneLandmark
.goldenrod
	landmarktotext RADIO_TOWER, MEM_BUFFER_1
	jump MomPhoneLandmark

MomPhonePalette2:
	farwritetext MomOtherAreaText
	buttonsound
	jump MomSavingMoney

MomPhoneOther:
	farwritetext MomDeterminedText
	buttonsound
	jump MomSavingMoney

MomSavingMoney:
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	jump .SavingNoMoney

.NotSaving:
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	jump .NoMoney

.SavingHasMoney:
	readmoney MOMS_MONEY, MEM_BUFFER_0
	farwritetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.SavingNoMoney:
	farwritetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.NoMoney:
	farwritetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.HasMoney:
	readmoney MOMS_MONEY, MEM_BUFFER_0
	farwritetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomOKIllSaveText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomPhoneWontSaveMoneyText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneHangUpScript:
	farwritetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript:
	farwritetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript:
	farwritetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript:
	farwritetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_MOM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	farwritetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

; Bill

BillPhoneScript1:
	checktime DAY | EVE
	iftrue .daygreet
	checktime NITE
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	buttonsound
	jump .main

.daygreet
	farwritetext BillPhoneDayGreetingText
	buttonsound
	jump .main

.nitegreet
	farwritetext BillPhoneNiteGreetingText
	buttonsound
	jump .main

.main
	farwritetext BillPhoneGenericText
	buttonsound
	checkcode VAR_BOXSPACE
	vartomem MEM_BUFFER_0
	ifequal 0, .full
	ifless PARTY_LENGTH, .nearlyfull
	farwritetext BillPhoneNotFullText
	end

.nearlyfull
	farwritetext BillPhoneNearlyFullText
	end

.full
	farwritetext BillPhoneFullText
	end

BillPhoneScript2:
	farwritetext BillPhoneNewlyFullText
	waitbutton
	end

; Elm

ElmPhoneScript1:
	checkcode VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue .discovery
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse .next
	checkevent EVENT_TOGEPI_HATCHED
	iftrue .egghatched
.next
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .eggunhatched
	checkevent EVENT_ELMS_AIDE_IN_LAB
	iftrue .assistant
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .checkingegg
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .stolen
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue .sawmrpokemon
	farwritetext ElmPhoneStartText
	end

.sawmrpokemon
	farwritetext ElmPhoneSawMrPokemonText
	end

.stolen
	farwritetext ElmPhonePokemonStolenText
	end

.checkingegg
	farwritetext ElmPhoneCheckingEggText
	end

.assistant
	farwritetext ElmPhoneAssistantText
	end

.eggunhatched
	farwritetext ElmPhoneEggUnhatchedText
	end

.egghatched
	farwritetext ElmPhoneEggHatchedText
	setevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery
	random 2
	ifequal 0, .nextdiscovery
	farwritetext ElmPhoneDiscovery1Text
	end

.nextdiscovery
	farwritetext ElmPhoneDiscovery2Text
	end

.pokerus
	farwritetext ElmPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

ElmPhoneScript2:
	checkcode VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_ROBBED, .disaster
	ifequal SPECIALCALL_ASSISTANT, .assistant
	ifequal SPECIALCALL_WEIRDBROADCAST, .rocket
	ifequal SPECIALCALL_SSTICKET, .gift
	ifequal SPECIALCALL_MASTERBALL, .gift
	farwritetext ElmPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

.disaster
	farwritetext ElmPhoneDisasterText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant
	farwritetext ElmPhoneEggAssistantText
	specialphonecall SPECIALCALL_NONE
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket
	farwritetext ElmPhoneRocketText
	specialphonecall SPECIALCALL_NONE
	end

.gift
	farwritetext ElmPhoneGiftText
	specialphonecall SPECIALCALL_NONE
	end

.unused
	farwritetext ElmPhoneUnusedText
	specialphonecall SPECIALCALL_NONE
	end

; Jack

JackPhoneScript1:
	trainertotext SCHOOLBOY, JACK1, MEM_BUFFER_0
	checkflag ENGINE_JACK
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue JackWantsToBattle

.NotMonday:
	farjump JackPhoneTips

.WantsBattle:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump JackWantsBattleScript

JackPhoneScript2:
	trainertotext SCHOOLBOY, JACK1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JackBattleTrivia
	checkflag ENGINE_JACK
	iftrue .WaitingForBattle
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .WaitingForBattle
	checktime MORN
	iftrue JackWantsToBattle

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, JackFindsRare
	farjump Phone_GenericCall_Male

JackWantsToBattle:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	setflag ENGINE_JACK
	farjump PhoneScript_WantsToBattle_Male

JackFindsRare:
	farjump Phone_CheckIfUnseenRare_Male

JackBattleTrivia:
	farjump JackTriviaScript

; Beverly

BeverlyPhoneScript1:
	trainertotext POKEFANF, BEVERLY1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget

.CheckNugget1
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	checkflag ENGINE_BEVERLY_GAVE_NUGGET
	iftrue .Generic
	farscall PhoneScript_Random4
	ifequal 0, BeverlyHasNugget
	setflag ENGINE_BEVERLY_GAVE_NUGGET

.Generic:
	farjump UnknownScript_0xa0900

.HasNugget:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump UnknownScript_0xa0aa5

BeverlyPhoneScript2:
	trainertotext POKEFANF, BEVERLY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	jump CheckNugget2

.HasNugget:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump UnknownScript_0xa0aa5

CheckNugget2:
	checkflag ENGINE_GINA_GAVE_LEAF_STONE
	iftrue GenericBeverlyCall
	farscall PhoneScript_Random4
	ifequal 0, BeverlyHasNugget
	setflag ENGINE_GINA_GAVE_LEAF_STONE
	jump GenericBeverlyCall

BeverlyHasNugget:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

GenericBeverlyCall:
	farjump Phone_GenericCall_Female

; Huey

HueyPhoneScript1:
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	checkflag ENGINE_HUEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue HueyWantsBattle

.NotWednesday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0908

.WantsBattle:
	landmarktotext LIGHTHOUSE, MEM_BUFFER_2
	farjump HueyWantsBattleScript

HueyPhoneScript2:
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .Flavor
	checktime NITE
	iftrue HueyWantsBattle

.Flavor:
	farjump PhoneScript_MonFlavorText

HueyWantsBattle:
	landmarktotext LIGHTHOUSE, MEM_BUFFER_2
	setflag ENGINE_HUEY
	farjump PhoneScript_WantsToBattle_Male

; Gaven

GavenPhoneScript1:
	trainertotext COOLTRAINERM, GAVEN3, MEM_BUFFER_0
	checkflag ENGINE_GAVEN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue GavenWantsRematch

.NotThursday:
	farjump UnknownScript_0xa0910

.WantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	farjump UnknownScript_0xa0a37

GavenPhoneScript2:
	trainertotext COOLTRAINERM, GAVEN3, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .WaitingForBattle
	checktime MORN
	iftrue GavenWantsRematch

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, GavenFoundRare
	farjump Phone_GenericCall_Male

GavenWantsRematch:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	setflag ENGINE_GAVEN
	farjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

; Beth

BethPhoneScript1:
	trainertotext COOLTRAINERF, BETH1, MEM_BUFFER_0
	checkflag ENGINE_BETH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue BethWantsBattle
	checktime EVE
	iftrue BethWantsBattle

.NotFriday:
	farjump UnknownScript_0xa0918

.WantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	farjump BethBattleReminderScript

BethPhoneScript2:
	trainertotext COOLTRAINERF, BETH1, MEM_BUFFER_0
	checkflag ENGINE_BETH
	iftrue .Generic
	farscall PhoneScript_GreetPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .Generic
	checktime DAY
	iftrue BethWantsBattle
	checktime EVE
	iftrue BethWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

BethWantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	setflag ENGINE_BETH
	farjump PhoneScript_WantsToBattle_Female

; Jose

JosePhoneScript1:
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	checkflag ENGINE_JOSE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasStarPiece
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .CheckStarPieceNotSaturday1
	checktime NITE
	iftrue CheckStarPiece

.CheckStarPieceNotSaturday1:
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasStarPiece
	checkflag ENGINE_JOSE_GAVE_STAR_PIECE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, JoseHasStarPiece
	setflag ENGINE_JOSE_GAVE_STAR_PIECE

.Generic:
	farjump UnknownScript_0xa0920

.WantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a41

.HasStarPiece:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a41

JosePhoneScript2:
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasStarPiece
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, CheckStarPieceNotSaturday2
	checktime NITE
	iftrue CheckStarPiece
	jump CheckStarPieceNotSaturday2

.HasStarPiece:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

CheckStarPieceNotSaturday2:
	checkevent ENGINE_JOSE_GAVE_STAR_PIECE
	iftrue GenericJoseCall
	farscall PhoneScript_Random11
	ifequal 0, JoseHasStarPiece
	setflag ENGINE_JOSE_GAVE_STAR_PIECE
	jump GenericJoseCall

CheckStarPiece:
	checkevent ENGINE_JOSE_GAVE_STAR_PIECE
	iftrue JoseWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, JoseHasStarPiece
	setflag ENGINE_JOSE_GAVE_STAR_PIECE

JoseWantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	setflag ENGINE_JOSE
	farjump PhoneScript_WantsToBattle_Male

JoseHasStarPiece:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

GenericJoseCall:
	farscall PhoneScript_Random3
	ifequal 0, JoseFoundRare
	farjump Phone_GenericCall_Male

JoseFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

; Reena

ReenaPhoneScript1:
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	checkflag ENGINE_REENA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime MORN
	iftrue ReenaWantsBattle

.NotSunday:
	farjump UnknownScript_0xa0928

.WantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a46

ReenaPhoneScript2:
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_REENA
	iftrue .Generic
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .Generic
	checktime MORN
	iftrue ReenaWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

ReenaWantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	setflag ENGINE_REENA
	farjump PhoneScript_WantsToBattle_Female

; Joey

JoeyPhoneScript1:
	trainertotext YOUNGSTER, JOEY1, MEM_BUFFER_0
	checkflag ENGINE_JOEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue JoeyWantsBattle
	checktime EVE
	iftrue JoeyWantsBattle

.NotMonday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0930

.WantsBattle:
	landmarktotext ROUTE_30, MEM_BUFFER_2
	farjump UnknownScript_0xa0a4b

JoeyPhoneScript2:
	trainertotext YOUNGSTER, JOEY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .Generic
	checktime DAY
	iftrue JoeyWantsBattle
	checktime EVE
	iftrue JoeyWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

JoeyWantsBattle:
	landmarktotext ROUTE_30, MEM_BUFFER_2
	setflag ENGINE_JOEY
	farjump PhoneScript_WantsToBattle_Male

; Wade

WadePhoneScript1:
	trainertotext BUG_CATCHER, WADE1, MEM_BUFFER_0
	checkflag ENGINE_WADE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime NITE
	iftrue WadeWantsBattle2

.NotTuesday:
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farjump UnknownScript_0xa0938

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.WantsBattle:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	farjump UnknownScript_0xa0a50

.HasItem:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	farjump UnknownScript_0xa0ab5

WadePhoneScript2:
	trainertotext BUG_CATCHER, WADE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .next
	farscall PhoneScript_Random2
	ifequal 0, WadeHasItem2
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .next
	checktime NITE
	iftrue WadeWantsBattle2

.next:
	farscall PhoneScript_Random3
	ifequal 0, WadeFoundRare
	farjump Phone_GenericCall_Male

.ContestToday:
	farjump PhoneScript_BugCatchingContest

WadeWantsBattle2:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	setflag ENGINE_WADE
	farjump PhoneScript_WantsToBattle_Male

WadeFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

WadeHasItem2:
	setflag ENGINE_WADE_HAS_ITEM
	landmarktotext ROUTE_31, MEM_BUFFER_2
	clearevent EVENT_WADE_HAS_BERRY
	clearevent EVENT_WADE_HAS_PSNCUREBERRY
	clearevent EVENT_WADE_HAS_PRZCUREBERRY
	clearevent EVENT_WADE_HAS_BITTER_BERRY
	random 4
	ifequal 0, .Berry
	ifequal 1, .PsnCureBerry
	ifequal 2, .PrzCureBerry
	ifequal 3, .Bitterberry

.Berry:
	setevent EVENT_WADE_HAS_BERRY
	jump .FoundBerry

.PsnCureBerry:
	setevent EVENT_WADE_HAS_PSNCUREBERRY
	jump .FoundBerry

.PrzCureBerry:
	setevent EVENT_WADE_HAS_PRZCUREBERRY
	jump .FoundBerry

.Bitterberry:
	setevent EVENT_WADE_HAS_BITTER_BERRY

.FoundBerry:
	farjump PhoneScript_FoundItem_Male

; Ralph

RalphPhoneScript1:
	trainertotext FISHER, RALPH1, MEM_BUFFER_0
	checkflag ENGINE_RALPH
	iftrue .Rematch
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime MORN
	iftrue Ralph_FightMe

.NotWednesday
	farjump UnknownScript_0xa0940

.Rematch:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0a55

RalphPhoneScript2:
	trainertotext FISHER, RALPH1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .Generic
	checktime MORN
	iftrue Ralph_FightMe

.Generic:
	farjump Phone_GenericCall_Male

Ralph_FightMe:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	setflag ENGINE_RALPH
	farjump PhoneScript_WantsToBattle_Male

; Liz

LizPhoneScript1:
	trainertotext PICNICKER, LIZ1, MEM_BUFFER_0
	checkflag ENGINE_LIZ
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime DAY
	iftrue LizWantsBattle
	checktime EVE
	iftrue LizWantsBattle

.NotThursday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0948

.WantsBattle:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0a5a

LizPhoneScript2:
	trainertotext PICNICKER, LIZ1, MEM_BUFFER_0
	farscall PhoneScript_Random4
	ifequal 0, LizWrongNumber
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_LIZ
	iftrue .next
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .next
	checktime DAY
	iftrue LizWantsBattle
	checktime EVE
	iftrue LizWantsBattle

.next:
	farscall PhoneScript_Random2
	ifequal 0, LizGossip

.Generic:
	farjump Phone_GenericCall_Female

LizWantsBattle:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	setflag ENGINE_LIZ
	farjump PhoneScript_WantsToBattle_Female

LizWrongNumber:
	farjump LizWrongNumberScript

LizGossip:
	random 9
	ifequal 0, .CoolTrainerM
	ifequal 1, .Beauty
	ifequal 2, .Grunt
	ifequal 3, .Teacher
	ifequal 4, .SwimmerF
	ifequal 5, .KimonoGirl
	ifequal 6, .Skier
	ifequal 7, .Medium
	ifequal 8, .PokefanM

.CoolTrainerM:
	trainerclassname COOLTRAINERM, NICK
	jump LizGossipScript

.Beauty:
	trainerclassname BEAUTY, VICTORIA
	jump LizGossipScript

.Grunt:
	trainerclassname GRUNTM, GRUNTM_1
	jump LizGossipScript

.Teacher:
	trainerclassname TEACHER, COLETTE
	jump LizGossipScript

.SwimmerF:
	trainerclassname SWIMMERF, ELAINE
	jump LizGossipScript

.KimonoGirl:
	trainerclassname KIMONO_GIRL, NAOKO
	jump LizGossipScript

.Skier:
	trainerclassname SKIER, ROXANNE
	jump LizGossipScript

.Medium:
	trainerclassname MEDIUM, MARTHA
	jump LizGossipScript

.PokefanM:
	trainerclassname POKEFANM, WILLIAM
	jump LizGossipScript

LizGossipScript:
	farjump UnknownScript_0xa06da

; Anthony

AnthonyPhoneScript1:
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	checkflag ENGINE_ANTHONY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime NITE
	iftrue AnthonyWantsBattle

.NotFriday
	farjump UnknownScript_0xa0950

.WantsBattle:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	farjump UnknownScript_0xa0a5f

AnthonyPhoneScript2:
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .Generic
	checktime NITE
	iftrue AnthonyWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

AnthonyWantsBattle:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	setflag ENGINE_ANTHONY
	farjump PhoneScript_WantsToBattle_Male

; Todd

ToddPhoneScript1:
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	checkflag ENGINE_TODD
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue ToddWantsBattle

.NotSaturday:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleOn
	farjump UnknownScript_0xa0958

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0a64

.SaleOn:
	farjump UnknownScript_0xa0b04

ToddPhoneScript2:
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TODD
	iftrue .TryForSale
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .TryForSale
	checktime MORN
	iftrue ToddWantsBattle

.TryForSale:
	farscall PhoneScript_Random2
	ifequal 0, ToddDeptStoreSale
	farscall PhoneScript_Random3
	ifequal 0, ToddFoundRare
	farjump Phone_GenericCall_Male

ToddWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_TODD
	farjump PhoneScript_WantsToBattle_Male

ToddFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ToddDeptStoreSale:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farjump UnknownScript_0xa0644

; Gina

GinaPhoneScript1:
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	checkflag ENGINE_GINA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .HasLeafStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .CheckLeafStoneNotSunday1
	checktime DAY
	iftrue CheckLeafStone
	checktime EVE
	iftrue CheckLeafStone

.CheckLeafStoneNotSunday1:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .HasLeafStone
	checkflag ENGINE_GINA_GAVE_LEAF_STONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, GinaHasLeafStone
	setflag ENGINE_GINA_GAVE_LEAF_STONE

.Generic:
	farjump UnknownScript_0xa0960

.Rockets:
	farjump UnknownScript_0xa05c6

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0a69

.HasLeafStone:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0abd

GinaPhoneScript2:
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRockets
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .HasLeafStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, CheckLeafStoneNotSunday2
	checktime DAY
	iftrue CheckLeafStone
	checktime EVE
	iftrue CheckLeafStone
	jump CheckLeafStoneNotSunday2

.HasLeafStone:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0abd

CheckLeafStoneNotSunday2:
	checkflag ENGINE_GINA_GAVE_LEAF_STONE
	iftrue GenericGinaCall
	farscall PhoneScript_Random11
	ifequal 0, GinaHasLeafStone
	setflag ENGINE_GINA_GAVE_LEAF_STONE
	jump GenericGinaCall

CheckLeafStone:
	checkflag ENGINE_GINA_GAVE_LEAF_STONE
	iftrue GinaWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, GinaHasLeafStone
	setflag ENGINE_GINA_GAVE_LEAF_STONE

GinaWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_GINA
	farjump PhoneScript_WantsToBattle_Female

GinaRockets:
	farjump UnknownScript_0xa05c6

GinaHasLeafStone:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

GenericGinaCall:
	farjump Phone_GenericCall_Female

; Ian

IanPhoneScript1:
	trainertotext YOUNGSTER, IAN1, MEM_BUFFER_0
	checkflag ENGINE_IAN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue IanWantsBattle

.NotSaturday:
	farjump UnknownScript_0xa0918

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump IanBattleReminderScript

IanPhoneScript2:
	trainertotext YOUNGSTER, IAN1, MEM_BUFFER_0
	checkflag ENGINE_IAN
	iftrue .Generic
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .Generic
	checktime MORN
	iftrue IanWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

IanWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_IAN
	farjump PhoneScript_WantsToBattle_Male

; Irwin

IrwinPhoneScript1:
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa09c8

.Rockets:
	farjump IrwinRocketRumor

IrwinPhoneScript2:
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump IrwinRumorScript

.Rockets:
	farjump IrwinRocketRumor

; Walt

WaltPhoneScript1:
	trainertotext FIREBREATHER, WALT1, MEM_BUFFER_0
	checkflag ENGINE_WALT
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue WaltWantsBattle
	checktime EVE
	iftrue WaltWantsBattle

.NotMonday:
	farjump UnknownScript_0xa0918

.WantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump WaltBattleReminderScript

WaltPhoneScript2:
	trainertotext FIREBREATHER, WALT1, MEM_BUFFER_0
	checkflag ENGINE_WALT
	iftrue .Generic
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .Generic
	checktime DAY
	iftrue WaltWantsBattle
	checktime EVE
	iftrue WaltWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

WaltWantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	setflag ENGINE_WALT
	farjump PhoneScript_WantsToBattle_Male

; Arnie

ArniePhoneScript1:
	trainertotext BUG_CATCHER, ARNIE1, MEM_BUFFER_0
	checkflag ENGINE_ARNIE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime MORN
	iftrue ArnieWantsBattle

.NotTuesday
	farjump UnknownScript_0xa0968

.WantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa0a6e

ArniePhoneScript2:
	trainertotext BUG_CATCHER, ARNIE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, ArnieFoundRare
	checktime MORN
	iftrue ArnieWantsBattle

ArnieFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ArnieWantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	setflag ENGINE_ARNIE
	farjump PhoneScript_WantsToBattle_Male

; Alan

AlanPhoneScript1:
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	checkflag ENGINE_ALAN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .HasFireStone
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .CheckFireStoneNotWednesday1
	checktime DAY
	iftrue AlanWantsBattle
	checktime EVE
	iftrue AlanWantsBattle

.CheckFireStoneNotWednesday1:
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .HasFireStone
	checkflag ENGINE_ALAN_GAVE_FIRE_STONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, AlanHasFireStone
	setflag ENGINE_ALAN_GAVE_FIRE_STONE

.Generic:
	farjump UnknownScript_0xa0970

.WantsBattle:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0a73

.HasFireStone:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0ac5

AlanPhoneScript2:
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .HasFireStone
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, CheckFireStoneNotWednesday2
	checktime DAY
	iftrue CheckFireStone
	checktime EVE
	iftrue CheckFireStone
	jump CheckFireStoneNotWednesday2

.HasFireStone:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0ac5

CheckFireStoneNotWednesday2:
	checkflag ENGINE_ALAN_GAVE_FIRE_STONE
	iftrue GenericAlanCall
	farscall PhoneScript_Random11
	ifequal 0, AlanHasFireStone
	setflag ENGINE_ALAN_GAVE_FIRE_STONE
	jump GenericAlanCall

CheckFireStone:
	checkflag ENGINE_ALAN_GAVE_FIRE_STONE
	iftrue AlanWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, AlanHasFireStone
	setflag ENGINE_ALAN_GAVE_FIRE_STONE

AlanWantsBattle:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	setflag ENGINE_ALAN
	farjump PhoneScript_WantsToBattle_Male

AlanHasFireStone:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

GenericAlanCall:
	farjump Phone_GenericCall_Male

; Dana

DanaPhoneScript1:
	trainertotext LASS, DANA1, MEM_BUFFER_0
	checkflag ENGINE_DANA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .HasThunderstone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .CheckThunderstoneNotThursday1
	checktime NITE
	iftrue CheckThunderstone

.CheckThunderstoneNotThursday1:
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .HasThunderstone
	checkflag ENGINE_DANA_GAVE_THUNDERSTONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, GinaHasLeafStone
	setflag ENGINE_DANA_GAVE_THUNDERSTONE

.Generic:
	farjump UnknownScript_0xa0978

.WantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0a78

.HasThunderstone:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0acd

DanaPhoneScript2:
	trainertotext LASS, DANA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .HasThunderstone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, CheckThunderstoneNotThursday2
	checktime NITE
	iftrue CheckThunderstone
	jump CheckThunderstoneNotThursday2

.HasThunderstone:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

CheckThunderstoneNotThursday2:
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftrue GenericDanaCall
	farscall PhoneScript_Random11
	ifequal 0, DanaHasThunderstone
	setflag EVENT_DANA_GAVE_THUNDERSTONE
	jump GenericDanaCall

CheckThunderstone:
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftrue DanaWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, DanaHasThunderstone
	setflag EVENT_DANA_GAVE_THUNDERSTONE

DanaWantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	setflag ENGINE_DANA
	farjump PhoneScript_WantsToBattle_Female

DanaHasThunderstone:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

GenericDanaCall:
	farscall PhoneScript_Random3
	ifequal 0, DanaFoundRare
	farjump Phone_GenericCall_Female

DanaFoundRare:
	farjump Phone_CheckIfUnseenRare_Female

; Chad

ChadPhoneScript1:
	trainertotext SCHOOLBOY, CHAD1, MEM_BUFFER_0
	checkflag ENGINE_CHAD
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime MORN
	iftrue ChadWantsBattle

.NotFriday:
	farjump UnknownScript_0xa0980

.WantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0a7d

ChadPhoneScript2:
	trainertotext SCHOOLBOY, CHAD1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .Generic
	checktime MORN
	iftrue ChadWantsBattle

.Generic:
	farscall PhoneScript_Random2
	ifequal 0, ChadOakGossip
	farscall PhoneScript_Random3
	ifequal 0, ChadFoundRare
	farjump Phone_GenericCall_Male

ChadWantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	setflag ENGINE_CHAD
	farjump PhoneScript_WantsToBattle_Male

ChadFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ChadOakGossip:
	farjump ChadOakGossipScript

DerekPhoneScript1:
	trainertotext POKEFANM, DEREK1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .CheckNugget1
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.CheckNugget1
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkflag ENGINE_DEREK_GAVE_NUGGET
	iftrue .Generic
	farscall PhoneScript_Random4
	ifequal 0, DerekHasNugget
	setflag ENGINE_DEREK_GAVE_NUGGET

.Generic:
	farjump UnknownScript_0xa0988

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.HasNugget:
	landmarktotext ROUTE_39, MEM_BUFFER_2
	farjump UnknownScript_0xa0ad5

DerekPhoneScript2:
	trainertotext POKEFANM, DEREK1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .CheckNugget2
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.CheckNugget2:
	checkflag ENGINE_GINA_GAVE_LEAF_STONE
	iftrue GenericDerekCall
	farscall PhoneScript_Random4
	ifequal 0, DerekHasNugget
	setflag ENGINE_DEREK_GAVE_NUGGET
	jump GenericDerekCall

.ContestToday:
	farjump PhoneScript_BugCatchingContest

DerekHasNugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	landmarktotext ROUTE_39, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

GenericDerekCall:
	farjump Phone_GenericCall_Male

TullyPhoneScript1:
	trainertotext FISHER, TULLY1, MEM_BUFFER_0
	checkflag ENGINE_TULLY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .HasWaterStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .CheckWaterStoneNotSunday1
	checktime NITE
	iftrue CheckWaterStone

.CheckWaterStoneNotSunday1:
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .HasWaterStone
	checkflag ENGINE_TULLY_GAVE_WATER_STONE
	iftrue .Generic
	farscall PhoneScript_Random11
	ifequal 0, TullyHasWaterStone
	setflag ENGINE_TULLY_GAVE_WATER_STONE

.Generic:
	farjump UnknownScript_0xa0990

.WantsBattle:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0a82

.HasWaterStone:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0add

TullyPhoneScript2:
	trainertotext FISHER, TULLY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .HasWaterStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, CheckWaterStoneNotSunday2
	checktime NITE
	iftrue CheckWaterStone
	jump CheckWaterStoneNotSunday2

.HasWaterStone:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0add

CheckWaterStoneNotSunday2:
	checkflag ENGINE_TULLY_GAVE_WATER_STONE
	iftrue GenericTullyCall
	farscall PhoneScript_Random11
	ifequal 0, TullyHasWaterStone
	setflag ENGINE_TULLY_GAVE_WATER_STONE
	jump GenericTullyCall

CheckWaterStone:
	checkevent EVENT_TULLY_GAVE_WATER_STONE
	iftrue TullyWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, TullyHasWaterStone
	setflag EVENT_TULLY_GAVE_WATER_STONE

TullyWantsBattle:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	setflag ENGINE_TULLY
	farjump PhoneScript_WantsToBattle_Male

TullyHasWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

GenericTullyCall:
	farjump Phone_GenericCall_Male

BrentPhoneScript1:
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	checkflag ENGINE_BRENT
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue BrentWantsBattle

.NotMonday:
	farjump UnknownScript_0xa0998

.WantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0a87

BrentPhoneScript2:
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, BrentBillTrivia
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .Generic
	checktime MORN
	iftrue BrentWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

BrentWantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	setflag ENGINE_BRENT
	farjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farjump BrentBillTriviaScript

TiffanyPhoneScript1:
	trainertotext PICNICKER, TIFFANY3, MEM_BUFFER_0
	checkflag ENGINE_TIFFANY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_TIFFANY_HAS_SILK_SCARF
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime DAY
	iftrue TiffanyWantsBattle

.NotTuesday:
	farjump UnknownScript_0xa09a0

.WantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0a8c

.HasItem:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0ae5

TiffanyPhoneScript2:
	trainertotext PICNICKER, TIFFANY3, MEM_BUFFER_0
	farscall PhoneScript_Random4
	ifequal 0, TiffanysFamilyMembers
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_TIFFANY_HAS_SILK_SCARF
	iftrue .Generic
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .Generic
	checktime DAY
	iftrue .CheckSilkScarf

.Generic:
	farjump Phone_GenericCall_Female

.CheckSilkScarf:
	checkevent EVENT_TIFFANY_GAVE_SILK_SCARF
	iftrue TiffanyWantsBattle
	farscall PhoneScript_Random11
	ifequal 0, TiffanyHasSilkScarf
	setflag EVENT_TIFFANY_GAVE_SILK_SCARF

TiffanyWantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	setflag ENGINE_TIFFANY
	farjump PhoneScript_WantsToBattle_Female

TiffanysFamilyMembers:
	random 6
	ifequal 0, .Grandma
	ifequal 1, .Grandpa
	ifequal 2, .Mom
	ifequal 3, .Dad
	ifequal 4, .Sister
	ifequal 5, .Brother

.Grandma:
	stringtotext GrandmaString, MEM_BUFFER_1
	jump .PoorClefairy

.Grandpa:
	stringtotext GrandpaString, MEM_BUFFER_1
	jump .PoorClefairy

.Mom:
	stringtotext MomString, MEM_BUFFER_1
	jump .PoorClefairy

.Dad:
	stringtotext DadString, MEM_BUFFER_1
	jump .PoorClefairy

.Sister:
	stringtotext SisterString, MEM_BUFFER_1
	jump .PoorClefairy

.Brother:
	stringtotext BrotherString, MEM_BUFFER_1
	jump .PoorClefairy

.PoorClefairy:
	farjump TiffanyItsAwful

TiffanyHasSilkScarf:
	setflag ENGINE_TIFFANY_HAS_SILK_SCARF
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

; Vance

VancePhoneScript1:
	trainertotext BIRD_KEEPER, VANCE1, MEM_BUFFER_0
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue VanceWantsRematch

.NotWednesday:
	farjump VanceLookingForward

.WantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump VanceHurryHurry

VancePhoneScript2:
	trainertotext BIRD_KEEPER, VANCE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .Generic
	checktime NITE
	iftrue VanceWantsRematch

.Generic:
	farjump Phone_GenericCall_Male

VanceWantsRematch:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	setflag ENGINE_VANCE
	farjump PhoneScript_WantsToBattle_Male

WiltonPhoneScript1:
	trainertotext FISHER, WILTON1, MEM_BUFFER_0
	checkflag ENGINE_WILTON
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue WiltonWantsBattle

.NotThursday:
	farjump WiltonHaventFoundAnything

.WantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump WiltonNotBiting

WiltonPhoneScript2:
	trainertotext FISHER, WILTON1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .Generic
	checktime MORN
	iftrue WiltonWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

WiltonWantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	setflag ENGINE_WILTON
	farjump PhoneScript_WantsToBattle_Male

; Kenji

KenjiPhoneScript1:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	farjump KenjiAnswerPhoneScript

KenjiPhoneScript2:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farjump KenjiCallingPhoneScript

; Parry

ParryPhoneScript1:
	trainertotext HIKER, PARRY1, MEM_BUFFER_0
	checkflag ENGINE_PARRY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue ParryWantsBattle
	checktime EVE
	iftrue ParryWantsBattle

.WantsRematch:
	farjump ParryBattleWithMe

.NotFriday:
	farjump Phone_GenericCall_Male

.WantsBattle:
	landmarktotext ROUTE_45, MEM_BUFFER_2
	farjump ParryHaventYouGottenTo

ParryPhoneScript2:
	trainertotext HIKER, PARRY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .Generic
	checktime DAY
	iftrue ParryWantsBattle
	checktime EVE
	iftrue ParryWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

ParryWantsBattle:
	landmarktotext ROUTE_45, MEM_BUFFER_2
	setflag ENGINE_PARRY
	farjump PhoneScript_WantsToBattle_Male

; Erin

ErinPhoneScript1:
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	checkflag ENGINE_ERIN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue ErinWantsBattle

.NotSaturday:
	farjump ErinWorkingHardScript

.WantsBattle:
	landmarktotext ROUTE_46, MEM_BUFFER_2
	farjump ErinComeBattleScript

ErinPhoneScript2:
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .Generic
	checktime NITE
	iftrue ErinWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

ErinWantsBattle:
	landmarktotext ROUTE_46, MEM_BUFFER_2
	setflag ENGINE_ERIN
	farjump PhoneScript_WantsToBattle_Female
