StdScripts::
; entries correspond to constants/std_constants.asm
	dba PokecenterNurseScript
	dba DifficultBookshelfScript
	dba PictureBookshelfScript
	dba MagazineBookshelfScript
	dba TeamRocketOathScript
	dba IncenseBurnerScript
	dba MerchandiseShelfScript
	dba TownMapScript
	dba WindowScript
	dba TVScript
	dba HomepageScript
	dba Radio1Script
	dba Radio2Script
	dba TrashCanScript
	dba StrengthBoulderScript
	dba SmashRockScript
	dba PokecenterSignScript
	dba MartSignScript
	dba GoldenrodRocketsScript
	dba RadioTowerRocketsScript
	dba ElevatorButtonScript
	dba DayToTextScript
	dba BugContestResultsWarpScript
	dba BugContestResultsScript
	dba SafariZoneOverWarpScript
	dba InitializeEventsScript
	dba AskNumber1MScript
	dba AskNumber2MScript
	dba RegisteredNumberMScript
	dba NumberAcceptedMScript
	dba NumberDeclinedMScript
	dba PhoneFullMScript
	dba RematchMScript
	dba GiftMScript
	dba PackFullMScript
	dba RematchGiftMScript
	dba AskNumber1FScript
	dba AskNumber2FScript
	dba RegisteredNumberFScript
	dba NumberAcceptedFScript
	dba NumberDeclinedFScript
	dba PhoneFullFScript
	dba RematchFScript
	dba GiftFScript
	dba PackFullFScript
	dba RematchGiftFScript
	dba GymStatue1Script
	dba GymStatue2Script
	dba ReceiveItemScript
	dba ReceiveTogepiEggScript
	dba PCScript
	dba GameCornerCoinVendorScript
	dba HappinessCheckScript

PokecenterNurseScript:
; EVENT_WELCOMED_TO_POKECOM_CENTER is never set

	opentext
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	checktime EVE
	iftrue .eve
	checktime NITE
	iftrue .nite
	jump .ok

.morn
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .morn_comcenter
	farwritetext NurseMornText
	buttonsound
	jump .ok
.morn_comcenter
	farwritetext PokeComNurseMornText
	buttonsound
	jump .ok

.day
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .day_comcenter
	farwritetext NurseDayText
	buttonsound
	jump .ok
.day_comcenter
	farwritetext PokeComNurseDayText
	buttonsound
	jump .ok

.eve
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .eve_comcenter
	farwritetext NurseEveText
	buttonsound
	jump .ok
.eve_comcenter
	farwritetext PokeComNurseEveText
	buttonsound
	jump .ok

.nite
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .nite_comcenter
	farwritetext NurseNiteText
	buttonsound
	jump .ok
.nite_comcenter
	farwritetext PokeComNurseNiteText
	buttonsound
	jump .ok

.ok
	; only do this once
	clearevent EVENT_WELCOMED_TO_POKECOM_CENTER

	farwritetext NurseAskHealText
	yesorno
	iffalse .done

	farwritetext NurseTakePokemonText
	pause 20
	special StubbedTrainerRankings_Healings
	turnobject LAST_TALKED, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	writebyte HEALMACHINE_POKECENTER
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	turnobject LAST_TALKED, DOWN
	pause 10

	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_CAUGHT_POKERUS
	iftrue .no
	special CheckPokerus
	iftrue .pokerus
.no

	farwritetext NurseReturnPokemonText
	pause 20

.done
	farwritetext NurseGoodbyeText

	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10

	waitbutton
	closetext
	end

.pokerus
	; already cleared earlier in the script
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .pokerus_comcenter
	farwritetext NursePokerusText
	waitbutton
	closetext
	jump .pokerus_done

.pokerus_comcenter
	farwritetext PokeComNursePokerusText
	waitbutton
	closetext

.pokerus_done
	setflag ENGINE_CAUGHT_POKERUS
	specialphonecall SPECIALCALL_POKERUS
	end

DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText

TownMapScript:
	opentext
	farwritetext TownMapText
	waitbutton
	special OverworldTownMap
	closetext
	end

WindowScript:
	farjumptext WindowText

TVScript:
	opentext
	farwritetext TVText
	waitbutton
	closetext
	end

HomepageScript:
	farjumptext HomepageText

Radio1Script:
	opentext
	writebyte MAPRADIO_POKEMON_CHANNEL
	special MapRadio
	closetext
	end

Radio2Script:
; Lucky Channel
	opentext
	writebyte MAPRADIO_LUCKY_CHANNEL
	special MapRadio
	closetext
	end

TrashCanScript:
	farjumptext TrashCanText

PCScript:
	opentext
	special PokemonCenterPC
	closetext
	end

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farjump AskStrengthScript

SmashRockScript:
	farjump AskRockSmashScript

PokecenterSignScript:
	farjumptext PokecenterSignText

MartSignScript:
	farjumptext MartSignText

DayToTextScript:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	stringtotext .SundayText, MEM_BUFFER_0
	end
.Monday:
	stringtotext .MondayText, MEM_BUFFER_0
	end
