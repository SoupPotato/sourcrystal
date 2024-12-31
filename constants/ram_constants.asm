; wInputType::
DEF AUTO_INPUT EQU $ff

; wDebugFlags::
	const_def
	const DEBUG_BATTLE_F
	const DEBUG_FIELD_F

; wCurDexMode::
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN

; wMonType::
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4
	const BUFFERMON  ; 5

; wJumptableIndex::
DEF JUMPTABLE_INDEX_MASK EQU %01111111
	const_def 7
	shift_const JUMPTABLE_EXIT

; wGameTimerPaused::
DEF GAME_TIMER_COUNTING_F EQU 0
DEF GAME_TIMER_MOBILE_F   EQU 7

; wJoypadDisable::
DEF JOYPAD_DISABLE_MON_FAINT_F    EQU 6
DEF JOYPAD_DISABLE_SGB_TRANSFER_F EQU 7

; wInBattleTowerBattle::
DEF IN_BATTLE_TOWER_BATTLE_F EQU 0

; wOptions1::
DEF TEXT_DELAY_MASK EQU %111
	const_def 4
	const NO_TEXT_SCROLL ; 4
	const STEREO         ; 5
	const BATTLE_SHIFT   ; 6
	const BATTLE_SCENE   ; 7

DEF TEXT_DELAY_FAST EQU %001 ; 1
DEF TEXT_DELAY_MED  EQU %011 ; 3
DEF TEXT_DELAY_SLOW EQU %101 ; 5

; wTextboxFrame::
	const_def
	const FRAME_1 ; 0
	const FRAME_2 ; 1
	const FRAME_3 ; 2
	const FRAME_4 ; 3
	const FRAME_5 ; 4
	const FRAME_6 ; 5
	const FRAME_7 ; 6
	const FRAME_8 ; 7
DEF NUM_FRAMES EQU const_value

; wTextboxFlags::
	const_def
	const FAST_TEXT_DELAY_F ; 0
	const TEXT_DELAY_F      ; 1

; wGBPrinterBrightness::
DEF GBPRINTER_LIGHTEST EQU $00
DEF GBPRINTER_LIGHTER  EQU $20
DEF GBPRINTER_NORMAL   EQU $40
DEF GBPRINTER_DARKER   EQU $60
DEF GBPRINTER_DARKEST  EQU $7f

; wOptions2::
	const_def
	const MENU_ACCOUNT ; 0

; wDST::
DEF DST_F EQU 7

; wWalkingDirection::
	const_def -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
DEF NUM_DIRECTIONS EQU const_value

DEF DOWN_MASK  EQU 1 << DOWN
DEF UP_MASK    EQU 1 << UP
DEF LEFT_MASK  EQU 1 << LEFT
DEF RIGHT_MASK EQU 1 << RIGHT

; wFacingDirection::
	const_def NUM_DIRECTIONS - 1, -1
	shift_const FACE_DOWN  ; 8
	shift_const FACE_UP    ; 4
	shift_const FACE_LEFT  ; 2
	shift_const FACE_RIGHT ; 1
DEF FACE_CURRENT EQU 0

; wStateFlags
DEF SPRITE_UPDATES_DISABLED_F             EQU 0
DEF LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F EQU 1
DEF TEXT_STATE_F                          EQU 6
DEF SCRIPTED_MOVEMENT_STATE_F             EQU 7

; wSpriteFlags::
DEF SPRITES_VRAM_BANK_0_F       EQU 5
DEF SPRITES_SKIP_WALKING_GFX_F  EQU 6
DEF SPRITES_SKIP_STANDING_GFX_F EQU 7

; wPokemonWithdrawDepositParameter::
DEF PC_WITHDRAW       EQU 0
DEF PC_DEPOSIT        EQU 1
DEF REMOVE_PARTY      EQU 0
DEF REMOVE_BOX        EQU 1
DEF DAY_CARE_WITHDRAW EQU 2
DEF DAY_CARE_DEPOSIT  EQU 3

