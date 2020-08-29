; wInputType:: ; c2c7
AUTO_INPUT EQU $ff

; wCurrentDexMode:: ; c7d4
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN

; wMonType:: ; cf5f
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4

; wGameTimerPause:: ; cfbc
GAMETIMERPAUSE_TIMER_PAUSED_F EQU 0
GAMETIMERPAUSE_MOBILE_7_F     EQU 7

; wOptions:: (bits 4-7) ; cfcc
	const_def 4
	const NO_TEXT_SCROLL ; 4
	const STEREO         ; 5
	const BATTLE_SHIFT   ; 6
	const BATTLE_SCENE   ; 7

; wOptions:: (bits 0-2) ; cfcc
TEXT_DELAY_FAST EQU 1
TEXT_DELAY_MED  EQU 3
TEXT_DELAY_SLOW EQU 5

; wTextBoxFrame:: ; cfce
	const_def
	const FRAME_1 ; 0
	const FRAME_2 ; 1
	const FRAME_3 ; 2
	const FRAME_4 ; 3
	const FRAME_5 ; 4
	const FRAME_6 ; 5
	const FRAME_7 ; 6
	const FRAME_8 ; 7
NUM_FRAMES EQU const_value

; wTextBoxFlags:: ; cfcf
	const_def
	const FAST_TEXT_DELAY_F ; 0
	const NO_TEXT_DELAY_F   ; 1

; wGBPrinter:: ; cfd0
GBPRINTER_LIGHTEST EQU $00
GBPRINTER_LIGHTER  EQU $20
GBPRINTER_NORMAL   EQU $40
GBPRINTER_DARKER   EQU $60
GBPRINTER_DARKEST  EQU $7f

; wOptions2:: ; cfd1
	const_def
	const MENU_ACCOUNT ; 0

; wWalkingDirection:: ; d043
	const_def -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
NUM_DIRECTIONS EQU const_value

DOWN_MASK  EQU 1 << DOWN
UP_MASK    EQU 1 << UP
LEFT_MASK  EQU 1 << LEFT
RIGHT_MASK EQU 1 << RIGHT

; wFacingDirection:: ; d044
FACE_CURRENT EQU 0
FACE_DOWN    EQU 8
FACE_UP      EQU 4
FACE_LEFT    EQU 2
FACE_RIGHT   EQU 1

; wPokemonWithdrawDepositParameter:: ; d10b
PC_WITHDRAW       EQU 0
PC_DEPOSIT        EQU 1
REMOVE_PARTY      EQU 0
REMOVE_BOX        EQU 1
DAY_CARE_WITHDRAW EQU 2
DAY_CARE_DEPOSIT  EQU 3

; wInitListType:: ; d263
INIT_ENEMYOT_LIST    EQU 1
INIT_BAG_ITEM_LIST   EQU 2
INIT_OTHER_ITEM_LIST EQU 3
INIT_PLAYEROT_LIST   EQU 4
INIT_MON_LIST        EQU 5

; wTimeOfDay:: ; d269
	const_def
	const MORN_F     ; 0
	const DAY_F      ; 1
	const NITE_F     ; 2
	const DARKNESS_F ; 3
NUM_DAYTIMES EQU const_value

MORN     EQU 1 << MORN_F
DAY      EQU 1 << DAY_F
NITE     EQU 1 << NITE_F
DARKNESS EQU 1 << DARKNESS_F

ANYTIME EQU MORN | DAY | NITE

; wTimeOfDayPalset::
DARKNESS_PALSET EQU (DARKNESS_F << 6) | (DARKNESS_F << 4) | (DARKNESS_F << 2) | DARKNESS_F

; wPlayerSpriteSetupFlags:: ; d45b
PLAYERSPRITESETUP_FACING_MASK       EQU %11
PLAYERSPRITESETUP_FEMALE_TO_MALE_F  EQU 2
PLAYERSPRITESETUP_CUSTOM_FACING_F   EQU 5
PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F EQU 6
PLAYERSPRITESETUP_RESET_ACTION_F    EQU 7