.Tuesday:
	stringtotext .TuesdayText, MEM_BUFFER_0
	end
.Wednesday:
	stringtotext .WednesdayText, MEM_BUFFER_0
	end
.Thursday:
	stringtotext .ThursdayText, MEM_BUFFER_0
	end
.Friday:
	stringtotext .FridayText, MEM_BUFFER_0
	end
.Saturday:
	stringtotext .SaturdayText, MEM_BUFFER_0
	end
.SundayText:
	db "SUNDAY@"
.MondayText:
	db "MONDAY@"
.TuesdayText:
	db "TUESDAY@"
.WednesdayText:
	db "WEDNESDAY@"
.ThursdayText:
	db "THURSDAY@"
.FridayText:
	db "FRIDAY@"
.SaturdayText:
	db "SATURDAY@"

GoldenrodRocketsScript:
	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	end

RadioTowerRocketsScript:
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setmapscene MAHOGANY_TOWN, SCENE_FINISHED
	end

BugContestResultsWarpScript:
	special ClearBGPalettes
	scall BugContestResults_CopyContestantsToResults
	setevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	clearevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	setevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	warp ROUTE_36_NATIONAL_PARK_GATE, 0, 4
	applymovement PLAYER, Movement_ContestResults_WalkAfterWarp

BugContestResultsScript:
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	opentext
	farwritetext ContestResults_ReadyToJudgeText
	waitbutton
	special BugContestJudging
	vartomem MEM_BUFFER_0
	ifequal 1, BugContestResults_FirstPlace
	ifequal 2, BugContestResults_SecondPlace
	ifequal 3, BugContestResults_ThirdPlace
	farwritetext ContestResults_ConsolationPrizeText
	buttonsound
	waitsfx
	verbosegiveitem ORAN_BERRY
	iffalse BugContestResults_NoRoomForBerry

BugContestResults_DidNotWin:
	farwritetext ContestResults_DidNotWinText
	buttonsound
	jump BugContestResults_FinishUp

BugContestResults_ReturnAfterWinnersPrize:
	farwritetext ContestResults_JoinUsNextTimeText
	buttonsound

BugContestResults_FinishUp:
	checkevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	iffalse BugContestResults_DidNotLeaveMons
	farwritetext ContestResults_ReturnPartyText
	waitbutton
	special ContestReturnMons
BugContestResults_DidNotLeaveMons:
	special CheckPartyFullAfterContest
	ifequal BUGCONTEST_CAUGHT_MON, BugContestResults_CleanUp
	ifequal BUGCONTEST_NO_CATCH, BugContestResults_CleanUp
	; BUGCONTEST_BOXED_MON
	farwritetext ContestResults_PartyFullText
	waitbutton
BugContestResults_CleanUp:
	closetext
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	setmapscene ROUTE_35_NATIONAL_PARK_GATE, SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setflag ENGINE_DAILY_BUG_CONTEST
	special PlayMapMusic
	end

BugContestResults_FirstPlace:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	itemtotext SUN_STONE, MEM_BUFFER_1
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem SUN_STONE
	iffalse BugContestResults_NoRoomForSunStone
	jump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_SecondPlace:
	itemtotext EVERSTONE, MEM_BUFFER_1
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem EVERSTONE
	iffalse BugContestResults_NoRoomForEverstone
	jump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_ThirdPlace:
	itemtotext SITRUS_BERRY, MEM_BUFFER_1
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem SITRUS_BERRY
	iffalse BugContestResults_NoRoomForGoldBerry
	jump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForSunStone:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	jump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForEverstone:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	jump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForGoldBerry:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	jump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForBerry:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_BERRY
	jump BugContestResults_DidNotWin

BugContestResults_CopyContestantsToResults:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .skip1
	clearevent EVENT_BUG_CATCHING_CONTESTANT_1B
.skip1
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .skip2
	clearevent EVENT_BUG_CATCHING_CONTESTANT_2B
.skip2
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .skip3
	clearevent EVENT_BUG_CATCHING_CONTESTANT_3B
.skip3
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .skip4
	clearevent EVENT_BUG_CATCHING_CONTESTANT_4B
.skip4
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .skip5
	clearevent EVENT_BUG_CATCHING_CONTESTANT_5B
.skip5
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .skip6
	clearevent EVENT_BUG_CATCHING_CONTESTANT_6B
.skip6
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .skip7
	clearevent EVENT_BUG_CATCHING_CONTESTANT_7B
.skip7
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .skip8
	clearevent EVENT_BUG_CATCHING_CONTESTANT_8B
.skip8
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .skip9
	clearevent EVENT_BUG_CATCHING_CONTESTANT_9B
.skip9
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .skip10
	clearevent EVENT_BUG_CATCHING_CONTESTANT_10B
.skip10
	end