; wPlayerStepFlags::
	const_def 4
	const PLAYERSTEP_MIDAIR_F   ; 4
	const PLAYERSTEP_CONTINUE_F ; 5
	const PLAYERSTEP_STOP_F     ; 6
	const PLAYERSTEP_START_F    ; 7

; wInitListType::
DEF INIT_ENEMYOT_LIST    EQU 1
DEF INIT_BAG_ITEM_LIST   EQU 2
DEF INIT_OTHER_ITEM_LIST EQU 3
DEF INIT_PLAYEROT_LIST   EQU 4
DEF INIT_MON_LIST        EQU 5

; wMapNameSignFlags::
	const_def 1
	const SHOWN_MAP_NAME_SIGN ; 1

; wTimeOfDay::
	const_def
	shift_const MORN ; 0
	shift_const DAY  ; 1
	shift_const NITE ; 2
	shift_const EVE  ; 3
DEF NUM_DAYTIMES EQU const_value

DEF ANYTIME EQU MORN | DAY | EVE | NITE

; wTimeOfDayPalFlags::
DEF FORCED_PALSET_F EQU 7

; wTimeOfDayPalset::
; Must be different from any in ReplaceTimeOfDayPals.BrightnessLevels
DEF DARKNESS_PALSET EQU (MORN_F << 6) | (DAY_F << 4) | (EVE_F << 2) | NITE_F

; wBattleAnimFlags::
	const_def
	const BATTLEANIM_STOP_F          ; 0
	const BATTLEANIM_IN_SUBROUTINE_F ; 1
	const BATTLEANIM_IN_LOOP_F       ; 2
	const BATTLEANIM_KEEPSPRITES_F   ; 3

; wBattleScriptFlags::
DEF BATTLESCRIPT_WILD_F     EQU 0
DEF BATTLESCRIPT_SCRIPTED_F EQU 7

; wPlayerSpriteSetupFlags::
DEF PLAYERSPRITESETUP_FACING_MASK       EQU %11
DEF PLAYERSPRITESETUP_FEMALE_TO_MALE_F  EQU 2
DEF PLAYERSPRITESETUP_CUSTOM_FACING_F   EQU 5
DEF PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F EQU 6
DEF PLAYERSPRITESETUP_RESET_ACTION_F    EQU 7

; wPlayerGender::
DEF PLAYERGENDER_FEMALE_F EQU 0

; wMapStatus::
	const_def
	const MAPSTATUS_START  ; 0
	const MAPSTATUS_ENTER  ; 1
	const MAPSTATUS_HANDLE ; 2
	const MAPSTATUS_DONE   ; 3

; wMapEventStatus::
	const_def
	const MAPEVENTS_ON  ; 0
	const MAPEVENTS_OFF ; 1

; wScriptFlags::
	const_def
	const UNUSED_SCRIPT_FLAG_0 ; 0
	const UNUSED_SCRIPT_FLAG_1 ; 1
	const SCRIPT_RUNNING       ; 2
	const RUN_DEFERRED_SCRIPT  ; 3

; wEnabledPlayerEvents::
	const_def
	const PLAYEREVENTS_COUNT_STEPS           ; 0
	const PLAYEREVENTS_COORD_EVENTS          ; 1
	const PLAYEREVENTS_WARPS_AND_CONNECTIONS ; 2
	const_skip
	const PLAYEREVENTS_WILD_ENCOUNTERS       ; 4
	const PLAYEREVENTS_UNUSED                ; 5

; wScriptMode::
	const_def
	const SCRIPT_OFF
	const SCRIPT_READ
	const SCRIPT_WAIT_MOVEMENT
	const SCRIPT_WAIT

; wSpawnAfterChampion::
DEF SPAWN_LANCE EQU 1
DEF SPAWN_RED   EQU 2

; wGameTimeCap::
DEF GAME_TIME_CAPPED EQU 0

