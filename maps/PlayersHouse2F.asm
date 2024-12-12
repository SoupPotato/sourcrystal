	object_const_def
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL

PlayersHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersHouse2FInitializeRoomCallback
	callback MAPCALLBACK_TILES, PlayersHouse2FSetUpTileDecorationsCallback

PlayersHouse2FNoopScene: ; unreferenced
	end

PlayersHouse2FInitializeRoomCallback:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	endcallback

.SkipInitialization:
	endcallback

PlayersHouse2FSetUpTileDecorationsCallback:
	special ToggleMaptileDecorations
	endcallback

	db 0, 0, 0 ; unused

PlayersHouseDoll1Script::
	describedecoration DECODESC_LEFT_DOLL

PlayersHouseDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

PlayersHouseBigDollScript:
	describedecoration DECODESC_BIG_DOLL

PlayersHouseGameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
if DEF(_DEBUG)
	opentext
	; full pokegear
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_PAGER_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_EXPN_CARD
; wPagerFlags
	setflag ENGINE_PAGER_CUT
	setflag ENGINE_PAGER_FLY
	setflag ENGINE_PAGER_SURF
	setflag ENGINE_PAGER_STRENGTH
	setflag ENGINE_PAGER_FLASH
	setflag ENGINE_PAGER_WHIRLPOOL
	setflag ENGINE_PAGER_ROCK_SMASH
	; pokedex
	setflag ENGINE_POKEDEX
	; useful items
	giveitem MAX_REPEL, 99
	giveitem RARE_CANDY, 99
	giveitem POKE_BALL, 99
	giveitem GREAT_BALL, 99
	giveitem ULTRA_BALL, 99
	giveitem MASTER_BALL, 99
	giveitem HEAVY_BALL, 99
	giveitem LEVEL_BALL, 99
	giveitem LURE_BALL, 99
	giveitem FAST_BALL, 99
	giveitem FRIEND_BALL, 99
	giveitem MOON_BALL, 99
	giveitem LOVE_BALL, 99
	giveitem PARK_BALL, 99
	giveitem SAFARI_BALL, 99
	giveitem TM_DYNAMICPUNCH
	giveitem TM_HEADBUTT
	giveitem TM_CURSE
	giveitem TM_ROLLOUT
	giveitem TM_ROAR
	giveitem TM_TOXIC
	giveitem TM_ZAP_CANNON
	giveitem TM_ROCK_SMASH
	giveitem TM_PSYCH_UP
	giveitem TM_HIDDEN_POWER
	giveitem TM_SUNNY_DAY
	giveitem TM_SWEET_SCENT
	giveitem TM_SNORE
	giveitem TM_BLIZZARD
	giveitem TM_HYPER_BEAM
	giveitem TM_ICY_WIND
	giveitem TM_PROTECT
	giveitem TM_RAIN_DANCE
	giveitem TM_GIGA_DRAIN
	giveitem TM_ENDURE
	giveitem TM_FRUSTRATION
	giveitem TM_SOLARBEAM
	giveitem TM_IRON_TAIL
	giveitem TM_DRAGONBREATH
	giveitem TM_THUNDER
	giveitem TM_EARTHQUAKE
	giveitem TM_RETURN
	giveitem TM_DIG
	giveitem TM_PSYCHIC_M
	giveitem TM_SHADOW_BALL
	giveitem TM_MUD_SLAP
	giveitem TM_DOUBLE_TEAM
	giveitem TM_ICE_PUNCH
	giveitem TM_SWAGGER
	giveitem TM_SLEEP_TALK
	giveitem TM_SLUDGE_BOMB
	giveitem TM_SANDSTORM
	giveitem TM_FIRE_BLAST
	giveitem TM_SWIFT
	giveitem TM_DEFENSE_CURL
	giveitem TM_THUNDERPUNCH
	giveitem TM_DREAM_EATER
	giveitem TM_LOW_KICK
	giveitem TM_REST
	giveitem TM_ATTRACT
	giveitem TM_THIEF
	giveitem TM_STEEL_WING
	giveitem TM_FIRE_PUNCH
	giveitem TM_FURY_CUTTER
	giveitem TM_NIGHTMARE
	giveitem HM_CUT
	giveitem HM_FLY
	giveitem HM_SURF
	giveitem HM_STRENGTH
	giveitem HM_FLASH
	giveitem HM_WHIRLPOOL
	giveitem HM_WATERFALL
	; all badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
	setevent EVENT_BEAT_FALKNER
	setevent EVENT_BEAT_BUGSY
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_CHUCK
	setevent EVENT_BEAT_JASMINE
	setevent EVENT_BEAT_PRYCE
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ELITE_FOUR
	clearevent EVENT_RED_IN_MT_SILVER
	; fly anywhere
	setflag ENGINE_FLYPOINT_NEW_BARK
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	setflag ENGINE_FLYPOINT_VIOLET
	setflag ENGINE_FLYPOINT_AZALEA
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLYPOINT_ECRUTEAK
	setflag ENGINE_FLYPOINT_OLIVINE
	setflag ENGINE_FLYPOINT_CIANWOOD
	setflag ENGINE_FLYPOINT_MAHOGANY
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	setflag ENGINE_FLYPOINT_BLACKTHORN
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	setflag ENGINE_FLYPOINT_PALLET
	setflag ENGINE_FLYPOINT_VIRIDIAN
	setflag ENGINE_FLYPOINT_PEWTER
	setflag ENGINE_FLYPOINT_CERULEAN
	setflag ENGINE_FLYPOINT_VERMILION
	setflag ENGINE_FLYPOINT_CELADON
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	setflag ENGINE_FLYPOINT_LAVENDER
	setflag ENGINE_FLYPOINT_FUCHSIA
	setflag ENGINE_FLYPOINT_SAFFRON
	setflag ENGINE_FLYPOINT_CINNABAR
	setflag ENGINE_FLYPOINT_SAFARI_ZONE_GATE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_J
	setflag ENGINE_UNLOCKED_UNOWNS_K_TO_Q
	setflag ENGINE_UNLOCKED_UNOWNS_R_TO_V
	setflag ENGINE_UNLOCKED_UNOWNS_W_TO_Z
	; post-e4
	setflag ENGINE_CREDITS_SKIP
	; good party
	givepoke SNEASEL, 50, LEFTOVERS
	givepoke BEEDRILL, 50, LEFTOVERS
	givepoke VICTREEBEL, 50, LEFTOVERS
	givepoke CLOYSTER, 50, LEFTOVERS
	givepoke MAGMAR, 50, LEFTOVERS
	givepoke MAGNETON, 50, LEFTOVERS
	loadmem wPartyMon1Moves+0, BEAT_UP
	loadmem wPartyMon1Moves+1, ICY_WIND
	loadmem wPartyMon1Moves+2, SLASH
	loadmem wPartyMon1Moves+3, METAL_CLAW
	loadmem wPartyMon2Moves+0, PIN_MISSILE
	loadmem wPartyMon2Moves+1, SLUDGE_BOMB
	loadmem wPartyMon2Moves+2, FEINT_ATTACK
	loadmem wPartyMon2Moves+3, OUTRAGE
	loadmem wPartyMon2DVs+0, $ea
	loadmem wPartyMon2DVs+1, $aa
	loadmem wPartyMon3Moves+0, RAZOR_LEAF
	loadmem wPartyMon3Moves+1, ACID
	loadmem wPartyMon3Moves+2, WRAP
	loadmem wPartyMon3Moves+3, SLEEP_POWDER
	loadmem wPartyMon3DVs+0, $ea
	loadmem wPartyMon3DVs+1, $aa
	loadmem wPartyMon4Moves+0, AURORA_BEAM
	loadmem wPartyMon4Moves+1, PROTECT
	loadmem wPartyMon4Moves+2, SURF
	loadmem wPartyMon4Moves+3, SPIKE_CANNON
	loadmem wPartyMon5Moves+0, FLAMETHROWER
	loadmem wPartyMon5Moves+1, THUNDERPUNCH
	loadmem wPartyMon5Moves+2, FEINT_ATTACK
	loadmem wPartyMon5Moves+3, DIZZY_PUNCH
	loadmem wPartyMon5DVs+0, $ea
	loadmem wPartyMon5DVs+1, $aa
	loadmem wPartyMon6Moves+0, SPARK
	loadmem wPartyMon6Moves+1, SONICBOOM
	loadmem wPartyMon6Moves+2, DOUBLE_TEAM
	loadmem wPartyMon6Moves+3, THUNDER_WAVE
	loadmem wPartyMon6DVs+0, $ea
	loadmem wPartyMon6DVs+1, $aa

