;IF DEF(_DEBUG) ; for testing animations
;MoveTable:
;	db POUND
;	db KARATE_CHOP
;	db DOUBLESLAP
;	db COMET_PUNCH
;	db MEGA_PUNCH
;	db PAY_DAY
;	db FIRE_PUNCH
;	db ICE_PUNCH
;	db THUNDERPUNCH
;	db SCRATCH
;	db VICEGRIP
;	db GUILLOTINE
;	db RAZOR_WIND
;	db SWORDS_DANCE
;	db CUT
;	db GUST
;	db WING_ATTACK
;	db WHIRLWIND
;	db FLY
;	db BIND
;	db SLAM
;	db VINE_WHIP
;	db STOMP
;	db DOUBLE_KICK
;	db MEGA_KICK
;	db JUMP_KICK
;	db ROLLING_KICK
;	db SAND_ATTACK
;	db HEADBUTT
;	db HORN_ATTACK
;	db FURY_ATTACK
;	db HORN_DRILL
;	db TACKLE
;	db BODY_SLAM
;	db WRAP
;	db TAKE_DOWN
;	db THRASH
;	db DOUBLE_EDGE
;	db TAIL_WHIP
;	db POISON_STING
;	db TWINEEDLE
;	db PIN_MISSILE
;	db LEER
;	db BITE
;	db GROWL
;	db ROAR
;	db SING
;	db SUPERSONIC
;	db SONICBOOM
;	db DISABLE
;	db ACID
;	db EMBER
;	db FLAMETHROWER
;	db MIST
;	db WATER_GUN
;	db HYDRO_PUMP
;	db SURF
;	db ICE_BEAM
;	db BLIZZARD
;	db PSYBEAM
;	db BUBBLEBEAM
;	db AURORA_BEAM
;	db HYPER_BEAM
;	db PECK
;	db DRILL_PECK
;	db SUBMISSION
;	db LOW_KICK
;	db COUNTER
;	db SEISMIC_TOSS
;	db STRENGTH
;	db ABSORB
;	db MEGA_DRAIN
;	db LEECH_SEED
;	db GROWTH
;	db RAZOR_LEAF
;	db SOLARBEAM
;	db POISONPOWDER
;	db STUN_SPORE
;	db SLEEP_POWDER
;	db PETAL_DANCE
;	db STRING_SHOT
;	db DRAGON_RAGE
;	db FIRE_SPIN
;	db THUNDERSHOCK
;	db THUNDERBOLT
;	db THUNDER_WAVE
;	db THUNDER
;	db ROCK_THROW
;	db EARTHQUAKE
;	db FISSURE
;	db DIG
;	db TOXIC
;	db CONFUSION
;	db PSYCHIC_M
;	db HYPNOSIS
;	db MEDITATE
;	db AGILITY
;	db QUICK_ATTACK
;	db RAGE
;	db TELEPORT
;	db NIGHT_SHADE
;	db MIMIC
;	db SCREECH
;	db DOUBLE_TEAM
;	db RECOVER
;	db HARDEN
;	db MINIMIZE
;	db SMOKESCREEN
;	db CONFUSE_RAY
;	db WITHDRAW
;	db DEFENSE_CURL
;	db BARRIER
;	db LIGHT_SCREEN
;	db HAZE
;	db REFLECT
;	db FOCUS_ENERGY
;	db BIDE
;	db METRONOME
;	db MIRROR_MOVE
;	db SELFDESTRUCT
;	db EGG_BOMB
;	db LICK
;	db SMOG
;	db SLUDGE
;	db BONE_CLUB
;	db FIRE_BLAST
;	db WATERFALL
;	db CLAMP
;	db SWIFT
;	db SKULL_BASH
;	db SPIKE_CANNON
;	db CONSTRICT
;	db AMNESIA
;	db KINESIS
;	db SOFTBOILED
;	db HI_JUMP_KICK
;	db GLARE
;	db DREAM_EATER
;	db POISON_GAS
;	db BARRAGE
;	db LEECH_LIFE
;	db LOVELY_KISS
;	db SKY_ATTACK
;	db TRANSFORM
;	db BUBBLE
;	db DIZZY_PUNCH
;	db SPORE
;	db FLASH
;	db PSYWAVE
;	db SPLASH
;	db ACID_ARMOR
;	db CRABHAMMER
;	db EXPLOSION
;	db FURY_SWIPES
;	db BONEMERANG
;	db REST
;	db ROCK_SLIDE
;	db HYPER_FANG
;	db SHARPEN
;	db CONVERSION
;	db TRI_ATTACK
;	db SUPER_FANG
;	db SLASH
;	db SUBSTITUTE
;	db STRUGGLE
;	db SKETCH
;	db TRIPLE_KICK
;	db THIEF
;	db SPIDER_WEB
;	db MIND_READER
;	db NIGHTMARE
;	db FLAME_WHEEL
;	db SNORE
;	db CURSE
;	db FLAIL
;	db CONVERSION2
;	db AEROBLAST
;	db COTTON_SPORE
;	db REVERSAL
;	db SPITE
;	db POWDER_SNOW
;	db PROTECT
;	db MACH_PUNCH
;	db SCARY_FACE
;	db FEINT_ATTACK
;	db SWEET_KISS
;	db BELLY_DRUM
;	db SLUDGE_BOMB
;	db MUD_SLAP
;	db OCTAZOOKA
;	db SPIKES
;	db ZAP_CANNON
;	db FORESIGHT
;	db DESTINY_BOND
;	db PERISH_SONG
;	db ICY_WIND
;	db DETECT
;	db BONE_RUSH
;	db LOCK_ON
;	db OUTRAGE
;	db SANDSTORM
;	db GIGA_DRAIN
;	db ENDURE
;	db CHARM
;	db ROLLOUT
;	db FALSE_SWIPE
;	db SWAGGER
;	db MILK_DRINK
;	db SPARK
;	db FURY_CUTTER
;	db STEEL_WING
;	db MEAN_LOOK
;	db ATTRACT
;	db SLEEP_TALK
;	db HEAL_BELL
;	db RETURN
;	db PRESENT
;	db FRUSTRATION
;	db SAFEGUARD
;	db PAIN_SPLIT
;	db SACRED_FIRE
;	db MAGNITUDE
;	db DYNAMICPUNCH
;	db MEGAHORN
;	db DRAGONBREATH
;	db BATON_PASS
;	db ENCORE
;	db PURSUIT
;	db RAPID_SPIN
;	db SWEET_SCENT
;	db IRON_TAIL
;	db METAL_CLAW
;	db VITAL_THROW
;	db MORNING_SUN
;	db SYNTHESIS
;	db MOONLIGHT
;	db HIDDEN_POWER
;	db CROSS_CHOP
;	db TWISTER
;	db RAIN_DANCE
;	db SUNNY_DAY
;	db CRUNCH
;	db MIRROR_COAT
;	db PSYCH_UP
;	db EXTREMESPEED
;	db ANCIENTPOWER
;	db SHADOW_BALL
;	db FUTURE_SIGHT
;	db ROCK_SMASH
;	db WHIRLPOOL
;	db BEAT_UP
;	db 0
;
;DisplayUsedMoveText:
;	;jr .do_it ; comment this out for testing all move animations
;	ld a, BATTLE_VARS_MOVE
;	call GetBattleVarAddr
;	ld de, MoveTable
;.loop
;	ld a, [de]
;	inc de
;	and a
;	ret z
;	ld [hl], a
;	push hl
;	push de
;	farcall UpdateMoveData
;	call .do_it
;	farcall AnimateCurrentMove
;	pop de
;	pop hl
;	jr .loop
;
;.do_it
;ELSE
DisplayUsedMoveText:
;ENDC
	ld hl, UsedMoveText
	call BattleTextbox
	jp WaitBGMap