; wPlayerGender:: ; d472
PLAYERGENDER_FEMALE_F EQU 0

; wScriptFlags:: ; d434
SCRIPT_RUNNING EQU 2

; wScriptMode:: ; d437
SCRIPT_OFF EQU 0
SCRIPT_READ EQU 1
SCRIPT_WAIT_MOVEMENT EQU 2
SCRIPT_WAIT EQU 3

; wSpawnAfterChampion:: ; d4b5
SPAWN_LANCE EQU 1
SPAWN_RED   EQU 2

; wCurDay:: ; d4cb
	const_def
	const SUNDAY    ; 0
	const MONDAY    ; 1
	const TUESDAY   ; 2
	const WEDNESDAY ; 3
	const THURSDAY  ; 4
	const FRIDAY    ; 5
	const SATURDAY  ; 6

; wMapObjects:: ; d71e
PLAYER_OBJECT EQU 0
NUM_OBJECTS   EQU $10

; wStatusFlags:: ; d84c
	const_def
	const STATUSFLAGS_POKEDEX_F                  ; 0
	const STATUSFLAGS_UNOWN_DEX_F                ; 1
	const STATUSFLAGS_FLASH_F                    ; 2
	const STATUSFLAGS_CAUGHT_POKERUS_F           ; 3
	const STATUSFLAGS_ROCKET_SIGNAL_F            ; 4
	const STATUSFLAGS_NO_WILD_ENCOUNTERS_F       ; 5
	const STATUSFLAGS_HALL_OF_FAME_F             ; 6
	const STATUSFLAGS_MAIN_MENU_MOBILE_CHOICES_F ; 7

; wStatusFlags2:: ; d84d
	const_def
	const STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F ; 0
	const STATUSFLAGS2_SAFARI_GAME_F            ; 1
	const STATUSFLAGS2_BUG_CONTEST_TIMER_F      ; 2
	const STATUSFLAGS2_UNUSED_3_F               ; 3
	const STATUSFLAGS2_BIKE_SHOP_CALL_F         ; 4
	const STATUSFLAGS2_UNUSED_5_F               ; 5
	const STATUSFLAGS2_REACHED_GOLDENROD_F      ; 6
	const STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F    ; 7

; wMomSavingMoney:: ; d854
MOM_SAVING_SOME_MONEY_F EQU 0
MOM_SAVING_HALF_MONEY_F EQU 1
MOM_SAVING_ALL_MONEY_F  EQU 2
MOM_ACTIVE_F            EQU 7

MOM_SAVING_MONEY_MASK EQU (1 << MOM_SAVING_SOME_MONEY_F) | (1 << MOM_SAVING_HALF_MONEY_F) | (1 << MOM_SAVING_ALL_MONEY_F)

; wJohtoBadges:: ; d857
	const_def
	const ZEPHYRBADGE
	const HIVEBADGE
	const PLAINBADGE
	const FOGBADGE
	const MINERALBADGE
	const STORMBADGE
	const GLACIERBADGE
	const RISINGBADGE
NUM_JOHTO_BADGES EQU const_value

; wKantoBadges:: ; d858
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
NUM_KANTO_BADGES EQU const_value
NUM_BADGES EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; wPokegearFlags:: ; d957
	const_def
	const POKEGEAR_MAP_CARD_F   ; 0
	const POKEGEAR_RADIO_CARD_F ; 1
	const POKEGEAR_PHONE_CARD_F ; 2
	const POKEGEAR_EXPN_CARD_F  ; 3
	const POKEGEAR_PAGER_CARD_F ; 4

POKEGEAR_OBTAINED_F EQU 7