SafariZoneOverWarpScript:
	playsound SFX_ENTER_DOOR
	special ClearBGPalettes
	waitsfx
	warpfacing DOWN, SAFARI_ZONE_ENTRANCE, 3, 0
	turnobject 4, RIGHT
	applymovement PLAYER, Movement_SafariZoneOver_WalkAfterWarp
	applymovement 4, MovementData_Officer2_Leave
	opentext
	writetext SafariZoneEntranceMainOfficer_Text9
	waitbutton
	closetext
	setevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	clearevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	setscene SCENE_SAFARIZONEENTRANCE_NOTHING
	appear 3
	pause 1
	disappear 4
	end

SafariZoneEntranceMainOfficer_Text9:
	text "Did you get a"
	line "good catch?"
	
	para "We look foward to"
	line "your next visit!"
	done

MovementData_Officer2_Leave:
	step RIGHT
	step DOWN
	step_end

InitializeEventsScript:
	setevent EVENT_EARLS_ACADEMY_EARL
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	setevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	setevent EVENT_RIVAL_TEAM_ROCKET_BASE
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setevent EVENT_RIVAL_AZALEA_TOWN
	setevent EVENT_RIVAL_GOLDENROD_UNDERGROUND
	setevent EVENT_AZALEA_TOWN_SLOWPOKES
	setevent EVENT_KURTS_HOUSE_SLOWPOKE
	setevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_COP_IN_ELMS_LAB
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	setevent EVENT_BOULDER_IN_ICE_PATH_1A
	setevent EVENT_BOULDER_IN_ICE_PATH_2A
	setevent EVENT_BOULDER_IN_ICE_PATH_3A
	setevent EVENT_BOULDER_IN_ICE_PATH_4A
	setevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setevent EVENT_FAST_SHIP_1F_GENTLEMAN
	setevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	setevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	setevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_TIN_TOWER_ROOF_HO_OH
	setevent EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	setevent EVENT_PLAYERS_HOUSE_2F_CONSOLE
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_1
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_2
	setevent EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_PLANT_4
	setevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	setevent EVENT_MET_BILL
	setevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	setevent EVENT_LAKE_OF_RAGE_LANCE
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	setevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	setevent EVENT_DRAGONS_DEN_CLAIR
	setevent EVENT_RIVAL_OLIVINE_CITY
	setevent EVENT_RIVAL_VICTORY_ROAD
	setevent EVENT_RIVAL_DRAGONS_DEN
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	setevent EVENT_BURNED_TOWER_B1F_BEASTS_1
	setevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	setevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_KURTS_HOUSE_KURT_2
	setevent EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_SUDOWOODO
	setevent EVENT_GOLDENROD_CITY_MOVE_TUTOR
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	setevent EVENT_DRAGON_SHRINE_CLAIR
	setevent EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	setevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setevent EVENT_AZALEA_TOWN_KURT
	setevent EVENT_AZALEA_TOWN_KURT
	setevent EVENT_ILEX_FOREST_KURT
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
	setevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	setevent EVENT_CIANWOOD_CITY_EUSINE
	setevent EVENT_TIN_TOWER_1F_EUSINE
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_MAHOGANY
	variablesprite SPRITE_WEIRD_TREE, SPRITE_SUDOWOODO
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setevent EVENT_CERULEAN_GYM_ROCKET
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setevent EVENT_COPYCATS_HOUSE_2F_DOLL
	setevent EVENT_VIRIDIAN_GYM_BLUE
	setevent EVENT_MT_MOON_SQUARE_CLEFAIRY
	setevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	setevent EVENT_INITIALIZED_EVENTS
	setevent EVENT_SCIENTIST_LOWELL_DEFEATED
	setevent EVENT_SCIENTIST_DANNIE_DEFEATED
	setevent EVENT_SUPER_NERD_CARY_DEFEATED
	setevent EVENT_SCIENTIST_LINDEN_DEFEATED
	setevent EVENT_SUPER_NERD_WALDO_DEFEATED
	setevent EVENT_SUPER_NERD_MERLE_DEFEATED
	setevent EVENT_ARTICUNO_APPEAR
	setevent EVENT_ZAPDOS_APPEAR
	setevent EVENT_MOLTRES_APPEAR
	setevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	setevent EVENT_OLIVINE_LIGHTHOUSE_AMPHY_SICK
	return

AskNumber1MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_FIREBREATHER_WALT, .Walt
	ifequal PHONE_GENTLEMAN_ALFRED, .Alfred
	ifequal PHONE_BUG_CATCHER_DOUG, .Doug
	ifequal PHONE_BUG_CATCHER_ROB, .Rob
	ifequal PHONE_FISHER_KYLE, .Kyle
	ifequal PHONE_CAMPER_TANNER, .Tanner
	ifequal PHONE_HIKER_KENNY, .Kenny
	ifequal PHONE_BIRDKEEPER_JAMIE, .Jamie
	ifequal PHONE_SCHOOLBOY_TORIN, .Torin
	ifequal PHONE_SCHOOLBOY_BILLY, .Billy
	ifequal PHONE_BIKER_AIDEN, .Aiden
	ifequal PHONE_BIKER_EOIN, .Eoin
	ifequal PHONE_BIKER_REESE, .Reese

.Jack:
	farwritetext JackAskNumber1Text
	end