; wCurDay::
	const_def
	const SUNDAY    ; 0
	const MONDAY    ; 1
	const TUESDAY   ; 2
	const WEDNESDAY ; 3
	const THURSDAY  ; 4
	const FRIDAY    ; 5
	const SATURDAY  ; 6

; wStatusFlags::
	const_def
	const STATUSFLAGS_POKEDEX_F                  ; 0
	const STATUSFLAGS_UNOWN_DEX_F                ; 1
	const STATUSFLAGS_FLASH_F                    ; 2
	const STATUSFLAGS_CAUGHT_POKERUS_F           ; 3
	const STATUSFLAGS_ROCKET_SIGNAL_F            ; 4
	const STATUSFLAGS_NO_WILD_ENCOUNTERS_F       ; 5
	const STATUSFLAGS_HALL_OF_FAME_F             ; 6
	const STATUSFLAGS_MAIN_MENU_MOBILE_CHOICES_F ; 7

; wStatusFlags2::
	const_def
	const STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F ; 0
	const STATUSFLAGS2_SAFARI_GAME_F            ; 1
	const STATUSFLAGS2_BUG_CONTEST_TIMER_F      ; 2
	const STATUSFLAGS2_UNUSED_3_F               ; 3
	const STATUSFLAGS2_BIKE_SHOP_CALL_F         ; 4
	const STATUSFLAGS2_UNUSED_5_F               ; 5
	const STATUSFLAGS2_REACHED_GOLDENROD_F      ; 6
	const STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F    ; 7

; wMomSavingMoney::
DEF MOM_SAVING_SOME_MONEY_F EQU 0
DEF MOM_SAVING_HALF_MONEY_F EQU 1
DEF MOM_SAVING_ALL_MONEY_F  EQU 2
DEF MOM_ACTIVE_F            EQU 7

DEF MOM_SAVING_MONEY_MASK EQU (1 << MOM_SAVING_SOME_MONEY_F) | (1 << MOM_SAVING_HALF_MONEY_F) | (1 << MOM_SAVING_ALL_MONEY_F)

; wJohtoBadges::
	const_def
	const ZEPHYRBADGE
	const HIVEBADGE
	const PLAINBADGE
	const FOGBADGE
	const MINERALBADGE
	const STORMBADGE
	const GLACIERBADGE
	const RISINGBADGE
DEF NUM_JOHTO_BADGES EQU const_value

; wKantoBadges::
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
DEF NUM_KANTO_BADGES EQU const_value
DEF NUM_BADGES       EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; wPokegearFlags:: ; d957
	const_def
	const POKEGEAR_MAP_CARD_F   ; 0
	const POKEGEAR_RADIO_CARD_F ; 1
	const POKEGEAR_PHONE_CARD_F ; 2
	const POKEGEAR_EXPN_CARD_F  ; 3
	const POKEGEAR_PAGER_CARD_F ; 4

DEF POKEGEAR_OBTAINED_F EQU 7

; wPagerFlags::
	const_def
	const PAGER_CUT_F        ; 0
	const PAGER_FLY_F        ; 1
	const PAGER_SURF_F       ; 2
	const PAGER_STRENGTH_F   ; 3
	const PAGER_FLASH_F      ; 4
	const PAGER_WHIRLPOOL_F  ; 5
	const PAGER_ROCK_SMASH_F ; 6
DEF NUM_PAGER_FLAGS EQU const_value

; wWhichRegisteredItem::
DEF REGISTERED_POCKET EQU %11000000
DEF REGISTERED_NUMBER EQU %00111111

; wPlayerState::
DEF PLAYER_NORMAL    EQU 0
DEF PLAYER_BIKE      EQU 1
DEF PLAYER_SKATE     EQU 2
DEF PLAYER_SURF      EQU 4
DEF PLAYER_SURF_PIKA EQU 8

; wCelebiEvent::
DEF CELEBIEVENT_FOREST_IS_RESTLESS_F EQU 2