UsedMoveText:
	text_far _ActorNameText
	text_asm

	ldh a, [hBattleTurn]
	and a
	jr nz, .start

	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	call UpdateUsedMoves

.start
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [wMoveGrammar], a

	push hl
	farcall CheckUserIsCharging
	pop hl
	jr nz, .grammar

	; update last move
	ld a, [wMoveGrammar]
	ld [hl], a
	ld [de], a

.grammar
	call GetMoveGrammar ; convert move id to grammar index

; everything except 'CheckObedience' made redundant in localization

	; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	ld hl, UsedMove2Text
	ret nz

	; check move grammar
	ld a, [wMoveGrammar]
	cp $3
	ld hl, UsedMove2Text
	ret c
	ld hl, UsedMove1Text
	ret

UsedMove1Text:
	text_far _UsedMove1Text
	text_asm
	jr UsedMoveText_CheckObedience

UsedMove2Text:
	text_far _UsedMove2Text
	text_asm
UsedMoveText_CheckObedience:
; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	jr z, .GetMoveNameText
; print "instead,"
	ld hl, .UsedInsteadText
	ret

.UsedInsteadText:
	text_far _UsedInsteadText
	text_asm
.GetMoveNameText:
	ld hl, MoveNameText
	ret

MoveNameText:
	text_far _MoveNameText
	text_asm