.Huey:
	farwritetext HueyAskNumber1Text
	end
.Gaven:
	farwritetext GavenAskNumber1Text
	end
.Jose:
	farwritetext JoseAskNumber1Text
	end
.Joey:
	farwritetext JoeyAskNumber1Text
	end
.Wade:
	farwritetext WadeAskNumber1Text
	end
.Ralph:
	farwritetext RalphAskNumber1Text
	end
.Anthony:
	farwritetext AnthonyAskNumber1Text
	end
.Todd:
	farwritetext ToddAskNumber1Text
	end
.Irwin:
	farwritetext IrwinAskNumber1Text
	end
.Arnie:
	farwritetext ArnieAskNumber1Text
	end
.Alan:
	farwritetext AlanAskNumber1Text
	end
.Chad:
	farwritetext ChadAskNumber1Text
	end
.Derek:
	farwritetext DerekAskNumber1Text
	end
.Tully:
	farwritetext TullyAskNumber1Text
	end
.Brent:
	farwritetext BrentAskNumber1Text
	end
.Vance:
	farwritetext VanceAskNumber1Text
	end
.Wilton:
	farwritetext WiltonAskNumber1Text
	end
.Kenji:
	farwritetext KenjiAskNumber1Text
	end
.Parry:
	farwritetext ParryAskNumber1Text
	end
.Ian:
	farwritetext IanAskNumber1Text
	end
.Walt:
	farwritetext WaltAskNumber1Text
	end
.Alfred:
	farwritetext AlfredAskNumber1Text
	end
.Doug:
	farwritetext DougAskNumber1Text
	end
.Rob:
	farwritetext RobAskNumber1Text
	end
.Kyle:
	farwritetext KyleAskNumber1Text
	end
.Tanner:
	farwritetext TannerAskNumber1Text
	end
.Kenny:
	farwritetext KennyAskNumber1Text
	end
.Jamie:
	farwritetext JamieAskNumber1Text
	end
.Torin:
	farwritetext TorinAskNumber1Text
	end
.Billy:
	farwritetext BillyAskNumber1Text
	end
.Aiden:
	farwritetext AidenAskNumber1Text
	end
.Eoin:
	farwritetext EoinAskNumber1Text
	end
.Reese:
	farwritetext ReeseAskNumber1Text
	end

AskNumber2MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_FIREBREATHER_WALT, .Walt
	ifequal PHONE_GENTLEMAN_ALFRED, .Alfred
	ifequal PHONE_BUG_CATCHER_DOUG, .Doug
	ifequal PHONE_BUG_CATCHER_ROB, .Rob
	ifequal PHONE_FISHER_KYLE, .Kyle
	ifequal PHONE_CAMPER_TANNER, .Tanner
	ifequal PHONE_HIKER_KENNY, .Kenny
	ifequal PHONE_BIRDKEEPER_JAMIE, .Jamie
	ifequal PHONE_SCHOOLBOY_TORIN, .Torin
	ifequal PHONE_SCHOOLBOY_BILLY, .Billy
	ifequal PHONE_BIKER_AIDEN, .Aiden
	ifequal PHONE_BIKER_EOIN, .Eoin
	ifequal PHONE_BIKER_REESE, .Reese

.Jack:
	farwritetext JackAskNumber2Text
	end
.Huey:
	farwritetext HueyAskNumber2Text
	end
.Gaven:
	farwritetext GavenAskNumber2Text
	end
.Jose:
	farwritetext JoseAskNumber2Text
	end
.Joey:
	farwritetext JoeyAskNumber2Text
	end
.Wade:
	farwritetext WadeAskNumber2Text
	end
.Ralph:
	farwritetext RalphAskNumber2Text
	end
.Anthony:
	farwritetext AnthonyAskNumber2Text
	end
.Todd:
	farwritetext ToddAskNumber2Text
	end
.Irwin:
	farwritetext IrwinAskNumber2Text
	end
.Arnie:
	farwritetext ArnieAskNumber2Text
	end
.Alan:
	farwritetext AlanAskNumber2Text
	end
.Chad:
	farwritetext ChadAskNumber2Text
	end
.Derek:
	farwritetext DerekAskNumber2Text
	end
.Tully:
	farwritetext TullyAskNumber2Text
	end
.Brent:
	farwritetext BrentAskNumber2Text
	end
.Vance:
	farwritetext VanceAskNumber2Text
	end
.Wilton:
	farwritetext WiltonAskNumber2Text
	end
.Kenji:
	farwritetext KenjiAskNumber2Text
	end
.Parry:
	farwritetext ParryAskNumber2Text
	end
.Ian:
	farwritetext IanAskNumber2Text
	end
.Walt:
	farwritetext WaltAskNumber2Text
	end
.Alfred:
	farwritetext AlfredAskNumber2Text
	end
.Doug:
	farwritetext DougAskNumber2Text
	end
.Rob:
	farwritetext RobAskNumber2Text
	end
.Kyle:
	farwritetext KyleAskNumber2Text
	end
.Tanner:
	farwritetext TannerAskNumber2Text
	end