; wPagerFlags::
	const_def
	const PAGER_CUT_F        ; 0
	const PAGER_FLY_F        ; 1
	const PAGER_SURF_F       ; 2
	const PAGER_STRENGTH_F   ; 3
	const PAGER_FLASH_F      ; 4
	const PAGER_WHIRLPOOL_F  ; 5
	const PAGER_ROCK_SMASH_F ; 6
NUM_PAGER_FLAGS EQU const_value

; wWhichRegisteredItem:: ; d95b
REGISTERED_POCKET EQU %11000000
REGISTERED_NUMBER EQU %00111111

; wPlayerState:: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SKATE     EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8

; wCelebiEvent:: ; dbf3
CELEBIEVENT_FOREST_IS_RESTLESS_F EQU 2

; wBikeFlags:: ; dbf5
	const_def
	const BIKEFLAGS_STRENGTH_ACTIVE_F ; 0
	const BIKEFLAGS_ALWAYS_ON_BIKE_F  ; 1
	const BIKEFLAGS_DOWNHILL_F        ; 2

; wDailyFlags:: ; dc1e    maximum of 64 slots, if more space needed reallocat in wram.asm 2699 and time.asm 94
	const_def
	const DAILYFLAGS_KURT_MAKING_BALLS_F             ; 0
	const DAILYFLAGS_BUG_CONTEST_F                   ; 1
	const DAILYFLAGS_FISH_SWARM_F                    ; 2
	const DAILYFLAGS_TIME_CAPSULE_F                  ; 3
	const DAILYFLAGS_ALL_FRUIT_TREES_F               ; 4
	const DAILYFLAGS_GOT_SHUCKIE_TODAY_F             ; 5
	const DAILYFLAGS_GOLDENROD_UNDERGROUND_BARGAIN_F ; 6
	const DAILYFLAGS_TRAINER_HOUSE_F                 ; 7
	const DAILYFLAGS_ROUTE29_BERRY                   ; 8
	const DAILYFLAGS_ROUTE29_APRICORN                ; 9
	const DAILYFLAGS_ROUTE30_BERRY                   ; 10
	const DAILYFLAGS_ROUTE30_BERRY2                  ; 11
	const DAILYFLAGS_ROUTE30_APRICORN                ; 12
	const DAILYFLAGS_ROUTE30_APRICORN2               ; 13
	const DAILYFLAGS_ROUTE31_BERRY                   ; 14
	const DAILYFLAGS_ROUTE31_APRICORN                ; 15
	const DAILYFLAGS_VIOLET_BERRY                    ; 16
	const DAILYFLAGS_VIOLET_APRICORN                 ; 17
	const DAILYFLAGS_ROUTE33_BERRY                   ; 18
	const DAILYFLAGS_ROUTE33_APRICORN                ; 19
	const DAILYFLAGS_ROUTE33_APRICORN2               ; 20
	const DAILYFLAGS_AZALEA_APRICORN                 ; 21
	const DAILYFLAGS_ROUTE35_BERRY                   ; 22
	const DAILYFLAGS_ROUTE35_APRICORN                ; 23
	const DAILYFLAGS_ROUTE36_BERRY                   ; 24
	const DAILYFLAGS_ROUTE36_APRICORN                ; 25
	const DAILYFLAGS_ROUTE37_APRICORN                ; 26
	const DAILYFLAGS_ROUTE37_APRICORN2               ; 27
	const DAILYFLAGS_ROUTE37_APRICORN3               ; 28
	const DAILYFLAGS_ROUTE38_BERRY                   ; 29
	const DAILYFLAGS_ROUTE38_APRICORN                ; 30
	const DAILYFLAGS_ROUTE39_BERRY                   ; 31
	const DAILYFLAGS_ROUTE39_APRICORN                ; 32
	const DAILYFLAGS_ROUTE42_APRICORN                ; 33
	const DAILYFLAGS_ROUTE42_APRICORN2               ; 34
	const DAILYFLAGS_ROUTE42_APRICORN3               ; 35
	const DAILYFLAGS_ROUTE43_BERRY                   ; 36
	const DAILYFLAGS_ROUTE43_APRICORN                ; 37
	const DAILYFLAGS_ROUTE44_BERRY                   ; 38
	const DAILYFLAGS_ROUTE44_APRICORN                ; 39
	const DAILYFLAGS_ROUTE45_BERRY                   ; 40
	const DAILYFLAGS_ROUTE45_APRICORN                ; 41
	const DAILYFLAGS_ROUTE46_BERRY                   ; 42
	const DAILYFLAGS_ROUTE46_BERRY2                  ; 43
	const DAILYFLAGS_ROUTE46_APRICORN                ; 44
	const DAILYFLAGS_ROUTE46_APRICORN2               ; 45
	const DAILYFLAGS_ROUTE26_BERRY                   ; 46
	const DAILYFLAGS_ROUTE26_APRICORN                ; 47
	const DAILYFLAGS_ROUTE1_BERRY                    ; 48
	const DAILYFLAGS_ROUTE1_APRICORN                 ; 49
	const DAILYFLAGS_VIRIDIAN_FOREST_BERRY           ; 50
	const DAILYFLAGS_VIRIDIAN_FOREST_APRICORN        ; 51
	const DAILYFLAGS_PEWTER_BERRY                    ; 52
	const DAILYFLAGS_PEWTER_BERRY2                   ; 53
	const DAILYFLAGS_PEWTER_APRICORN                 ; 54
	const DAILYFLAGS_PEWTER_APRICORN2                ; 55
	const DAILYFLAGS_ROUTE8_BERRY                    ; 56
	const DAILYFLAGS_ROUTE8_APRICORN                 ; 57
	const DAILYFLAGS_ROUTE11_BERRY                   ; 58
	const DAILYFLAGS_ROUTE11_APRICORN                ; 59
	const DAILYFLAGS_FUCHSIA_BERRY                   ; 60
	const DAILYFLAGS_FUCHSIA_APRICORN                ; 61