; wBikeFlags::
	const_def
	const BIKEFLAGS_STRENGTH_ACTIVE_F ; 0
	const BIKEFLAGS_ALWAYS_ON_BIKE_F  ; 1
	const BIKEFLAGS_DOWNHILL_F        ; 2

; wDailyFlags1::
	const_def
	const DAILYFLAGS1_KURT_MAKING_BALLS_F             ; 0
	const DAILYFLAGS1_BUG_CONTEST_F                   ; 1
	const DAILYFLAGS1_SWARM_F                         ; 2
	const DAILYFLAGS1_TIME_CAPSULE_F                  ; 3
	const DAILYFLAGS1_ALL_FRUIT_TREES_F               ; 4
	const DAILYFLAGS1_GOT_SHUCKIE_TODAY_F             ; 5
	const DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F ; 6
	const DAILYFLAGS1_TRAINER_HOUSE_F                 ; 7
	const DAILYFLAGS_ROUTE29_BERRY                    ; 8
	const DAILYFLAGS_ROUTE29_APRICORN                 ; 9
	const DAILYFLAGS_ROUTE30_BERRY                    ; 10
	const DAILYFLAGS_ROUTE30_BERRY2                   ; 11
	const DAILYFLAGS_ROUTE30_APRICORN                 ; 12
	const DAILYFLAGS_ROUTE30_APRICORN2                ; 13
	const DAILYFLAGS_ROUTE31_BERRY                    ; 14
	const DAILYFLAGS_ROUTE31_APRICORN                 ; 15
	const DAILYFLAGS_VIOLET_BERRY                     ; 16
	const DAILYFLAGS_VIOLET_APRICORN                  ; 17
	const DAILYFLAGS_ROUTE33_BERRY                    ; 18
	const DAILYFLAGS_ROUTE33_APRICORN                 ; 19
	const DAILYFLAGS_ROUTE33_APRICORN2                ; 20
	const DAILYFLAGS_AZALEA_APRICORN                  ; 21
	const DAILYFLAGS_ROUTE35_BERRY                    ; 22
	const DAILYFLAGS_ROUTE35_APRICORN                 ; 23
	const DAILYFLAGS_ROUTE36_BERRY                    ; 24
	const DAILYFLAGS_ROUTE36_APRICORN                 ; 25
	const DAILYFLAGS_ROUTE37_APRICORN                 ; 26
	const DAILYFLAGS_ROUTE37_APRICORN2                ; 27
	const DAILYFLAGS_ROUTE37_APRICORN3                ; 28
	const DAILYFLAGS_ROUTE38_BERRY                    ; 29
	const DAILYFLAGS_ROUTE38_APRICORN                 ; 30
	const DAILYFLAGS_ROUTE39_BERRY                    ; 31
	const DAILYFLAGS_ROUTE39_APRICORN                 ; 32
	const DAILYFLAGS_ROUTE42_APRICORN                 ; 33
	const DAILYFLAGS_ROUTE42_APRICORN2                ; 34
	const DAILYFLAGS_ROUTE42_APRICORN3                ; 35
	const DAILYFLAGS_ROUTE43_BERRY                    ; 36
	const DAILYFLAGS_ROUTE43_APRICORN                 ; 37
	const DAILYFLAGS_ROUTE44_BERRY                    ; 38
	const DAILYFLAGS_ROUTE44_APRICORN                 ; 39
	const DAILYFLAGS_ROUTE45_BERRY                    ; 40
	const DAILYFLAGS_ROUTE45_APRICORN                 ; 41
	const DAILYFLAGS_ROUTE46_BERRY                    ; 42
	const DAILYFLAGS_ROUTE46_BERRY2                   ; 43
	const DAILYFLAGS_ROUTE46_APRICORN                 ; 44
	const DAILYFLAGS_ROUTE46_APRICORN2                ; 45
	const DAILYFLAGS_ROUTE26_BERRY                    ; 46
	const DAILYFLAGS_ROUTE26_APRICORN                 ; 47
	const DAILYFLAGS_ROUTE1_BERRY                     ; 48
	const DAILYFLAGS_ROUTE1_APRICORN                  ; 49
	const DAILYFLAGS_VIRIDIAN_FOREST_BERRY            ; 50
	const DAILYFLAGS_VIRIDIAN_FOREST_APRICORN         ; 51
	const DAILYFLAGS_PEWTER_BERRY                     ; 52
	const DAILYFLAGS_PEWTER_BERRY2                    ; 53
	const DAILYFLAGS_PEWTER_APRICORN                  ; 54
	const DAILYFLAGS_PEWTER_APRICORN2                 ; 55
	const DAILYFLAGS_ROUTE8_BERRY                     ; 56
	const DAILYFLAGS_ROUTE8_APRICORN                  ; 57
	const DAILYFLAGS_ROUTE11_BERRY                    ; 58
	const DAILYFLAGS_ROUTE11_APRICORN                 ; 59
	const DAILYFLAGS_FUCHSIA_BERRY                    ; 60
	const DAILYFLAGS_FUCHSIA_APRICORN                 ; 61
	const DAILYFLAGS_ILEX_FOREST_MUSHROOM_1           ; 62
	const DAILYFLAGS_ILEX_FOREST_MUSHROOM_2           ; 63
	const DAILYFLAGS_ILEX_FOREST_MUSHROOM_3           ; 64
	const DAILYFLAGS_MOUNT_MOON_1F_MUSHROOM           ; 65
	const DAILYFLAGS_MOUNT_MOON_B1F_MUSHROOM          ; 66
	const DAILYFLAGS_MOUNT_MOON_B2F_MUSHROOM          ; 67
	const DAILYFLAGS_ROUTE13_BERRY                    ; 68
	const DAILYFLAGS_SILVER_CAVE_OUTSIDE_BERRY        ; 69
	const DAILYFLAGS_FALKNER_REMATCH                  ; 70
	const DAILYFLAGS_BUGSY_REMATCH                    ; 71
	const DAILYFLAGS_WHITNEY_REMATCH                  ; 72
	const DAILYFLAGS_MORTY_REMATCH                    ; 73
	const DAILYFLAGS_CHUCK_REMATCH                    ; 74
	const DAILYFLAGS_JASMINE_REMATCH                  ; 75
	const DAILYFLAGS_PRYCE_REMATCH                    ; 76
	const DAILYFLAGS_CLAIR_REMATCH                    ; 77
	const DAILYFLAGS_BROCK_REMATCH                    ; 78
	const DAILYFLAGS_MISTY_REMATCH                    ; 79
	const DAILYFLAGS_LTSURGE_REMATCH                  ; 80
	const DAILYFLAGS_ERIKA_REMATCH                    ; 81
	const DAILYFLAGS_JANINE_REMATCH                   ; 82
	const DAILYFLAGS_SABRINA_REMATCH                  ; 83
	const DAILYFLAGS_BLAINE_REMATCH                   ; 84
	const DAILYFLAGS_BLUE_REMATCH                     ; 85

