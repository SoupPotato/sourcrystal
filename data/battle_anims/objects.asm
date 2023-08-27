ABSOLUTE_X EQU $00
RELATIVE_X EQU $01

MACRO battleanimobj
	db \1 ; flags
	; bit 7: priority
	; bit 6: y flip (for enemy)
	; bit 5: x flip (for enemy)
	; bit 0: enable enemy animation coord fixing (x = $b4 - x; see below for y)
	db \2 ; enemy animation y fix param
	; if $FF: y = y + 5 tiles
	; else:   y = -y - (1 tile) * (is_softboiled_animation)
	db \3 ; video sequence
	db \4 ; callback
	db \5 ; palette
	db \6 ; tile offset
ENDM

BattleAnimObjects:
; entries correspond to ANIM_OBJ_* constants
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_BIG_YFIX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_YFIX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_SMALL_YFIX
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_BIG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_SMALL
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_03, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_PUNCH
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_04, BATTLEANIMFUNC_1B, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_KICK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_PALM
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_06, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_FANG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_07, BATTLEANIMFUNC_09, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_PUNCH_SHAKE
	battleanimobj RELATIVE_X, $aa, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_10, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_EMBER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0E, BATTLEANIMFUNC_04, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_DRAGON_RAGE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_03, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_FLAMETHROWER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_08, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_FIRE_SPIN
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_0A, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_FIRE_BLAST
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_BURNED
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_12, BATTLEANIMFUNC_08, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_BLIZZARD
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_13, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_ICE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_01, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_ICE_BEAM
	battleanimobj RELATIVE_X | X_FLIP, $78, BATTLEANIMFRAMESET_16, BATTLEANIMFUNC_RAZOR_LEAF, PAL_BATTLE_OB_GREEN, $06 ; ANIM_OBJ_RAZOR_LEAF
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_12, PAL_BATTLE_OB_RED, $0b ; ANIM_OBJ_POKE_BALL
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_13, PAL_BATTLE_OB_RED, $0b ; ANIM_OBJ_POKE_BALL_BLOCKED
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_00, PAL_BATTLE_OB_RED, $08 ; ANIM_OBJ_EXPLOSION1
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_00, PAL_BATTLE_OB_RED, $08 ; ANIM_OBJ_EXPLOSION2
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_06, PAL_BATTLE_OB_GRAY, $0c ; ANIM_OBJ_ACID
	battleanimobj RELATIVE_X, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_38, PAL_BATTLE_OB_GRAY, $0c ; ANIM_OBJ_SLUDGE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $07 ; ANIM_OBJ_BETA_BALL_POOF
	battleanimobj RELATIVE_X, $a0, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $07 ; ANIM_OBJ_BALL_POOF
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_07, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_BIG_ROCK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_07, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_SMALL_ROCK
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_1B, BATTLEANIMFUNC_36, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_STRENGTH
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_36, PAL_BATTLE_OB_BLUE, $21 ; ANIM_OBJ_SEISMIC_TOSS
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_0C, PAL_BATTLE_OB_BLUE, $0d ; ANIM_OBJ_BUBBLE
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_23, BATTLEANIMFUNC_0D, PAL_BATTLE_OB_BLUE, $0d ; ANIM_OBJ_SURF
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_0E, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_SING
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $80, BATTLEANIMFRAMESET_27, BATTLEANIMFUNC_0F, PAL_BATTLE_OB_BLUE, $04 ; ANIM_OBJ_WATER_GUN
	battleanimobj RELATIVE_X, $b4, BATTLEANIMFRAMESET_2A, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $04 ; ANIM_OBJ_HYDRO_PUMP
	battleanimobj RELATIVE_X, $40, BATTLEANIMFRAMESET_2B, BATTLEANIMFUNC_11, PAL_BATTLE_OB_YELLOW, $0f ; ANIM_OBJ_POWDER
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_2C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_BEAM
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_BEAM_TIP
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_2E, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_ICE_BUILDUP
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_2F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_FROZEN
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_14, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_MASTER_BALL_SPARKLE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_BB, BATTLEANIMFUNC_14, PAL_BATTLE_OB_YELLOW, $0d ; ANIM_OBJ_RECOVER
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_THUNDER1
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_32, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_THUNDER2
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_33, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_THUNDER3
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_15, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_THUNDER_WAVE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_36, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_SPARKS_CIRCLE_BIG
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_37, BATTLEANIMFUNC_03, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_THUNDERBOLT_BALL
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_38, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_SPARKS_CIRCLE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_39, BATTLEANIMFUNC_03, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_THUNDERSHOCK_BALL
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_3A, BATTLEANIMFUNC_16, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CLAMP
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_3C, BATTLEANIMFUNC_17, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_BITE
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_3E, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_DOWN_LEFT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_DOWN_RIGHT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_40, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_UP_RIGHT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_41, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_LONG_DOWN_LEFT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_42, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_LONG_DOWN_RIGHT
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_18, PAL_BATTLE_OB_YELLOW, $12 ; ANIM_OBJ_SOLAR_BEAM_CHARGE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_44, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $12 ; ANIM_OBJ_ABSORB_CENTER
	battleanimobj RELATIVE_X | X_FLIP, $b8, BATTLEANIMFRAMESET_45, BATTLEANIMFUNC_19, PAL_BATTLE_OB_GRAY, $13 ; ANIM_OBJ_GUST
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_46, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, $14 ; ANIM_OBJ_VINE_WHIP1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_47, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, $14 ; ANIM_OBJ_VINE_WHIP2
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_48, BATTLEANIMFUNC_1A, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_RAZOR_WIND1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_49, BATTLEANIMFUNC_1A, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_RAZOR_WIND2
	battleanimobj RELATIVE_X | X_FLIP, $98, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_01, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_SONICBOOM_JP
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_4B, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_WARP
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_1C, PAL_BATTLE_OB_YELLOW, $12 ; ANIM_OBJ_ABSORB
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_4D, BATTLEANIMFUNC_1D, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_EGG
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_51, BATTLEANIMFUNC_1E, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_FOCUS
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_52, BATTLEANIMFUNC_1F, PAL_BATTLE_OB_GREEN, $16 ; ANIM_OBJ_BIND1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_54, BATTLEANIMFUNC_1F, PAL_BATTLE_OB_GREEN, $16 ; ANIM_OBJ_BIND2
	battleanimobj RELATIVE_X | X_FLIP, $68, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_LEECH_SEED, PAL_BATTLE_OB_GREEN, $06 ; ANIM_OBJ_LEECH_SEED
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_59, BATTLEANIMFUNC_21, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_SOUND
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_5C, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $17 ; ANIM_OBJ_WAVE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_5D, BATTLEANIMFUNC_22, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_CONFUSE_RAY
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $88, BATTLEANIMFRAMESET_5F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_LEER
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $88, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_LEER_TIP
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $18 ; ANIM_OBJ_SCREEN
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $18 ; ANIM_OBJ_HARDEN
	battleanimobj RELATIVE_X | X_FLIP, $50, BATTLEANIMFRAMESET_61, BATTLEANIMFUNC_23, PAL_BATTLE_OB_YELLOW, $19 ; ANIM_OBJ_CHICK
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_24, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_AMNESIA
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_66, BATTLEANIMFUNC_25, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_ASLEEP
	battleanimobj RELATIVE_X, $50, BATTLEANIMFRAMESET_1C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $0c ; ANIM_OBJ_SKULL
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_26, PAL_BATTLE_OB_BROWN, $1a ; ANIM_OBJ_DIG_SAND
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_68, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BROWN, $1a ; ANIM_OBJ_DIG_PILE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_69, BATTLEANIMFUNC_01, PAL_BATTLE_OB_GRAY, $1a ; ANIM_OBJ_SAND
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_6D, BATTLEANIMFUNC_28, PAL_BATTLE_OB_YELLOW, $19 ; ANIM_OBJ_PARALYZED
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_6A, BATTLEANIMFUNC_27, PAL_BATTLE_OB_GRAY, $1b ; ANIM_OBJ_STRING_SHOT
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SPRIAL_DESCENT, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_HAZE
	battleanimobj RELATIVE_X | X_FLIP, $48, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_SPRIAL_DESCENT, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_MIST
	battleanimobj RELATIVE_X | X_FLIP, $48, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SPRIAL_DESCENT, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_SMOG
	battleanimobj RELATIVE_X | X_FLIP, $78, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_POISON_GAS, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_POISON_GAS
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_71, BATTLEANIMFUNC_HORN, PAL_BATTLE_OB_GRAY, $1d ; ANIM_OBJ_HORN
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_72, BATTLEANIMFUNC_2C, PAL_BATTLE_OB_BLUE, $1d ; ANIM_OBJ_HORN_SMALLER
	battleanimobj RELATIVE_X, $48, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_2D, PAL_BATTLE_OB_RED, $1e ; ANIM_OBJ_PETAL_DANCE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_06, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_SLUDGE_BOMB
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_75, BATTLEANIMFUNC_2E, PAL_BATTLE_OB_BROWN, $19 ; ANIM_OBJ_PAY_DAY
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_SONICBOOM_JP_UNUSED
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_2F, PAL_BATTLE_OB_GRAY, $11 ; ANIM_OBJ_MIMIC
	battleanimobj RELATIVE_X, $78, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_POISON_GAS, PAL_BATTLE_OB_RED, $23 ; ANIM_OBJ_ATTRACT
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_30, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_BONEMERANG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_BONE_CLUB
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_BONE_RUSH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_08, PAL_BATTLE_OB_YELLOW, $23 ; ANIM_OBJ_SWIFT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_79, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_KINESIS
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_FLASH
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_SHINY
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_7B, BATTLEANIMFUNC_32, PAL_BATTLE_OB_GRAY, $20 ; ANIM_OBJ_SKY_ATTACK
	battleanimobj RELATIVE_X | X_FLIP, $98, BATTLEANIMFRAMESET_7C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $04 ; ANIM_OBJ_LICK
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_7D, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $18 ; ANIM_OBJ_WITHDRAW
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_2F, PAL_BATTLE_OB_BLUE, $0d ; ANIM_OBJ_DRAIN
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_7E, BATTLEANIMFUNC_33, PAL_BATTLE_OB_YELLOW, $12 ; ANIM_OBJ_GROWTH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_2F, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_CONVERSION2
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_34, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_SMOKE
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_35, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_SMOKESCREEN
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_80, BATTLEANIMFUNC_33, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_SWORDS_DANCE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_81, BATTLEANIMFUNC_37, PAL_BATTLE_OB_GRAY, $11 ; ANIM_OBJ_SPEED_LINE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_85, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $22 ; ANIM_OBJ_SHARPEN
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_86, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $22 ; ANIM_OBJ_DEFENSE_CURL
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_87, BATTLEANIMFUNC_39, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_METRONOME_HAND
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_3A, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_METRONOME_SPARKLE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_DISABLE
	battleanimobj RELATIVE_X | X_FLIP | PRIORITY, $88, BATTLEANIMFRAMESET_88, BATTLEANIMFUNC_3B, PAL_BATTLE_OB_BLUE, $13 ; ANIM_OBJ_AGILITY
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_25, PAL_BATTLE_OB_RED, $23 ; ANIM_OBJ_HEART
	battleanimobj RELATIVE_X, $98, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_34, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_FLAME_WHEEL
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_3C, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_SACRED_FIRE
	battleanimobj RELATIVE_X | X_FLIP, $68, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_SPRIAL_DESCENT, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_COTTON_SPORE
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_8A, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_MILK_DRINK
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_8C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_ANGER
	battleanimobj RELATIVE_X | X_FLIP, $50, BATTLEANIMFRAMESET_8D, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $1f ; ANIM_OBJ_HEAL_BELL
	battleanimobj RELATIVE_X, $40, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_40, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_HEAL_BELL_NOTE
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_8E, BATTLEANIMFUNC_41, PAL_BATTLE_OB_RED, $1f ; ANIM_OBJ_BATON_PASS
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_8F, BATTLEANIMFUNC_3E, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_LOCK_ON
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_93, BATTLEANIMFUNC_3E, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_MIND_READER
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_97, BATTLEANIMFUNC_3D, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_SAFEGUARD
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_3D, PAL_BATTLE_OB_YELLOW, $23 ; ANIM_OBJ_PROTECT
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_2E, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_THIEF
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_OCTAZOOKA
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_35, PAL_BATTLE_OB_RED, $19 ; ANIM_OBJ_PRESENT
	battleanimobj RELATIVE_X | X_FLIP, $70, BATTLEANIMFRAMESET_8B, BATTLEANIMFUNC_3F, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_SPIKES
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_15, BATTLEANIMFUNC_08, PAL_BATTLE_OB_GRAY, $0a ; ANIM_OBJ_POWDER_SNOW
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_02, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_DRAGONBREATH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_42, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_CONVERSION
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_9A, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1b ; ANIM_OBJ_SPIDER_WEB
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_9B, BATTLEANIMFUNC_35, PAL_BATTLE_OB_RED, $23 ; ANIM_OBJ_CAKE_UNUSED
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_23, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_NIGHTMARE
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9D, BATTLEANIMFUNC_25, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_IN_NIGHTMARE
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_LOVELY_KISS
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $25 ; ANIM_OBJ_SWEET_KISS
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $80, BATTLEANIMFRAMESET_9F, BATTLEANIMFUNC_3A, PAL_BATTLE_OB_GREEN, $23 ; ANIM_OBJ_SKETCH
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_A0, BATTLEANIMFUNC_16, PAL_BATTLE_OB_GRAY, $23 ; ANIM_OBJ_ENCORE_HAND
	battleanimobj RELATIVE_X | X_FLIP, $70, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_43, PAL_BATTLE_OB_YELLOW, $23 ; ANIM_OBJ_ENCORE_STAR
	battleanimobj RELATIVE_X | X_FLIP, $c0, BATTLEANIMFRAMESET_A2, BATTLEANIMFUNC_01, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_DESTINY_BOND
	battleanimobj RELATIVE_X | X_FLIP, $40, BATTLEANIMFRAMESET_A3, BATTLEANIMFUNC_44, PAL_BATTLE_OB_YELLOW, $24 ; ANIM_OBJ_MORNING_SUN
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_A4, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $24 ; ANIM_OBJ_GLIMMER
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_A5, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $24 ; ANIM_OBJ_MOONLIGHT
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_45, PAL_BATTLE_OB_RED, $12 ; ANIM_OBJ_HIDDEN_POWER
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_A6, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CROSS_CHOP1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_A7, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CROSS_CHOP2
	battleanimobj RELATIVE_X | X_FLIP, $00, BATTLEANIMFRAMESET_B4, BATTLEANIMFUNC_4A, PAL_BATTLE_OB_BROWN, $0f ; ANIM_OBJ_SANDSTORM
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_A8, BATTLEANIMFUNC_02, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_ZAP_CANNON
	battleanimobj RELATIVE_X | X_FLIP, $40, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_11, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_SPITE
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_A9, BATTLEANIMFUNC_46, PAL_BATTLE_OB_GRAY, $23 ; ANIM_OBJ_CURSE
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_47, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_PERISH_SONG
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_AA, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $24 ; ANIM_OBJ_FORESIGHT
	battleanimobj RELATIVE_X | X_FLIP, $b8, BATTLEANIMFRAMESET_AB, BATTLEANIMFUNC_48, PAL_BATTLE_OB_GRAY, $13 ; ANIM_OBJ_RAPID_SPIN
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_AC, BATTLEANIMFUNC_44, PAL_BATTLE_OB_GRAY, $13 ; ANIM_OBJ_SWAGGER
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_BELLY_DRUM_HAND
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_43, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_AB
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_AD, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $17 ; ANIM_OBJ_MEAN_LOOK
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_AE, BATTLEANIMFUNC_49, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_PURSUIT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_AF, BATTLEANIMFUNC_01, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_AE
	battleanimobj RELATIVE_X | X_FLIP, $00, BATTLEANIMFRAMESET_B0, BATTLEANIMFUNC_4A, PAL_BATTLE_OB_GRAY, $04 ; ANIM_OBJ_RAIN
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_4B, PAL_BATTLE_OB_RED, $1c ; ANIM_OBJ_B0
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_B1, BATTLEANIMFUNC_4C, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_PSYCH_UP
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4D, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_ANCIENTPOWER
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_B3, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $27 ; ANIM_OBJ_AEROBLAST
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_04, PAL_BATTLE_OB_BLUE, $15 ; ANIM_OBJ_SHADOW_BALL
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_ROCK_SMASH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_08, PAL_BATTLE_OB_RED, $1e ; ANIM_OBJ_FLOWER
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_4F, PAL_BATTLE_OB_RED, $1f ; ANIM_OBJ_COTTON
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B5, BATTLEANIMFUNC_00, PAL_BATTLE_OB_ENEMY, $28 ; ANIM_OBJ_PLAYERFEETFOLLOW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B6, BATTLEANIMFUNC_00, PAL_BATTLE_OB_PLAYER, $29 ; ANIM_OBJ_ENEMYFEETFOLLOW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B7, BATTLEANIMFUNC_00, PAL_BATTLE_OB_ENEMY, $28 ; ANIM_OBJ_PLAYERHEADFOLLOW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B8, BATTLEANIMFUNC_00, PAL_BATTLE_OB_PLAYER, $29 ; ANIM_OBJ_ENEMYHEADFOLLOW
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_BC, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01; ANIM_OBJ_MINIMIZE
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_B9, BATTLEANIMFUNC_2C, PAL_BATTLE_OB_GRAY, $1d; ANIM_OBJ_MEDIUM_HORN
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_06, PAL_BATTLE_OB_BROWN, $09  ; ANIM_OBJ_SAFARI_ROCK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BA, BATTLEANIMFUNC_06, PAL_BATTLE_OB_YELLOW, $09  ; ANIM_OBJ_SAFARI_BAIT
	battleanimobj RELATIVE_X, $a0, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_25, PAL_BATTLE_OB_BLUE, ANIM_GFX_BUBBLE ; ANIM_OBJ_RISING_BUBBLE
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_BD, BATTLEANIMFUNC_50, PAL_BATTLE_OB_BLUE, ANIM_GFX_BUBBLE ; ANIM_OBJ_BUBBLE_SPLASH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_BE, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_SMOKE_PUFF ; ANIM_OBJ_OCTAZOOKA_SMOKE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_BF, BATTLEANIMFUNC_50, PAL_BATTLE_OB_GRAY, ANIM_GFX_POISON ; ANIM_OBJ_INK_SPLASH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_45, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_DAZZLE