; wWeeklyFlags:: ; dc1f
	const_def
	const WEEKLYFLAGS_MT_MOON_SQUARE_CLEFAIRY_F ; 0
	const WEEKLYFLAGS_UNION_CAVE_LAPRAS_F ; 1
	const WEEKLYFLAGS_GOLDENROD_UNDERGROUND_GOT_HAIRCUT_F ; 2
	const WEEKLYFLAGS_GOLDENROD_DEPT_STORE_TM27_RETURN_F ; 3
	const WEEKLYFLAGS_DAISYS_GROOMING_F ; 4
	const WEEKLYFLAGS_INDIGO_PLATEAU_RIVAL_FIGHT_F ; 5
	const WEEKLYFLAGS_DAILY_MOVE_TUTOR_F ; 6
	const WEEKLYFLAGS_BUENAS_PASSWORD_F ; 7

; wSwarmFlags:: ; dc20
	const_def
	const SWARMFLAGS_BUENAS_PASSWORD_F           ; 0
	const SWARMFLAGS_GOLDENROD_DEPT_STORE_SALE_F ; 1
	const SWARMFLAGS_DUNSPARCE_SWARM_F           ; 2
	const SWARMFLAGS_YANMA_SWARM_F               ; 3
	const SWARMFLAGS_MOBILE_4_F                  ; 4

; wLuckyNumberShowFlag:: ; dc9d
LUCKYNUMBERSHOW_GAME_OVER_F EQU 0

; wDayCareMan:: ; def5
DAYCAREMAN_HAS_MON_F         EQU 0
DAYCAREMAN_MONS_COMPATIBLE_F EQU 5
DAYCAREMAN_HAS_EGG_F         EQU 6
DAYCAREMAN_ACTIVE_F          EQU 7

; wDayCareLady:: ; df2c
DAYCARELADY_HAS_MON_F        EQU 0
DAYCARELADY_ACTIVE_F         EQU 7