; get start address
	ld hl, .endusedmovetexts

; get move id
	ld a, [wMoveGrammar]

; 2-byte pointer
	add a

; seek
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	pop bc

; get pointer to usedmovetext ender
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.endusedmovetexts
; entries correspond to MoveGrammar sets
	dw EndUsedMove1Text
	dw EndUsedMove2Text
	dw EndUsedMove3Text
	dw EndUsedMove4Text
	dw EndUsedMove5Text

EndUsedMove1Text:
	text_far _EndUsedMove1Text
	text_end

EndUsedMove2Text:
	text_far _EndUsedMove2Text
	text_end

EndUsedMove3Text:
	text_far _EndUsedMove3Text
	text_end

EndUsedMove4Text:
	text_far _EndUsedMove4Text
	text_end

EndUsedMove5Text:
	text_far _EndUsedMove5Text
	text_end

GetMoveGrammar:
; store move grammar type in wMoveGrammar

	push bc
; wMoveGrammar contains move id
	ld a, [wMoveGrammar]
	ld c, a ; move id
	ld b, 0 ; grammar index

; read grammar table
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp -1
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at 0
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop

.end
; wMoveGrammar now contains move grammar
	ld a, b
	ld [wMoveGrammar], a

; we're done
	pop bc
	ret

INCLUDE "data/moves/grammar.asm"

UpdateUsedMoves:
; append move a to wPlayerUsedMoves unless it has already been used

	push bc
; start of list
	ld hl, wPlayerUsedMoves
; get move id
	ld b, a
; next count
	ld c, NUM_MOVES

.loop
; get move from the list
	ld a, [hli]
; not used yet?
	and a
	jr z, .add
; already used?
	cp b
	jr z, .quit
; next byte
	dec c
	jr nz, .loop

; if the list is full and the move hasn't already been used
; shift the list back one byte, deleting the first move used
; this can occur with struggle or a new learned move
	ld hl, wPlayerUsedMoves + 1
; 1 = 2
	ld a, [hld]
	ld [hli], a
; 2 = 3
	inc hl
	ld a, [hld]
	ld [hli], a
; 3 = 4
	inc hl
	ld a, [hld]
	ld [hl], a
; 4 = new move
	ld a, b
	ld [wPlayerUsedMoves + 3], a
	jr .quit

.add
; go back to the byte we just inced from
	dec hl
; add the new move
	ld [hl], b

.quit
; list updated
	pop bc
	ret