;	; Grant All Pokemon
	for x, NUM_POKEMON
	givepoke BULBASAUR + x, 50
endr
	; intro events
	addcellnum PHONE_MOM
	setmapscene PLAYERS_HOUSE_1F, $1
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	closetext
	end
else

	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayersRadioText1
	pause 45
	writetext PlayersRadioText2
	pause 45
	writetext PlayersRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

endc

PlayersHouseBookshelfScript:
if DEF(_DEBUG)
	opentext
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .TurnOffChallengeMode
	playsound SFX_PAY_DAY
	setflag ENGINE_CHALLENGE_MODE_ACTIVE
	writetext PlayersHouseBookshelfChallengeModeActivatedText
.cont:
	waitbutton
	closetext
	end

.TurnOffChallengeMode:
	playsound SFX_SHUT_DOWN_PC
	clearflag ENGINE_CHALLENGE_MODE_ACTIVE
	writetext PlayersHouseBookshelfChallengeModeDeactivatedText
	jump .cont
else
	jumpstd PictureBookshelfScript
endc

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

PlayersRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayersRadioText2:
	text "#MON CHANNEL!"
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersHouseBookshelfChallengeModeActivatedText:
	text "CHALLENGE MODE"
	line "ACTIVATED!"
	done

PlayersHouseBookshelfChallengeModeDeactivatedText:
	text "CHALLENGE MODE"
	line "DEACTIVATED!"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePosterScript

	def_object_events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseGameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseBigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