.Kenny:
	farwritetext KennyAskNumber2Text
	end
.Jamie:
	farwritetext JamieAskNumber2Text
	end
.Torin:
	farwritetext TorinAskNumber2Text
	end
.Billy:
	farwritetext BillyAskNumber2Text
	end
.Aiden:
	farwritetext AidenAskNumber2Text
	end
.Eoin:
	farwritetext EoinAskNumber2Text
	end
.Reese:
	farwritetext ReeseAskNumber2Text
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedMScript:
	checkcode VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_FIREBREATHER_WALT, .Walt
	ifequal PHONE_GENTLEMAN_ALFRED, .Alfred
	ifequal PHONE_BUG_CATCHER_DOUG, .Doug
	ifequal PHONE_BUG_CATCHER_ROB, .Rob
	ifequal PHONE_FISHER_KYLE, .Kyle
	ifequal PHONE_CAMPER_TANNER, .Tanner
	ifequal PHONE_HIKER_KENNY, .Kenny
	ifequal PHONE_BIRDKEEPER_JAMIE, .Jamie
	ifequal PHONE_SCHOOLBOY_TORIN, .Torin
	ifequal PHONE_SCHOOLBOY_BILLY, .Billy
	ifequal PHONE_BIKER_AIDEN, .Aiden
	ifequal PHONE_BIKER_EOIN, .Eoin
	ifequal PHONE_BIKER_REESE, .Reese


.Jack:
	farwritetext JackNumberAcceptedText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyNumberAcceptedText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenNumberAcceptedText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseNumberAcceptedText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyNumberAcceptedText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeNumberAcceptedText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphNumberAcceptedText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyNumberAcceptedText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddNumberAcceptedText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinNumberAcceptedText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieNumberAcceptedText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanNumberAcceptedText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadNumberAcceptedText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekNumberAcceptedText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyNumberAcceptedText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentNumberAcceptedText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceNumberAcceptedText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonNumberAcceptedText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiNumberAcceptedText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryNumberAcceptedText
	waitbutton
	closetext
	end
.Ian:
	farwritetext IanNumberAcceptedText
	waitbutton
	closetext
	end
.Walt:
	farwritetext WaltNumberAcceptedText
	waitbutton
	closetext
	end
.Alfred:
	farwritetext AlfredNumberAcceptedText
	waitbutton
	closetext
	end
.Doug:
	farwritetext DougNumberAcceptedText
	waitbutton
	closetext
	end
.Rob:
	farwritetext RobNumberAcceptedText
	waitbutton
	closetext
	end
.Kyle:
	farwritetext KyleNumberAcceptedText
	waitbutton
	closetext
	end
.Tanner:
	farwritetext TannerNumberAcceptedText
	waitbutton
	closetext
	end
.Kenny:
	farwritetext KennyNumberAcceptedText
	waitbutton
	closetext
	end
.Jamie:
	farwritetext JamieNumberAcceptedText
	waitbutton
	closetext
	end
.Torin:
	farwritetext TorinNumberAcceptedText
	waitbutton
	closetext
	end
.Billy:
	farwritetext BillyNumberAcceptedText
	waitbutton
	closetext
	end
.Aiden:
	farwritetext AidenNumberAcceptedText
	waitbutton
	closetext
	end
.Eoin:
	farwritetext EoinNumberAcceptedText
	waitbutton
	closetext
	end
.Reese:
	farwritetext ReeseNumberAcceptedText
	waitbutton
	closetext
	end

NumberDeclinedMScript:
	checkcode VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_FIREBREATHER_WALT, .Walt
	ifequal PHONE_GENTLEMAN_ALFRED, .Alfred
	ifequal PHONE_BUG_CATCHER_DOUG, .Doug
	ifequal PHONE_BUG_CATCHER_ROB, .Rob
	ifequal PHONE_FISHER_KYLE, .Kyle
	ifequal PHONE_CAMPER_TANNER, .Tanner
	ifequal PHONE_HIKER_KENNY, .Kenny
	ifequal PHONE_BIRDKEEPER_JAMIE, .Jamie
	ifequal PHONE_SCHOOLBOY_TORIN, .Torin
	ifequal PHONE_SCHOOLBOY_BILLY, .Billy
	ifequal PHONE_BIKER_AIDEN, .Aiden
	ifequal PHONE_BIKER_EOIN, .Eoin
	ifequal PHONE_BIKER_REESE, .Reese

.Jack:
	farwritetext JackNumberDeclinedText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyNumberDeclinedText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenNumberDeclinedText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseNumberDeclinedText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyNumberDeclinedText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeNumberDeclinedText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphNumberDeclinedText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyNumberDeclinedText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddNumberDeclinedText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinNumberDeclinedText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieNumberDeclinedText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanNumberDeclinedText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadNumberDeclinedText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekNumberDeclinedText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyNumberDeclinedText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentNumberDeclinedText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceNumberDeclinedText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonNumberDeclinedText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiNumberDeclinedText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryNumberDeclinedText
	waitbutton
	closetext
	end