; wDailyFlags2::
	const_def
	const DAILYFLAGS2_MT_MOON_SQUARE_CLEFAIRY_F           ; 0
	const DAILYFLAGS2_UNION_CAVE_LAPRAS_F                 ; 1
	const DAILYFLAGS2_GOLDENROD_UNDERGROUND_GOT_HAIRCUT_F ; 2
	const DAILYFLAGS2_GOLDENROD_DEPT_STORE_TM27_RETURN_F  ; 3
	const DAILYFLAGS2_DAISYS_GROOMING_F                   ; 4
	const DAILYFLAGS2_INDIGO_PLATEAU_RIVAL_FIGHT_F        ; 5
	const DAILYFLAGS2_MOVE_TUTOR_F                        ; 6
	const DAILYFLAGS2_BUENAS_PASSWORD_F                   ; 7

; wSwarmFlags::
	const_def
	const SWARMFLAGS_BUENAS_PASSWORD_F           ; 0
	const SWARMFLAGS_GOLDENROD_DEPT_STORE_SALE_F ; 1
	const SWARMFLAGS_ALT_SWARM_F                 ; 2
	const SWARMFLAGS_SWARM_ACTIVE                ; 3
	const SWARMFLAGS_MOBILE_4_F                  ; 4
	const SWARMFLAGS_LOAD_POKEGEAR_GFX_F         ; 5