.Ian:
	farwritetext IanNumberDeclinedText
	waitbutton
	closetext
	end
.Walt:
	farwritetext WaltNumberDeclinedText
	waitbutton
	closetext
	end
.Alfred:
	farwritetext AlfredNumberDeclinedText
	waitbutton
	closetext
	end
.Doug:
	farwritetext DougNumberDeclinedText
	waitbutton
	closetext
	end
.Rob:
	farwritetext RobNumberDeclinedText
	waitbutton
	closetext
	end
.Kyle:
	farwritetext KyleNumberDeclinedText
	waitbutton
	closetext
	end
.Tanner:
	farwritetext TannerNumberDeclinedText
	waitbutton
	closetext
	end
.Kenny:
	farwritetext KennyNumberDeclinedText
	waitbutton
	closetext
	end
.Jamie:
	farwritetext JamieNumberDeclinedText
	waitbutton
	closetext
	end
.Torin:
	farwritetext TorinNumberDeclinedText
	waitbutton
	closetext
	end
.Billy:
	farwritetext BillyNumberDeclinedText
	waitbutton
	closetext
	end
.Aiden:
	farwritetext AidenNumberDeclinedText
	waitbutton
	closetext
	end
.Eoin:
	farwritetext EoinNumberDeclinedText
	waitbutton
	closetext
	end
.Reese:
	farwritetext ReeseNumberDeclinedText
	waitbutton
	closetext
	end

PhoneFullMScript:
	checkcode VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_FIREBREATHER_WALT, .Walt
	ifequal PHONE_GENTLEMAN_ALFRED, .Alfred

.Jack:
	farwritetext JackPhoneFullText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyPhoneFullText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenPhoneFullText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JosePhoneFullText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyPhoneFullText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadePhoneFullText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphPhoneFullText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyPhoneFullText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddPhoneFullText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinPhoneFullText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArniePhoneFullText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanPhoneFullText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadPhoneFullText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekPhoneFullText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyPhoneFullText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentPhoneFullText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VancePhoneFullText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonPhoneFullText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiPhoneFullText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryPhoneFullText
	waitbutton
	closetext
	end
.Ian:
	farwritetext IanPhoneFullText
	waitbutton
	closetext
	end
.Walt:
	farwritetext WaltPhoneFullText
	waitbutton
	closetext
	end
.Alfred:
	farwritetext AlfredPhoneFullText
	waitbutton
	closetext
	end

RematchMScript:
	checkcode VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_FIREBREATHER_WALT, .Walt
	ifequal PHONE_GENTLEMAN_ALFRED, .Alfred
	ifequal PHONE_BUG_CATCHER_DOUG, .Doug
	ifequal PHONE_BUG_CATCHER_ROB, .Rob
	ifequal PHONE_FISHER_KYLE, .Kyle
	ifequal PHONE_CAMPER_TANNER, .Tanner
	ifequal PHONE_HIKER_KENNY, .Kenny
	ifequal PHONE_BIRDKEEPER_JAMIE, .Jamie
	ifequal PHONE_SCHOOLBOY_TORIN, .Torin
	ifequal PHONE_SCHOOLBOY_BILLY, .Billy
	ifequal PHONE_BIKER_AIDEN, .Aiden
	ifequal PHONE_BIKER_EOIN, .Eoin
	ifequal PHONE_BIKER_REESE, .Reese

.Jack:
	farwritetext JackRematchText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyRematchText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenRematchText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseRematchText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyRematchText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeRematchText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphRematchText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyRematchText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddRematchText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieRematchText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanRematchText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadRematchText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyRematchText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentRematchText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceRematchText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonRematchText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryRematchText
	waitbutton
	closetext
	end
.Ian:
	farwritetext IanRematchText
	waitbutton
	closetext
	end
.Walt:
	farwritetext WaltRematchText
	waitbutton
	closetext
	end
.Alfred:
	farwritetext AlfredRematchText
	waitbutton
	closetext
	end
.Doug:
	farwritetext DougRematchText
	waitbutton
	closetext
	end
.Rob:
	farwritetext RobRematchText
	waitbutton
	closetext
	end
.Kyle:
	farwritetext KyleRematchText
	waitbutton
	closetext
	end
.Tanner:
	farwritetext TannerRematchText
	waitbutton
	closetext
	end
.Kenny:
	farwritetext KennyRematchText
	waitbutton
	closetext
	end
.Jamie:
	farwritetext JamieRematchText
	waitbutton
	closetext
	end
.Torin:
	farwritetext TorinRematchText
	waitbutton
	closetext
	end
.Billy:
	farwritetext BillyRematchText
	waitbutton
	closetext
	end
.Aiden:
	farwritetext AidenRematchText
	waitbutton
	closetext
	end
.Eoin:
	farwritetext EoinRematchText
	waitbutton
	closetext
	end
.Reese:
	farwritetext ReeseRematchText
	waitbutton
	closetext
	end