; wLuckyNumberShowFlag::
DEF LUCKYNUMBERSHOW_GAME_OVER_F EQU 0

; wDayCareMan::
DEF DAYCAREMAN_HAS_MON_F         EQU 0
DEF DAYCAREMAN_MONS_COMPATIBLE_F EQU 5
DEF DAYCAREMAN_HAS_EGG_F         EQU 6
DEF DAYCAREMAN_ACTIVE_F          EQU 7

; wDayCareLady::
DEF DAYCARELADY_HAS_MON_F        EQU 0
DEF DAYCARELADY_ACTIVE_F         EQU 7

; wChallengeMode::
	const_def
	const GAME_CHALLENGE_MODE_F ; 0

; wUnlockedUnowns::
	const_def
	const UNLOCKED_UNOWNS_A_TO_J_F
	const UNLOCKED_UNOWNS_K_TO_Q_F
	const UNLOCKED_UNOWNS_R_TO_V_F
	const UNLOCKED_UNOWNS_W_TO_Z_F
DEF NUM_UNLOCKED_UNOWN_SETS EQU const_value

; wPalFlags
	const_def
	const NO_DYN_PAL_APPLY_ONCE_F        ; 0
	const SCAN_OBJECTS_FIRST_F           ; 1
	const USE_DAYTIME_PAL_F              ; 2
	const DISABLE_DYN_PAL_F              ; 3
	const NO_DYN_PAL_APPLY_UNTIL_RESET_F ; 4
	const MAP_CONNECTION_PAL_F           ; 5
DEF NO_DYN_PAL_APPLY EQU (1 << NO_DYN_PAL_APPLY_ONCE_F) | (1 << NO_DYN_PAL_APPLY_UNTIL_RESET_F)

; wMapSetupFlags
	const_def
	const MAPSETUP_CONNECTION_F ; 0

; wPalFadeMode::
DEF PALFADE_WHICH        EQU %11
DEF PALFADE_FLASH_F      EQU 2
DEF PALFADE_PARTIAL_F    EQU 3
DEF PALFADE_SKIP_FIRST_F EQU 4

; hBattlePalFadeMode::
DEF PALFADE_BOTH       EQU %00
DEF PALFADE_BG         EQU %01
DEF PALFADE_OBJ        EQU %10
DEF PALFADE_FLASH      EQU 1 << PALFADE_FLASH_F
DEF PALFADE_PARTIAL    EQU 1 << PALFADE_PARTIAL_F
DEF PALFADE_SKIP_FIRST EQU 1 << PALFADE_SKIP_FIRST_F

; sRTCStatusFlags::
	const_def 5
	shift_const RTC_DAYS_EXCEED_139 ; 5
	shift_const RTC_DAYS_EXCEED_255 ; 6
	shift_const RTC_RESET           ; 7

; hVBlank::
; VBlankHandlers indexes (see home/vblank.asm)
	const_def
	const VBLANK_NORMAL       ; 0
	const VBLANK_CUTSCENE     ; 1
	const VBLANK_SOUND_ONLY   ; 2
	const VBLANK_CUTSCENE_CGB ; 3
	const VBLANK_SERIAL       ; 4
	const VBLANK_CREDITS      ; 5
	const VBLANK_DMA_TRANSFER ; 6
	const VBLANK_UNUSED       ; 7
DEF NUM_VBLANK_HANDLERS EQU const_value