GiftMScript:
	checkcode VAR_CALLERID
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_BUG_CATCHER_DOUG, .Doug
	ifequal PHONE_BUG_CATCHER_ROB, .Rob
	ifequal PHONE_CAMPER_TANNER, .Tanner
	ifequal PHONE_BIRDKEEPER_JAMIE, .Jamie

.Jose:
	farwritetext JoseGiftText
	buttonsound
	end
.Jamie:
.Doug:
.Rob:
.Wade:
	farwritetext WadeGiftText
	buttonsound
	end
.Tanner:
.Alan:
	farwritetext AlanGiftText
	buttonsound
	end
.Derek:
	farwritetext DerekGiftText
	buttonsound
	end
.Tully:
	farwritetext TullyGiftText
	buttonsound
	end
.Wilton:
	farwritetext WiltonGiftText
	buttonsound
	end
.Kenji:
	farwritetext KenjiGiftText
	buttonsound
	end

PackFullMScript:
	checkcode VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
	ifequal PHONE_YOUNGSTER_IAN, .Ian
	ifequal PHONE_CAMPER_TANNER, .Tanner

.Huey:
	farwritetext HueyPackFullText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JosePackFullText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyPackFullText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadePackFullText
	waitbutton
	closetext
	end
.Tanner:
.Alan:
	farwritetext AlanPackFullText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekPackFullText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyPackFullText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VancePackFullText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonPackFullText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiPackFullText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryPackFullText
	waitbutton
	closetext
	end
.Ian:
	farwritetext IanPackFullText
	waitbutton
	closetext
	end

RematchGiftMScript:
	opentext
	checkcode VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyRematchGiftText
	buttonsound
	end
.Joey:
	farwritetext JoeyRematchGiftText
	buttonsound
	end
.Vance:
	farwritetext VanceRematchGiftText
	buttonsound
	end
.Parry:
	farwritetext ParryRematchGiftText
	buttonsound
	end

AskNumber1FScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin
	ifequal PHONE_LASS_KRISE, .Krise
	ifequal PHONE_COUPLE_TIM_AND_SUE, .TimAndSue
	ifequal PHONE_TEACHER_HILLARY, .Hillary
	ifequal PHONE_TWINS_KAY_AND_TIA, .KayAndTia

.Beverly:
	farwritetext BeverlyAskNumber1Text
	end
.Beth:
	farwritetext BethAskNumber1Text
	end
.Reena:
	farwritetext ReenaAskNumber1Text
	end
.Liz:
	farwritetext LizAskNumber1Text
	end
.Gina:
	farwritetext GinaAskNumber1Text
	end
.Dana:
	farwritetext DanaAskNumber1Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber1Text
	end
.Erin:
	farwritetext ErinAskNumber1Text
	end
.Krise:
	farwritetext KriseAskNumber1Text
	end
.TimAndSue:
	farwritetext TimAndSueAskNumber1Text
	end
.Hillary:
	farwritetext HillaryAskNumber1Text
	end
.KayAndTia:
	farwritetext KayAndTiaAskNumber1Text
	end

AskNumber2FScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin
	ifequal PHONE_LASS_KRISE, .Krise
	ifequal PHONE_COUPLE_TIM_AND_SUE, .TimAndSue
	ifequal PHONE_TEACHER_HILLARY, .Hillary
	ifequal PHONE_TWINS_KAY_AND_TIA, .KayAndTia

.Beverly:
	farwritetext BeverlyAskNumber2Text
	end
.Beth:
	farwritetext BethAskNumber2Text
	end
.Reena:
	farwritetext ReenaAskNumber2Text
	end
.Liz:
	farwritetext LizAskNumber2Text
	end
.Gina:
	farwritetext GinaAskNumber2Text
	end
.Dana:
	farwritetext DanaAskNumber2Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber2Text
	end
.Erin:
	farwritetext ErinAskNumber2Text
	end
.Krise:
	farwritetext KriseAskNumber2Text
	end
.TimAndSue:
	farwritetext TimAndSueAskNumber2Text
	end
.Hillary:
	farwritetext HillaryAskNumber2Text
	end
.KayAndTia:
	farwritetext KayAndTiaAskNumber2Text
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin
	ifequal PHONE_LASS_KRISE, .Krise
	ifequal PHONE_COUPLE_TIM_AND_SUE, .TimAndSue
	ifequal PHONE_TEACHER_HILLARY, .Hillary
	ifequal PHONE_TWINS_KAY_AND_TIA, .KayAndTia

.Beverly:
	farwritetext BeverlyNumberAcceptedText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethNumberAcceptedText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaNumberAcceptedText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizNumberAcceptedText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaNumberAcceptedText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaNumberAcceptedText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyNumberAcceptedText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinNumberAcceptedText
	waitbutton
	closetext
	end
.Krise:
	farwritetext KriseNumberAcceptedText
	waitbutton
	closetext
	end
.TimAndSue:
	farwritetext TimAndSueNumberAcceptedText
	waitbutton
	closetext
	end
.Hillary:
	farwritetext HillaryNumberAcceptedText
	waitbutton
	closetext
	end
.KayAndTia:
	farwritetext KayAndTiaNumberAcceptedText
	waitbutton
	closetext
	end

NumberDeclinedFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin
	ifequal PHONE_LASS_KRISE, .Krise
	ifequal PHONE_COUPLE_TIM_AND_SUE, .TimAndSue
	ifequal PHONE_TEACHER_HILLARY, .Hillary
	ifequal PHONE_TWINS_KAY_AND_TIA, .KayAndTia

.Beverly:
	farwritetext BeverlyNumberDeclinedText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethNumberDeclinedText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaNumberDeclinedText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizNumberDeclinedText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaNumberDeclinedText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaNumberDeclinedText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyNumberDeclinedText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinNumberDeclinedText
	waitbutton
	closetext
	end
.Krise:
	farwritetext KriseNumberDeclinedText
	waitbutton
	closetext
	end
.TimAndSue:
	farwritetext TimAndSueNumberDeclinedText
	waitbutton
	closetext
	end
.Hillary:
	farwritetext HillaryNumberDeclinedText
	waitbutton
	closetext
	end
.KayAndTia:
	farwritetext KayAndTiaNumberDeclinedText
	waitbutton
	closetext
	end

PhoneFullFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin
	ifequal PHONE_LASS_KRISE, .Krise

.Beverly:
	farwritetext BeverlyPhoneFullText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethPhoneFullText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaPhoneFullText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizPhoneFullText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaPhoneFullText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaPhoneFullText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyPhoneFullText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinPhoneFullText
	waitbutton
	closetext
	end
.Krise:
	farwritetext KrisePhoneFullText
	waitbutton
	closetext
	end

RematchFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin
	ifequal PHONE_LASS_KRISE, .Krise
	ifequal PHONE_COUPLE_TIM_AND_SUE, .TimAndSue
	ifequal PHONE_TEACHER_HILLARY, .Hillary
	ifequal PHONE_TWINS_KAY_AND_TIA, .KayAndTia

.Beth:
	farwritetext BethRematchText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaRematchText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizRematchText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaRematchText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaRematchText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyRematchText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinRematchText
	waitbutton
	closetext
	end
.Krise:
	farwritetext KriseRematchText
	waitbutton
	closetext
	end
.TimAndSue:
	farwritetext TimAndSueRematchText
	waitbutton
	closetext
	end
.Hillary:
	farwritetext HillaryRematchText
	waitbutton
	closetext
	end
.KayAndTia:
	farwritetext KayAndTiaRematchText
	waitbutton
	closetext
	end

GiftFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly:
	farwritetext BeverlyGiftText
	buttonsound
	end
.Gina:
	farwritetext GinaGiftText
	buttonsound
	end
.Dana:
	farwritetext DanaGiftText
	buttonsound
	end
.Tiffany:
	farwritetext TiffanyGiftText
	buttonsound
	end

PackFullFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyPackFullText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaPackFullText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaPackFullText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyPackFullText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinPackFullText
	waitbutton
	closetext
	end

RematchGiftFScript:
	checkcode VAR_CALLERID
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Erin:
	opentext
	farwritetext ErinRematchGiftText
	buttonsound
	end

GymStatue1Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	waitbutton
	closetext
	end

GymStatue2Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainersText
	waitbutton
	closetext
	end

ReceiveItemScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_ITEM
	waitsfx
	end

ReceiveTogepiEggScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_GET_EGG_FROM_DAY_CARE_LADY
	waitsfx
	end

GameCornerCoinVendorScript:
	faceplayer
	opentext
	farwritetext CoinVendor_WelcomeText
	buttonsound
	checkitem COIN_CASE
	iftrue CoinVendor_IntroScript
	farwritetext CoinVendor_NoCoinCaseText
	waitbutton
	closetext
	end

CoinVendor_IntroScript:
	farwritetext CoinVendor_IntroText

.loop
	special DisplayMoneyAndCoinBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy50
	ifequal 2, .Buy500
	jump .Cancel

.Buy50:
	checkcoins MAX_COINS - 50
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 50
	takemoney YOUR_MONEY, 1000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy50CoinsText
	waitbutton
	jump .loop

.Buy500:
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 500
	takemoney YOUR_MONEY, 10000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy500CoinsText
	waitbutton
	jump .loop

.NotEnoughMoney:
	farwritetext CoinVendor_NotEnoughMoneyText
	waitbutton
	closetext
	end

.CoinCaseFull:
	farwritetext CoinVendor_CoinCaseFullText
	waitbutton
	closetext
	end

.Cancel:
	farwritetext CoinVendor_CancelText
	waitbutton
	closetext
	end


.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"


HappinessCheckScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless 50, .Unhappy
	ifless 150, .KindaHappy
	farwritetext HappinessText3
	waitbutton
	closetext
	end

.KindaHappy:
	farwritetext HappinessText2
	waitbutton
	closetext
	end

.Unhappy:
	farwritetext HappinessText1
	waitbutton
	closetext
	end

Movement_ContestResults_WalkAfterWarp:
	step RIGHT
	step DOWN
	turn_head UP
	step_end

Movement_SafariZoneOver_WalkAfterWarp:
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end
