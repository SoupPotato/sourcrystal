; wSlotMatched values
	const_def 0, 4
	const SLOTS_SEVEN    ; $00
	const SLOTS_BAR      ; $04
	const SLOTS_CHERRY   ; $08
	const SLOTS_LEDYBA   ; $0c
	const SLOTS_WOOPER   ; $10
	const SLOTS_MAGNEMITE   ; $14
DEF NUM_SLOT_REELS EQU const_value / 4 ; 6
DEF SLOTS_NO_MATCH EQU -1

; wSlotBias values
DEF SLOTS_NO_BIAS EQU -1

DEF REEL_SIZE EQU 15

; Constants for slot_reel offsets (see macros/ram.asm)
rsreset
DEF REEL_ACTION        rb ; 0
DEF REEL_TILEMAP_ADDR  rw ; 1
DEF REEL_POSITION      rb ; 3
DEF REEL_SPIN_DISTANCE rb ; 4
DEF REEL_SPIN_RATE     rb ; 5
DEF REEL_OAM_ADDR      rw ; 6
DEF REEL_X_COORD       rb ; 8
DEF REEL_MANIP_COUNTER rb ; 9
DEF REEL_MANIP_DELAY   rb ; 10
DEF REEL_DROP_COUNTER  rb ; 11
                       rb_skip 3
DEF REEL_STOP_DELAY    rb ; 15

; SlotsJumptable constants
	const_def
	const SLOTS_INIT
	const SLOTS_BET_AND_START
	const SLOTS_WAIT_START
	const SLOTS_WAIT_REEL1
	const SLOTS_WAIT_STOP_REEL1
	const SLOTS_WAIT_REEL2
	const SLOTS_WAIT_STOP_REEL2
	const SLOTS_WAIT_REEL3
	const SLOTS_WAIT_STOP_REEL3
	const SLOTS_NEXT_09
	const SLOTS_NEXT_0A
	const SLOTS_NEXT_0B
	const SLOTS_FLASH_IF_WIN
	const SLOTS_FLASH_SCREEN
	const SLOTS_GIVE_EARNED_COINS
	const SLOTS_PAYOUT_TEXT_AND_ANIM
	const SLOTS_PAYOUT_ANIM
	const SLOTS_RESTART_OF_QUIT
	const SLOTS_QUIT
DEF SLOTS_END_LOOP_F EQU 7

; ReelActionJumptable constants
	const_def
	const REEL_ACTION_DO_NOTHING
	const REEL_ACTION_STOP_REEL_IGNORE_JOYPAD
	const REEL_ACTION_QUADRUPLE_RATE
	const REEL_ACTION_DOUBLE_RATE
	const REEL_ACTION_NORMAL_RATE
	const REEL_ACTION_HALF_RATE
	const REEL_ACTION_QUARTER_RATE
	const REEL_ACTION_STOP_REEL1
	const REEL_ACTION_STOP_REEL2
	const REEL_ACTION_STOP_REEL3
	const REEL_ACTION_SET_UP_REEL2_SKIP_TO_7
	const REEL_ACTION_WAIT_REEL2_SKIP_TO_7
	const REEL_ACTION_FAST_SPIN_REEL2_UNTIL_LINED_UP_7S
	const REEL_ACTION_UNUSED
	const REEL_ACTION_CHECK_DROP_REEL
	const REEL_ACTION_WAIT_DROP_REEL
	const REEL_ACTION_START_SLOW_ADVANCE_REEL3
	const REEL_ACTION_WAIT_SLOW_ADVANCE_REEL3
	const REEL_ACTION_INIT_GOLEM
	const REEL_ACTION_WAIT_GOLEM
	const REEL_ACTION_END_GOLEM
	const REEL_ACTION_INIT_CHANSEY
	const REEL_ACTION_WAIT_CHANSEY
	const REEL_ACTION_WAIT_EGG
	const REEL_ACTION_DROP_REEL

; wSlotsWhichSpecialAnim values
	const_def
	const SLOTS_SPECIAL_ANIM_NONE
	const SLOTS_SPECIAL_ANIM_JACKPOT
	const SLOTS_SPECIAL_ANIM_MATCH
	const SLOTS_SPECIAL_ANIM_RESET_COLORS

_SlotMachine:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call .InitGFX
; set up LCD callback
	ld hl, .LCDCallbackPoint
	ld de, SlotMachine_LCDCallback
	ld bc, .LCDCallbackPoint_End - .LCDCallbackPoint
	call CopyBytes
; "jp .LCDCallbackPoint"
	ld a, JP_INSTRUCTION                :: ldh [hFunctionInstruction], a
	ld a, LOW(SlotMachine_LCDCallback)  :: ldh [hFunctionTargetLo], a
	ld a, HIGH(SlotMachine_LCDCallback) :: ldh [hFunctionTargetHi], a
	ld a, JP_INSTRUCTION                :: ldh [hVBlankHookFunction + 0], a
	ld a, LOW(SlotMachine_VBlankCallback)  :: ldh [hVBlankHookFunction + 1], a
	ld a, HIGH(SlotMachine_VBlankCallback) :: ldh [hVBlankHookFunction + 2], a
	call DelayFrame
.loop
	call SlotsLoop
	jr nc, .loop
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
; clear callback
	ld a, RETI_INSTRUCTION :: ldh [hFunctionInstruction], a
	ld a, LOW(LCDGeneric)  :: ldh [hFunctionTargetLo], a
	ld a, HIGH(LCDGeneric)  :: ldh [hFunctionTargetHi], a
	xor a
	ld [hVBlankHookFunction], a
	call ClearBGPalettes
	farcall StubbedTrainerRankings_EndSlotsWinStreak
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl] ; 8x8
	ret

; no, the LOAD section directive does not work here
.LCDCallbackPoint:
; just does a unaccounted bankswitch to the payload
	push af
	ld a, BANK(.LCDCallbackPayload)
	ld [MBC3RomBank], a
	jp .LCDCallbackPayload
.LCDCallbackPoint_JumpBack:
	ldh a, [hROMBank]
	ld [MBC3RomBank], a
	pop af
	reti
; vblank hook does not need to save registers
; since it runs INSIDE vblank
.LCDCallbackPoint_VblankHook:
	ld a, BANK(.VBlankHookPayload)
	ld [MBC3RomBank], a
	jp .VBlankHookPayload
.LCDCallbackPoint_VblankHook_JumpBack:
	ldh a, [hROMBank]
	ld [MBC3RomBank], a
	rst Bankswitch
	ret
.LCDCallbackPoint_End:

.LCDCallbackPayload:
; payload generates mid-frame palette writes
; for the gradient thingy
	ldh a, [rLY]

; sound engine on vblank spills over here, can't do
; anything while that's going on
	cp a, 24
	jr c, .done

; reset color on BGP 2 and BGP 1
	cp a, 98
	jr nc, .initial_color

; brighten color on BGP 2
	cp a, 80 - 1
	jr nc, .bgp2light

; brighten color on BGP 1
	cp a, 64 - 1
	jr nc, .bgp1light

	jr .done

.bgp2light
; bgp2 second color
	ld a, 18 | 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld a, $8e
	ldh [rBGPD], a
	ld a, $7f
	ldh [rBGPD], a
	jr .done

.bgp1light
; bgp1 second color
	ld a, 10 | 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld a, $8e
	ldh [rBGPD], a
	ld a, $7f
	ldh [rBGPD], a
	jr .done

.initial_color
; bgp2 second color
	ld a, 18 | 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld a, $c5
	ldh [rBGPD], a
	ld a, $6d
	ldh [rBGPD], a
; bgp1 second color
	ld a, 10 | 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld a, $88
	ldh [rBGPD], a
	ld a, $76
	ldh [rBGPD], a
	jr .done

.done
; needs to be relative to RAM
	jp SlotMachine_LCDCallback+(.LCDCallbackPoint_JumpBack-.LCDCallbackPoint)

.VBlankHookPayload:
	ld a, [wSlotsWhichSpecialAnim]
	and a
	jp z, .vbdone

	cp SLOTS_SPECIAL_ANIM_RESET_COLORS
	jp z, .reset

	cp SLOTS_SPECIAL_ANIM_MATCH
	jp z, .non_jackpot

; .jackpot
	ld a, [wSlotMatched]
	ld d, a
	call AnimateSlotReelIcon
	call .AnimateJackpotLights
	ld a, [hVBlankCounter]
	and a, 0b1000
	srl a
	srl a
	srl a
	and a
	jr nz, .jackpot_gfx_frameB
	call .jackpot_hoppip_frameA
	jr .jackpot_do_pal
.jackpot_gfx_frameB
	call .jackpot_hoppip_frameB
.jackpot_do_pal
	ld a, [hVBlankCounter]
; cycle through 4 colors
	and a, 0b110000
	srl a
	srl a
	ld hl, .jackpot_lut
	add a, l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
MACRO applybcpal
	ld a, (\1*8) + (\2*2) | 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld a, b
	ldh [rBGPD], a
	ld a, c
	ldh [rBGPD], a
ENDM
; unroll: apply palette to every white BGP except 7
	applybcpal 0, 0
	applybcpal 1, 0
	applybcpal 2, 0
	applybcpal 3, 0
	applybcpal 4, 0
	ld b, d
	ld c, e
	applybcpal 6, 1
	;ld b, b
	jp .vbdone

.jackpot_lut
; BG white palette, then BG star palette
	RGB 15, 31, 19
	RGB 31, 23, 01
	
	RGB 14, 24, 31
	RGB 31, 30, 22
	
	RGB 31, 14, 26
	RGB 31, 23, 01
	
	RGB 31, 27, 16
	RGB 31, 15, 00

.non_jackpot
	ld a, [wSlotMatched]
	ld d, a
	call AnimateSlotReelIcon
	call .AnimateMatchingSlotLights
	ld a, [hVBlankCounter]
	and a, 0b1000
	srl a
	srl a
	srl a
	and a
	jr nz, .non_jackpot_gfx_frameB
	call .jackpot_hoppip_frameA
	jr .non_jackpot_do_pal
.non_jackpot_gfx_frameB
	call .jackpot_hoppip_frameB
.non_jackpot_do_pal
	ld a, [hVBlankCounter]
; cycle through 4 colors
	and a, 0b110000
	srl a
	srl a
	srl a
	ld hl, .non_jackpot_lut
	add a, l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	applybcpal 6, 1
	jr .vbdone

.non_jackpot_lut
; BG star palette
	RGB 31, 23, 01
	RGB 31, 30, 22
	RGB 31, 23, 01
	RGB 31, 15, 00

.reset
	ld bc, $ff7f
	applybcpal 0, 0
	applybcpal 1, 0
	applybcpal 2, 0
	applybcpal 3, 0
	applybcpal 4, 0
	ld bc, $ff06
	applybcpal 6, 1
	ld a, [wSlotMatched]
	ld d, a
	call ResetSlotReelIcon
	call .jackpot_hoppip_frameA
	xor a ; NONE
	ld [wSlotsWhichSpecialAnim], a

.vbdone
	jp SlotMachine_LCDCallback+(.LCDCallbackPoint_VblankHook_JumpBack-.LCDCallbackPoint)

.jackpot_hoppip_frameA
MACRO hoppipbgfx
	ld a, \1
	ld [hli], a
	ld a, \1 + 1
	ld [hli], a
ENDM
MACRO position_hoppipbgfx_both_maps
	hlbgcoord \1, \2
	hoppipbgfx \3
	hlcoord \1, \2
	hoppipbgfx \3
ENDM
; upper half
	position_hoppipbgfx_both_maps 5, 2, $1c
	position_hoppipbgfx_both_maps 9, 2, $1c
	position_hoppipbgfx_both_maps 13, 2, $1c
; lower half
	position_hoppipbgfx_both_maps 5, 3, $1e
	position_hoppipbgfx_both_maps 9, 3, $1e
	position_hoppipbgfx_both_maps 13, 3, $1e
	ret

.jackpot_hoppip_frameB
; upper half
	position_hoppipbgfx_both_maps 5, 2, $20
	position_hoppipbgfx_both_maps 9, 2, $20
	position_hoppipbgfx_both_maps 13, 2, $20
; lower half
	position_hoppipbgfx_both_maps 5, 3, $22
	position_hoppipbgfx_both_maps 9, 3, $22
	position_hoppipbgfx_both_maps 13, 3, $22
	ret

.AnimateMatchingSlotLights:
; light up the slot lights
MACRO position_lightbg_on_fx
	hlbgcoord \1, \2
	ld [hl], $18
	hlcoord \1, \2
	ld [hl], $18
	hlbgcoord \1, \2 + 1
	ld [hl], $19
	hlcoord \1, \2 + 1
	ld [hl], $19
ENDM
MACRO position_lightbg_off_fx
	hlbgcoord \1, \2
	ld [hl], $16
	hlcoord \1, \2
	ld [hl], $16
	hlbgcoord \1, \2 + 1
	ld [hl], $17
	hlcoord \1, \2 + 1
	ld [hl], $17
ENDM
	ld a, [hVBlankCounter]
	and a, 0b1000
	srl a
	srl a
	srl a
	and a
	jp nz, .all_lights_off
; assume that the slots already have a value here
; and that value is what we want
; check left slots first
; slot order: bottom, middle, top
; value of `d` should be preserved here
	ld a, [wReel1Stopped]
	cp d
	jr z, .left_bottom_matched
	ld a, [wReel1Stopped + 2]
	cp d
	jp z, .left_up_matched
; only one possibility if left middle matched
	position_lightbg_on_fx 3, 6
	position_lightbg_on_fx 16, 6
	ret

.left_bottom_matched
	ld a, [wReel3Stopped]
	cp d
	jr z, .left_bottom_right_bottom_matched
; .left_bottom_right_up_matched
	position_lightbg_on_fx 3, 10
	position_lightbg_on_fx 16, 2
	ret
.left_bottom_right_bottom_matched
	position_lightbg_on_fx 3, 8
	position_lightbg_on_fx 16, 8
	ret

.left_up_matched
	ld a, [wReel3Stopped]
	cp d
	jr z, .left_up_right_bottom_matched
; .left_up_right_up_matched
	position_lightbg_on_fx 3, 4
	position_lightbg_on_fx 16, 4
	ret
.left_up_right_bottom_matched
	position_lightbg_on_fx 3, 2
	position_lightbg_on_fx 16, 10
	ret

.all_lights_off
	position_lightbg_off_fx 3, 2
	position_lightbg_off_fx 3, 4
	position_lightbg_off_fx 3, 6
	position_lightbg_off_fx 3, 8
	position_lightbg_off_fx 3, 10
	position_lightbg_off_fx 16, 2
	position_lightbg_off_fx 16, 4
	position_lightbg_off_fx 16, 6
	position_lightbg_off_fx 16, 8
	position_lightbg_off_fx 16, 10
	ret

.AnimateJackpotLights:
	ld a, [hVBlankCounter]
	and a, 0b1000
	srl a
	srl a
	srl a
	and a
	jp nz, .all_lights_off
	position_lightbg_on_fx 3, 2
	position_lightbg_on_fx 3, 4
	position_lightbg_on_fx 3, 6
	position_lightbg_on_fx 3, 8
	position_lightbg_on_fx 3, 10
	position_lightbg_on_fx 16, 2
	position_lightbg_on_fx 16, 4
	position_lightbg_on_fx 16, 6
	position_lightbg_on_fx 16, 8
	position_lightbg_on_fx 16, 10
	ret


.InitGFX:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	ld a, " "
	call ByteFill
	ld b, SCGB_SLOT_MACHINE
	call GetSGBLayout
	callfar ClearSpriteAnims
	ld hl, wSlots
	ld bc, wSlotsDataEnd - wSlots
	xor a
	call ByteFill

	ld hl, Slots2LZ
	ld de, vTiles0 tile $00
	call Decompress

	ld hl, Slots3LZ
	ld de, vTiles0 tile $40
	call Decompress

	; slots BG gfx
	ld hl, Slots1LZ
	ld de, vTiles2 tile $00
	call Decompress

	ld hl, vTiles2 tile $2B
	ld c, $10
	xor a
.blank_tile
	ld [hli], a
	dec c
	jr nz, .blank_tile

	; payout gfx?
	ld hl, Slots2LZ
	ld de, vTiles2 tile $2C
	call Decompress

	ld hl, SlotsTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * 12
	call CopyBytes

	ld hl, rLCDC
	set rLCDC_SPRITE_SIZE, [hl] ; 8x16
	call EnableLCD
	ld hl, wSlots
	ld bc, wSlotsEnd - wSlots
	xor a
	call ByteFill
	call Slots_InitReelTiles
	call Slots_GetPals
	ld a, SPRITE_ANIM_DICT_SLOTS
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $40
	xor a ; SLOTS_INIT
	ld [wJumptableIndex], a
	ld a, SLOTS_NO_BIAS
	ld [wSlotBias], a
	call Slots_AddTopCoverSprites
	ld de, MUSIC_GAME_CORNER
	call PlayMusic
	xor a
	ld [wKeepSevenBiasChance], a ; 87.5% chance
	ld [wSlotsWhichSpecialAnim], a
	call Random
	and %00101010
	ret nz
	ld a, TRUE
	ld [wKeepSevenBiasChance], a ; 12.5% chance
	callfar DoNextFrameForFirst16Sprites
	ret

Slots_AddTopCoverSprites:
	depixel 2, 5
	ld a, SPRITE_ANIM_OBJ_SLOTS_COVER
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FRAMESET_SLOTS_COVER_GREEN
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 42 ; mark sprite for later deletion
	depixel 2, 9
	ld a, SPRITE_ANIM_OBJ_SLOTS_COVER
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FRAMESET_SLOTS_COVER_GREEN
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 42
	depixel 2, 13
	ld a, SPRITE_ANIM_OBJ_SLOTS_COVER
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FRAMESET_SLOTS_COVER_GREEN
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 42
	ret

Slots_AddBottomCoverSprites:
	depixel 10, 5
	ld a, SPRITE_ANIM_OBJ_SLOTS_COVER
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 67 ; mark sprite for later deletion
	depixel 10, 9
	ld a, SPRITE_ANIM_OBJ_SLOTS_COVER
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 67
	depixel 10, 13
	ld a, SPRITE_ANIM_OBJ_SLOTS_COVER
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 67
	ret

Slots_RemoveBottomCoverSprites:
	ld a, 67
	ld hl, wSpriteAnimationStructs + SPRITEANIMSTRUCT_VAR1
	ld e, NUM_SPRITE_ANIM_STRUCTS
.loop
	cp [hl]
	jr nz, .next
	ld [hl], 69 ; mark sprite for *immediate* deletion
.next
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	ret

Slots_RemoveTopCoverSprites:
	ld a, 42
	ld hl, wSpriteAnimationStructs + SPRITEANIMSTRUCT_VAR1
	ld e, NUM_SPRITE_ANIM_STRUCTS
.loop
	cp [hl]
	jr nz, .next
	ld [hl], 69 ; mark sprite for *immediate* deletion
.next
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	ret


Slots_GetPals:
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	lb de, %11000000, %11100100
.cgb
	call DmgToCgbObjPals
	ret

SlotsLoop:
	ld a, [wJumptableIndex]
	bit SLOTS_END_LOOP_F, a
	jr nz, .stop
	call SlotsJumptable
	call Slots_SpinReels
	xor a
	ld [wCurSpriteOAMAddr], a
	callfar DoNextFrameForFirst16Sprites
	call .PrintCoinsAndPayout
	call .Stubbed_AlternateMatchingSevensPalette
	call DelayFrame
	and a
	ret

.stop
	scf
	ret

.Stubbed_AlternateMatchingSevensPalette:
; dummied out
	ret
	ld a, [wReel1ReelAction]
	and a
	ret nz
	ld a, [wReel2ReelAction]
	and a
	ret nz
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr nz, .matching_sevens
	ld a, %11100100
	call DmgToCgbBGPals
	ret

.matching_sevens
	ld a, [wTextDelayFrames]
	and $7
	ret nz
	ldh a, [rBGP]
	xor %00001100 ; alternates two palettes
	call DmgToCgbBGPals
	ret

.PrintCoinsAndPayout:
	hlcoord 5, 1
	ld de, wCoins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	hlcoord 11, 1
	ld de, wPayout
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret

DebugPrintSlotBias: ; unreferenced
	ld a, [wSlotBias]
	add 0
	daa
	ld e, a
	and $f
	add "0"
	hlcoord 1, 0
	ld [hl], a
	ld a, e
	swap a
	and $f
	add "0"
	hlcoord 0, 0
	ld [hl], a
	ret

AnimateSlotReelIcon:
; This animation was present in pokegold-spaceworld.

; d = which slot reel icon to animate,
;     refer to wSlotMatched values

	ld hl, wSlotReelIconDelay
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld hl, wShadowOAMSprite16TileID
	ld c, NUM_SPRITE_OAM_STRUCTS - 16
.loop
	ld a, [hl]
	ld b, a
	and %11100
	cp d
	jr nz, .next
	ld a, b
	xor $20 ; alternate between $00-$1f and $20-$3f
	ld [hl], a ; tile id
.next
	inc hl
rept SPRITEOAMSTRUCT_LENGTH - 1
	inc hl
endr
	dec c
	jr nz, .loop
	ret

ResetSlotReelIcon:
; d = which slot reel icon to reset,
;     refer to wSlotMatched values
	ld hl, wShadowOAMSprite16TileID
	ld c, NUM_SPRITE_OAM_STRUCTS - 16
.loop
	ld a, [hl]
	ld b, a
	and %11000
	srl a
	srl a
	srl a
	cp d
	jr nz, .next
	ld a, b
	and $1f
	ld [hl], a ; tile id
.next
	inc hl
rept SPRITEOAMSTRUCT_LENGTH - 1
	inc hl
endr
	dec c
	jr nz, .loop
	ret

SlotsJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw SlotsAction_Init              ; 00
	dw SlotsAction_BetAndStart       ; 01
	dw SlotsAction_WaitStart         ; 02
	dw SlotsAction_WaitReel1         ; 03
	dw SlotsAction_WaitStopReel1     ; 04
	dw SlotsAction_WaitReel2         ; 05
	dw SlotsAction_WaitStopReel2     ; 06
	dw SlotsAction_WaitReel3         ; 07
	dw SlotsAction_WaitStopReel3     ; 08
	dw SlotsAction_Next              ; 09
	dw SlotsAction_Next              ; 0a
	dw SlotsAction_Next              ; 0b
	dw SlotsAction_FlashIfWin        ; 0c
	dw SlotsAction_FlashScreen       ; 0d
	dw SlotsAction_GiveEarnedCoins   ; 0e
	dw SlotsAction_PayoutTextAndAnim ; 0f
	dw SlotsAction_PayoutAnim        ; 10
	dw SlotsAction_RestartOrQuit     ; 11
	dw SlotsAction_Quit              ; 12

SlotsAction_Next:
	ld hl, wJumptableIndex
	inc [hl]
	ret

SlotsAction_Init:
	call SlotsAction_Next
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	ld a, SLOTS_NO_MATCH
	ld [wSlotMatched], a
	ret

SlotsAction_BetAndStart:
	call Slots_AskBet
	jr nc, .proceed
	ld a, SLOTS_QUIT
	ld [wJumptableIndex], a
	ret

.proceed
	call Slots_AddBottomCoverSprites
	call SlotsAction_Next
	call Slots_IlluminateBetLights
	call Slots_InitBias
	ld a, 32
	ld [wSlotsDelay], a
	ld a, REEL_ACTION_NORMAL_RATE
	ld [wReel1ReelAction], a
	ld [wReel2ReelAction], a
	ld [wReel3ReelAction], a
	ld a, 4
	ld [wReel1ManipCounter], a
	ld [wReel2ManipCounter], a
	ld [wReel3ManipCounter], a
	call WaitSFX
	ld a, SFX_SLOT_MACHINE_START
	call Slots_PlaySFX
	ret

SlotsAction_WaitStart:
	ld hl, wSlotsDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret

.proceed
	call SlotsAction_Next
	xor a
	ldh [hJoypadSum], a
	ret

SlotsAction_WaitReel1:
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call SlotsAction_Next
	call Slots_StopReel1
	ld [wReel1ReelAction], a
SlotsAction_WaitStopReel1:
	ld a, [wReel1ReelAction]
	cp REEL_ACTION_DO_NOTHING
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel1
	ld de, wReel1Stopped
	call Slots_LoadReelState
	call SlotsAction_Next
	xor a
	ldh [hJoypadSum], a
SlotsAction_WaitReel2:
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call SlotsAction_Next
	call Slots_StopReel2
	ld [wReel2ReelAction], a
SlotsAction_WaitStopReel2:
	ld a, [wReel2ReelAction]
	cp REEL_ACTION_DO_NOTHING
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel2
	ld de, wReel2Stopped
	call Slots_LoadReelState
	call SlotsAction_Next
	xor a
	ldh [hJoypadSum], a
SlotsAction_WaitReel3:
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call SlotsAction_Next
	call Slots_StopReel3
	ld [wReel3ReelAction], a
SlotsAction_WaitStopReel3:
	ld a, [wReel3ReelAction]
	cp REEL_ACTION_DO_NOTHING
	ret nz
	call Slots_RemoveBottomCoverSprites
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel3
	ld de, wReel3Stopped
	call Slots_LoadReelState
	call SlotsAction_Next
	xor a
	ldh [hJoypadSum], a
	ret

SlotsAction_FlashIfWin:
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr nz, .GotIt
	call SlotsAction_Next
	call SlotsAction_Next
	ret

.GotIt:
	call SlotsAction_Next
	ld a, 16
	ld [wSlotsDelay], a
SlotsAction_FlashScreen:
	ld hl, wSlotsDelay
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	srl a
	ret z

	ldh a, [rOBP0]
	xor $ff
	ld e, a
	ld d, a
	call DmgToCgbObjPals
	ret

.done
	call Slots_GetPals
	ld a, [wSlotMatched]
	and a ; cp SLOTS_SEVEN
	jr nz, .not_jackpot
	ld a, SLOTS_SPECIAL_ANIM_JACKPOT
	ld [wSlotsWhichSpecialAnim], a
	jp SlotsAction_Next
.not_jackpot
	ld a, SLOTS_SPECIAL_ANIM_MATCH
	ld [wSlotsWhichSpecialAnim], a
	jp SlotsAction_Next

SlotsAction_GiveEarnedCoins:
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	ld a, %11100100
	call DmgToCgbBGPals
	call Slots_GetPayout
	xor a
	ld [wSlotsDelay], a
	call SlotsAction_Next
	ret

SlotsAction_PayoutTextAndAnim:
	call Slots_PayoutText
	call SlotsAction_Next
SlotsAction_PayoutAnim:
	ld hl, wSlotsDelay
	ld a, [hl]
	inc [hl]
	and $1
	ret z
	ld hl, wPayout
	ld a, [hli]
	ld d, a
	or [hl]
	jr z, .done
	ld e, [hl]
	dec de
	ld [hl], e
	dec hl
	ld [hl], d
	ld hl, wCoins
	ld d, [hl]
	inc hl
	ld e, [hl]
	call Slots_CheckCoinCaseFull
	jr c, .okay
	inc de
.okay
	ld [hl], e
	dec hl
	ld [hl], d
	ld a, [wSlotsDelay]
	and $7
	ret nz
	ld de, SFX_GET_COIN_FROM_SLOTS
	call PlaySFX
	ret

.done
	call SlotsAction_Next
	ret

SlotsAction_RestartOrQuit:
	call Slots_DeilluminateBetLights
	call WaitPressAorB_BlinkCursor
	call Slots_AskPlayAgain
	jr c, .exit_slots
	ld a, SLOTS_INIT
	ld [wJumptableIndex], a
	ret

.exit_slots
	ld a, SLOTS_QUIT
	ld [wJumptableIndex], a
	ret

SlotsAction_Quit:
	ld hl, wJumptableIndex
	set SLOTS_END_LOOP_F, [hl]
	ret

Slots_LoadReelState:
	push de
	call Slots_GetCurrentReelState
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

Slots_CheckCoinCaseFull:
	ld a, d
	cp HIGH(MAX_COINS)
	jr c, .not_full
	ld a, e
	cp LOW(MAX_COINS)
	jr c, .not_full
	scf
	ret

.not_full
	and a
	ret

Slots_GetCurrentReelState:
	ld hl, REEL_POSITION
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .okay
	ld a, $f
.okay
	dec a
	and $f
	ld e, a
	ld d, 0
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ret

Slots_StopReel1:
; Always set the REEL_ACTION_STOP_REEL1 action.
	ld a, REEL_ACTION_STOP_REEL1
	ret

Slots_StopReel2:
; As long as, the following three meet, there's a 31.25% chance
; to set action REEL_ACTION_SET_UP_REEL2_SKIP_TO_7:
; - Bet is >= 2 coins
; - There's a 7 symbol visible in reel #1
; - Current spin isn't biased or is biased towards SEVEN
; In any other case, REEL_ACTION_STOP_REEL2 is set.

	ld a, [wSlotBet]
	cp $2
	jr c, .dont_jump
	ld a, [wSlotBias]
	and a
	jr z, .skip
	cp SLOTS_NO_BIAS
	jr nz, .dont_jump
.skip
	call .CheckReel1ForASeven
	jr nz, .dont_jump
	call Random
	cp 31 percent + 1
	jr nc, .dont_jump
	ld a, REEL_ACTION_SET_UP_REEL2_SKIP_TO_7
	ret

.dont_jump
	ld a, REEL_ACTION_STOP_REEL2
	ret

.CheckReel1ForASeven:
	ld a, [wReel1Stopped]
	and a
	ret z
	ld a, [wReel1Stopped + 1]
	and a
	ret z
	ld a, [wReel1Stopped + 2]
	and a
	ret

Slots_StopReel3:
; If no matching SEVEN symbols in reels #1 and #2:
; - REEL_ACTION_STOP_REEL3, 100%

; If matching SEVEN symbols and NO bias to SEVEN:
; - REEL_ACTION_STOP_REEL3, 37.5%
; - REEL_ACTION_START_SLOW_ADVANCE_REEL3, 31.3%
; - REEL_ACTION_INIT_GOLEM, 31.3%
; - REEL_ACTION_INIT_CHANSEY, 0%

; If matching SEVEN symbols and bias to SEVEN:
; - REEL_ACTION_STOP_REEL3, 29.7%
; - REEL_ACTION_START_SLOW_ADVANCE_REEL3, 23.4%
; - REEL_ACTION_INIT_GOLEM, 23.4%
; - REEL_ACTION_INIT_CHANSEY, 23.4%

	ld a, [wFirstTwoReelsMatching]
	and a
	jr z, .stop
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr z, .stop
	ld a, [wSlotBias]
	and a
	jr nz, .biased
	call Random
	cp 71 percent - 1
	jr nc, .stop
	cp 47 percent + 1
	jr nc, .slow_advance
	cp 24 percent - 1
	jr nc, .golem
	ld a, REEL_ACTION_INIT_CHANSEY
	ret

.biased
	call Random
	cp 63 percent
	jr nc, .stop
	cp 31 percent + 1
	jr nc, .slow_advance
.golem
	ld a, REEL_ACTION_INIT_GOLEM
	ret

.slow_advance
	ld a, REEL_ACTION_START_SLOW_ADVANCE_REEL3
	ret

.stop
	ld a, REEL_ACTION_STOP_REEL3
	ret

Slots_InitReelTiles:
	ld bc, wReel1
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld de, wShadowOAMSprite16
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld de, Reel1Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_X_COORD
	add hl, bc
	ld [hl], 6 * TILE_WIDTH
	call .OAM

	ld bc, wReel2
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld de, wShadowOAMSprite24
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld de, Reel2Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_X_COORD
	add hl, bc
	ld [hl], 10 * TILE_WIDTH
	call .OAM

	ld bc, wReel3
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld de, wShadowOAMSprite32
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld de, Reel3Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_X_COORD
	add hl, bc
	ld [hl], 14 * TILE_WIDTH
	call .OAM
	ret

.OAM:
	ld hl, REEL_ACTION
	add hl, bc
	ld [hl], REEL_ACTION_DO_NOTHING
	ld hl, REEL_POSITION
	add hl, bc
	ld [hl], REEL_SIZE - 1
	ld hl, REEL_SPIN_DISTANCE
	add hl, bc
	ld [hl], REEL_ACTION_DO_NOTHING
	call Slots_UpdateReelPositionAndOAM
	ret

Slots_SpinReels:
	ld bc, wReel1
	call .SpinReel
	ld bc, wReel2
	call .SpinReel
	ld bc, wReel3
	call .SpinReel
	ret

.SpinReel:
	ld hl, REEL_SPIN_DISTANCE
	add hl, bc
	ld a, [hl]
	and $f
	jr nz, .skip
	call ReelActionJumptable
.skip
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, REEL_SPIN_DISTANCE
	add hl, bc
	add [hl]
	ld [hl], a
	and $f
	jr z, Slots_UpdateReelPositionAndOAM
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, $8
.loop
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec e
	jr nz, .loop
	ret

Slots_UpdateReelPositionAndOAM:
	ld hl, REEL_X_COORD
	add hl, bc
	ld a, [hl]
	ld [wCurReelXCoord], a
	ld a, 10 * TILE_WIDTH
	ld [wCurReelYCoord], a
	ld hl, REEL_POSITION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call .LoadOAM
	ld hl, REEL_POSITION
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	cp REEL_SIZE
	jr nz, .load
	xor a
.load
	ld [hl], a
	ret

.LoadOAM:
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [wCurReelYCoord]
	ld [hli], a ; y
	ld a, [wCurReelXCoord]
	ld [hli], a ; x
	ld a, [de]
	ld [hli], a ; tile id
	call GetSlotIconPalette
	set OAM_PRIORITY, a
	ld [hli], a ; attributes

	ld a, [wCurReelYCoord]
	ld [hli], a ; y
	ld a, [wCurReelXCoord]
	add 1 * TILE_WIDTH
	ld [hli], a ; x
	ld a, [de]
	inc a
	inc a
	ld [hli], a ; tile id
	call GetSlotIconPalette
	set OAM_PRIORITY, a
	ld [hli], a ; attributes
	inc de
	ld a, [wCurReelYCoord]
	sub 2 * TILE_WIDTH
	ld [wCurReelYCoord], a
	cp 2 * TILE_WIDTH
	jr nz, .loop
	ret

GetSlotIconPalette:
; Used to get OAM attribute values for slot reels?
; (final Slots_UpdateReelPositionAndOAM above reuses tile IDs as OAM palettes)
	push hl
	srl a
	srl a
	add LOW(.data)
	ld l, a
	ld a, 0
	adc HIGH(.data)
	ld h, a
	ld a, [hl]
	pop hl
	ret

.data:
	table_width 1
	db 3 ; SLOTS_SEVEN
	db 3 ; SLOTS_BAR
	db 2 ; SLOTS_CHERRY
	db 3 ; SLOTS_LEDYBA
	db 4 ; SLOTS_WOOPER
	db 5 ; SLOTS_MAGNEMITE
	assert_table_length NUM_SLOT_REELS

ReelActionJumptable:
	ld hl, REEL_ACTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw ReelAction_DoNothing                   ; 00
	dw ReelAction_StopReelIgnoreJoypad        ; 01
	dw ReelAction_QuadrupleRate               ; 02
	dw ReelAction_DoubleRate                  ; 03
	dw ReelAction_NormalRate                  ; 04
	dw ReelAction_HalfRate                    ; 05
	dw ReelAction_QuarterRate                 ; 06
	dw ReelAction_StopReel1                   ; 07
	dw ReelAction_StopReel2                   ; 08
	dw ReelAction_StopReel3                   ; 09
	dw ReelAction_SetUpReel2SkipTo7           ; 0a
	dw ReelAction_WaitReel2SkipTo7            ; 0b
	dw ReelAction_FastSpinReel2UntilLinedUp7s ; 0c
	dw ReelAction_Unused                      ; 0d
	dw ReelAction_CheckDropReel               ; 0e
	dw ReelAction_WaitDropReel                ; 0f
	dw ReelAction_StartSlowAdvanceReel3       ; 10
	dw ReelAction_WaitSlowAdvanceReel3        ; 11
	dw ReelAction_InitGolem                   ; 12
	dw ReelAction_WaitGolem                   ; 13
	dw ReelAction_EndGolem                    ; 14
	dw ReelAction_InitChansey                 ; 15
	dw ReelAction_WaitChansey                 ; 16
	dw ReelAction_WaitEgg                     ; 17
	dw ReelAction_DropReel                    ; 18

ReelAction_DoNothing:
	ret

ReelAction_QuadrupleRate:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 16
	ret

ReelAction_DoubleRate:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

ReelAction_NormalRate:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 4
	ret

ReelAction_HalfRate:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 2
	ret

ReelAction_QuarterRate:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 1
	ret

Slots_StopReel:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ld hl, REEL_ACTION
	add hl, bc
	ld [hl], REEL_ACTION_STOP_REEL_IGNORE_JOYPAD
	ld hl, REEL_STOP_DELAY
	add hl, bc
	ld [hl], 3
ReelAction_StopReelIgnoreJoypad:
	ld hl, REEL_STOP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .EndReel
	dec [hl]
	ret

.EndReel:
	ld hl, REEL_ACTION
	add hl, bc
	ld a, REEL_ACTION_DO_NOTHING
	ld [hl], a
	ret

ReelAction_StopReel1:
; If no bias: don't manipulate reel.
; If bias: manipulate reel up to wReel1ManipCounter (i.e. 4) slots,
; stoping early if the biased symbol shows up anywhere in reel #1,
; even if the current bet won't allow lining it up.

	ld a, [wSlotBias]
	cp SLOTS_NO_BIAS
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	call .CheckForBias
	ret nz
.NoBias:
	call Slots_StopReel
	ret

.CheckForBias:
	call Slots_GetCurrentReelState
	ld a, [wSlotBias]
	ld e, a
	ld a, [hli]
	cp e
	ret z
	ld a, [hli]
	cp e
	ret z
	ld a, [hl]
	cp e
	ret

ReelAction_StopReel2:
; If no bias: don't manipulate reel.
; If bias: manipulate reel up to wReel2ManipCounter (i.e. 4) slots,
; stoping early if the biased symbol is lined up in the first two
; reels, according to the lines that the current bet allows.

	call Slots_CheckMatchedFirstTwoReels
	jr nc, .nope
	ld a, [wSlotBuildingMatch]
	ld hl, wSlotBias
	cp [hl]
	jr z, .NoBias
.nope
	ld a, [wSlotBias]
	cp SLOTS_NO_BIAS
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	ret

.NoBias:
	call Slots_StopReel
	ret

ReelAction_StopReel3:
; Manipulate the reel up to wReel3ManipCounter (i.e. 4) slots,
; stopping early if the bias symbol is lined up for a win.
; If not biased to any symbols, stop as soon as nothing is lined up.

	call Slots_CheckMatchedAllThreeReels
	jr nc, .NoMatch
	ld hl, wSlotBias
	cp [hl]
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.NoMatch:
	ld a, [wSlotBias]
	cp SLOTS_NO_BIAS
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	ret

.NoBias:
	call Slots_StopReel
	ret

ReelAction_SetUpReel2SkipTo7:
; Unique reel 2 action (see Slots_StopReel2)
; Ensures that 7 symbols become lined up in the first two reels,
; but more often than not, this is only a way to get our hopes up, as
; it makes exciting reel #3 modes with no success hope more common.

	call Slots_CheckMatchedFirstTwoReels
	jr nc, .no_match
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr z, .no_match
	call Slots_StopReel
	ret

.no_match
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_REEL2_SKIP_TO_7
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], 32
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ret

ReelAction_WaitReel2SkipTo7:
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .ready
	dec [hl]
	ret

.ready
	ld a, SFX_THROW_BALL
	call Slots_PlaySFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_FAST_SPIN_REEL2_UNTIL_LINED_UP_7S
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

ReelAction_FastSpinReel2UntilLinedUp7s:
	call Slots_CheckMatchedFirstTwoReels
	ret nc
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	ret z
	call Slots_StopReel
	ret

ReelAction_InitGolem:
; Ensures SEVENs are lined up if there's bias to SEVEN.
; Ensures nothing is lined up if there's no bias symbols.
; No other bias symbols are compatible with this mode.

; This is achieved by throwing Golem until the desired result
; is produced. The amount of Golem thrown can be anywhere from
;  1 to 14 for SEVEN bias, and 4-8 for no bias.

	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_GOLEM
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	call Slots_GetNumberOfGolems
	push bc
	push af
	call Slots_RemoveBottomCoverSprites
; force update sprites from the beginning
	xor a
	ld [wCurSpriteOAMAddr], a
; execute deletion
	callfar DoNextFrameForFirst16Sprites
	depixel 12, 13
	ld a, SPRITE_ANIM_OBJ_SLOTS_GOLEM
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	pop af
	ld [hl], a
	pop bc
	xor a
	ld [wSlotsDelay], a
ReelAction_WaitGolem:
	ld a, [wSlotsDelay]
	cp 2
	jr z, .two
	cp 1
	jr z, .one
	ret

.two
	call Slots_CheckMatchedAllThreeReels
	call Slots_StopReel
	ret

.one
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_END_GOLEM
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

ReelAction_EndGolem:
	xor a
	ld [wSlotsDelay], a
	ld hl, REEL_ACTION
	add hl, bc
	dec [hl] ; REEL_ACTION_WAIT_GOLEM
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ret

ReelAction_InitChansey:
; Ensures the lining up of SEVEN symbols, but this mode is only possible
; when there is bias to SEVEN symbols (and even then, it's still rare).
; Chansey releases and egg and reel #3 is made to advance 17 slots very
; quickly as many times as necessary for the match to SEVENs to show up.

	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_CHANSEY
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	push bc
	call Slots_RemoveBottomCoverSprites
; force update sprites from the beginning
	xor a
	ld [wCurSpriteOAMAddr], a
; execute deletion
	callfar DoNextFrameForFirst16Sprites
	depixel 12, 0
	ld a, SPRITE_ANIM_OBJ_SLOTS_CHANSEY
	call InitSpriteAnimStruct
	pop bc
	xor a
	ld [wSlotsDelay], a
	ret

ReelAction_WaitChansey:
	ld a, [wSlotsDelay]
	and a
	ret z
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_EGG
	ld a, 2
	ld [wSlotsDelay], a
ReelAction_WaitEgg:
	ld a, [wSlotsDelay]
	cp $4
	ret c
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_DROP_REEL
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 16
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], 17
ReelAction_DropReel:
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check_match
	dec [hl]
	ret

.check_match
	call Slots_CheckMatchedAllThreeReels
	jr nc, .EggAgain
	and a
	jr nz, .EggAgain
	ld a, 5
	ld [wSlotsDelay], a
	call Slots_StopReel
	ret

.EggAgain:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ld hl, REEL_ACTION
	add hl, bc
	dec [hl]
	dec [hl] ; REEL_ACTION_WAIT_CHANSEY
	ld a, 1
	ld [wSlotsDelay], a
	ret

ReelAction_Unused:
	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_CHECK_DROP_REEL
	call Slots_GetNumberOfGolems
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], a
ReelAction_CheckDropReel:
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .spin
	call Slots_CheckMatchedAllThreeReels
	call Slots_StopReel
	ret

.spin
	dec [hl]
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_DROP_REEL
	ld hl, REEL_DROP_COUNTER
	add hl, bc
	ld [hl], 32
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
ReelAction_WaitDropReel:
	ld hl, REEL_DROP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .DropReel
	dec [hl]
	ret

.DropReel:
	ld hl, REEL_ACTION
	add hl, bc
	dec [hl] ; REEL_ACTION_CHECK_DROP_REEL
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

ReelAction_StartSlowAdvanceReel3:
; Ensures SEVENs are lined up if there's bias to SEVEN.
; Ensures nothing is lined up if there's no bias symbols.
; No other bias symbols are compatible with this mode.

; This is achieved by slowly advancing the reel a full round,
; plus any necessary slot until the desired result is produced.

	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 1
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_SLOW_ADVANCE_REEL3
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], 16
ReelAction_WaitSlowAdvanceReel3:
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check1
	dec [hl]
.play_sfx
	ld a, SFX_GOT_SAFARI_BALLS
	call Slots_PlaySFX
	ret

.check1
	ld a, [wSlotBias]
	and a
	jr nz, .check2
	call Slots_CheckMatchedAllThreeReels
	jr nc, .play_sfx
	and a
	jr nz, .play_sfx
	call Slots_StopReel
	call WaitSFX
	ret

.check2
	call Slots_CheckMatchedAllThreeReels
	jr c, .play_sfx
	call Slots_StopReel
	call WaitSFX
	ret

Slots_CheckMatchedFirstTwoReels:
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	call Slots_GetCurrentReelState
	call Slots_CopyReelState
	ld a, [wSlotBet]
	and 3
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ld a, [wFirstTwoReelsMatching]
	and a
	ret z
	scf
	ret

.Jumptable:
	dw .zero
	dw .one
	dw .two
	dw .three

.three
	call .CheckUpwardsDiag
	call .CheckDownwardsDiag

.two
	call .CheckBottomRow
	call .CheckTopRow

.one
	call .CheckMiddleRow

.zero
	ret

.CheckBottomRow:
	ld hl, wCurReelStopped
	ld a, [wReel1Stopped]
	cp [hl]
	call z, .StoreResult
	ret

.CheckUpwardsDiag:
	ld hl, wCurReelStopped + 1
	ld a, [wReel1Stopped]
	cp [hl]
	call z, .StoreResult
	ret

.CheckMiddleRow:
	ld hl, wCurReelStopped + 1
	ld a, [wReel1Stopped + 1]
	cp [hl]
	call z, .StoreResult
	ret

.CheckDownwardsDiag:
	ld hl, wCurReelStopped + 1
	ld a, [wReel1Stopped + 2]
	cp [hl]
	call z, .StoreResult
	ret

.CheckTopRow:
	ld hl, wCurReelStopped + 2
	ld a, [wReel1Stopped + 2]
	cp [hl]
	call z, .StoreResult
	ret

.StoreResult:
	ld [wSlotBuildingMatch], a
	and a
	jr nz, .matching_sevens
	ld a, 1
	ld [wFirstTwoReelsMatchingSevens], a

.matching_sevens
	ld a, 1
	ld [wFirstTwoReelsMatching], a
	ret

Slots_CheckMatchedAllThreeReels:
	ld a, SLOTS_NO_MATCH
	ld [wSlotMatched], a
	call Slots_GetCurrentReelState
	call Slots_CopyReelState
	ld a, [wSlotBet]
	and 3
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr nz, .matched_nontrivial
	and a
	ret

.matched_nontrivial
	scf
	ret

.Jumptable:
	dw .zero
	dw .one
	dw .two
	dw .three

.three
	call .CheckUpwardsDiag
	call .CheckDownwardsDiag

.two
	call .CheckBottomRow
	call .CheckTopRow

.one
	call .CheckMiddleRow

.zero
	ret

.CheckBottomRow:
	ld hl, wCurReelStopped
	ld a, [wReel1Stopped]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped
	cp [hl]
	call z, .StoreResult
	ret

.CheckUpwardsDiag:
	ld hl, wCurReelStopped + 2
	ld a, [wReel1Stopped]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	call z, .StoreResult
	ret

.CheckMiddleRow:
	ld hl, wCurReelStopped + 1
	ld a, [wReel1Stopped + 1]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	call z, .StoreResult
	ret

.CheckDownwardsDiag:
	ld hl, wCurReelStopped
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	call z, .StoreResult
	ret

.CheckTopRow:
	ld hl, wCurReelStopped + 2
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 2
	cp [hl]
	call z, .StoreResult
	ret

.StoreResult:
	ld [wSlotMatched], a
	ret

Slots_CopyReelState:
	ld de, wCurReelStopped
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

Slots_GetNumberOfGolems:
	ld hl, REEL_POSITION
	add hl, bc
	ld a, [hl]
	push af
	push hl
	call .Check7Bias
	pop hl
	pop af
	ld [hl], a
	ld a, e
	ret

.Check7Bias:
	ld a, [wSlotBias]
	and a
	jr nz, .not_biased_to_seven
	ld e, $0
.loop1
	ld hl, REEL_POSITION
	add hl, bc
	inc [hl]
	inc e
	push de
	call Slots_CheckMatchedAllThreeReels
	pop de
	jr nc, .loop1
	and a
	jr nz, .loop1
	ret

.not_biased_to_seven
	call Random
	and $7
	cp $8 / 2 ; 50%
	jr c, .not_biased_to_seven
	ld e, a
.loop2
	ld a, e
	inc e
	ld hl, REEL_POSITION
	add hl, bc
	add [hl]
	ld [hl], a
	push de
	call Slots_CheckMatchedAllThreeReels
	pop de
	jr c, .loop2
	ret

Slots_InitBias:
	ld a, [wSlotBias]
	and a
	ret z
	ld hl, .Normal
	ld a, [wScriptVar]
	and a
	jr z, .okay
	ld hl, .Lucky
.okay
	call Random
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr nc, .done
	inc hl
	jr .loop

.done
	ld a, [hl]
	ld [wSlotBias], a
	ret

.Normal:
	db   1 percent - 1, SLOTS_SEVEN
	db   1 percent + 1, SLOTS_BAR
	db   4 percent,     SLOTS_MAGNEMITE
	db   8 percent,     SLOTS_WOOPER
	db  16 percent,     SLOTS_LEDYBA
	db  19 percent,     SLOTS_CHERRY
	db 100 percent,     SLOTS_NO_BIAS

.Lucky:
	db   1 percent,     SLOTS_SEVEN
	db   1 percent + 1, SLOTS_BAR
	db   3 percent + 1, SLOTS_MAGNEMITE
	db   6 percent + 1, SLOTS_WOOPER
	db  12 percent,     SLOTS_LEDYBA
	db  31 percent + 1, SLOTS_CHERRY
	db 100 percent,     SLOTS_NO_BIAS

Slots_IlluminateBetLights:
	ld b, $18 ; turned on
	ld a, [wSlotBet]
	dec a
	jr z, Slots_Lights1OnOff
	dec a
	jr z, Slots_Lights2OnOff
	jr Slots_Lights3OnOff

Slots_DeilluminateBetLights:
	ld b, $16 ; turned off
Slots_Lights3OnOff:
	hlcoord 3, 2
	call Slots_TurnLightsOnOrOff
	hlcoord 3, 10
	call Slots_TurnLightsOnOrOff
Slots_Lights2OnOff:
	hlcoord 3, 4
	call Slots_TurnLightsOnOrOff
	hlcoord 3, 8
	call Slots_TurnLightsOnOrOff
Slots_Lights1OnOff:
	hlcoord 3, 6

Slots_TurnLightsOnOrOff:
	ld a, b
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 + 3
	add hl, de
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 - 3
	add hl, de
	inc a
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 + 3
	add hl, de
	ld [hl], a
	ret

Slots_AskBet:
.loop
	ld hl, .SlotsBetHowManyCoinsText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call CloseWindow
	ret c
	ld a, [wMenuCursorY]
	ld b, a
	ld a, 4
	sub b
	ld [wSlotBet], a
	ld hl, wCoins
	ld c, a
	ld a, [hli]
	and a
	jr nz, .Start
	ld a, [hl]
	cp c
	jr nc, .Start
	ld hl, .SlotsNotEnoughCoinsText
	call PrintText
	jr .loop

.Start:
	ld hl, wCoins + 1
	ld a, [hl]
	sub c
	ld [hld], a
	jr nc, .ok
	dec [hl]
.ok
	call WaitSFX
	ld de, SFX_PAY_DAY
	call PlaySFX
	ld hl, .SlotsStartText
	call PrintText
	and a
	ret

.SlotsBetHowManyCoinsText:
	text_far _SlotsBetHowManyCoinsText
	text_end

.SlotsStartText:
	text_far _SlotsStartText
	text_end

.SlotsNotEnoughCoinsText:
	text_far _SlotsNotEnoughCoinsText
	text_end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 10, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 3@"
	db " 2@"
	db " 1@"

Slots_AskPlayAgain:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr nz, .you_have_coins
	ld hl, .SlotsRanOutOfCoinsText
	call PrintText
	ld c, 60
	call DelayFrames
	jr .exit_slots

.you_have_coins
	ld hl, .SlotsPlayAgainText
	call PrintText
	call LoadMenuTextbox
	lb bc, 14, 12
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call CloseWindow
	and a
	jr nz, .exit_slots
	ld a, SLOTS_SPECIAL_ANIM_RESET_COLORS
	ld [wSlotsWhichSpecialAnim], a
	and a
	ret

.exit_slots
	ld a, SLOTS_SPECIAL_ANIM_RESET_COLORS
	ld [wSlotsWhichSpecialAnim], a
	scf
	ret

.SlotsRanOutOfCoinsText:
	text_far _SlotsRanOutOfCoinsText
	text_end

.SlotsPlayAgainText:
	text_far _SlotsPlayAgainText
	text_end

Slots_GetPayout:
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr z, .no_win
	srl a
	ld e, a
	ld d, 0
	ld hl, .PayoutTable
	add hl, de
	ld a, [hli]
	ld [wPayout + 1], a
	ld e, a
	ld a, [hl]
	ld [wPayout], a
	ld d, a
	farcall StubbedTrainerRankings_AddToSlotsPayouts
	ret

.PayoutTable:
	table_width 2
	dw 700 ; SLOTS_SEVEN
	dw 150 ; SLOTS_BAR
	dw  18 ; SLOTS_CHERRY
	dw  24 ; SLOTS_LEDYBA
	dw  30 ; SLOTS_WOOPER
	dw  45 ; SLOTS_MAGNEMITE
	assert_table_length NUM_SLOT_REELS

.no_win
	ld hl, wPayout
	xor a
	ld [hli], a
	ld [hl], a
	ret

Slots_PayoutText:
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr nz, .MatchedSomething
	ld hl, .SlotsDarnText
	call PrintText
	farcall StubbedTrainerRankings_EndSlotsWinStreak
	ret

.MatchedSomething:
	srl a
	ld e, a
	ld d, 0
	ld hl, .PayoutStrings
	add hl, de
	add hl, de
	add hl, de
	ld de, wStringBuffer2
	ld bc, 4
	call CopyBytes
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ld hl, .Text_PrintPayout
	call PrintText
	farcall StubbedTrainerRankings_AddToSlotsWinStreak
	ret

.PayoutStrings:
	table_width 6
	dbw "700@", .LinedUpSevens      ; SLOTS_SEVEN
	dbw "150@", .LinedUpPokeballs   ; SLOTS_BAR
	dbw "18@@", .LinedUpMonOrCherry ; SLOTS_CHERRY
	dbw "24@@", .LinedUpMonOrCherry ; SLOTS_LEDYBA
	dbw "30@@", .LinedUpMonOrCherry ; SLOTS_WOOPER
	dbw "45@@", .LinedUpMonOrCherry ; SLOTS_MAGNEMITE
	assert_table_length NUM_SLOT_REELS

.Text_PrintPayout:
	text_asm
	ld a, [wSlotMatched]
	add $2C ; TODO
	ldcoord_a 2, 13
	inc a
	ldcoord_a 2, 14
	inc a
	ldcoord_a 3, 13
	inc a
	ldcoord_a 3, 14
	hlcoord 18, 17
	ld [hl], "▼"
	ld hl, .SlotsLinedUpText
rept 4
	inc bc
endr
	ret

.SlotsLinedUpText:
	text_far _SlotsLinedUpText
	text_end

.SlotsDarnText:
	text_far _SlotsDarnText
	text_end

.LinedUpSevens:
	ld a, SFX_2ND_PLACE
	call Slots_PlaySFX
	call WaitSFX

; Oddly, the rarest mode (wKeepSevenBiasChance = 1) is the one with
; the worse odds to favor seven symbol streaks (12.5% vs 25%).
; it's possible that either the wKeepSevenBiasChance initialization
; or this code was intended to lead to flipped percentages.
	ld a, [wKeepSevenBiasChance]
	and a
	jr nz, .lower_seven_streak_odds
	call Random
	and %0010100
	ret z ; 25% chance to stick with seven symbol bias
	ld a, SLOTS_NO_BIAS
	ld [wSlotBias], a
	ret

.lower_seven_streak_odds
	call Random
	and %0011100
	ret z ; 12.5% chance to stick with seven symbol bias
	ld a, SLOTS_NO_BIAS
	ld [wSlotBias], a
	ret

.LinedUpPokeballs:
	ld a, SFX_3RD_PLACE
	call Slots_PlaySFX
	call WaitSFX
	ret

.LinedUpMonOrCherry:
	ld a, SFX_PRESENT
	call Slots_PlaySFX
	call WaitSFX
	ret

Slots_AnimateGolem:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .init
	dw .fall
	dw .roll

.init
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .retain
	ld a, 2
	ld [wSlotsDelay], a
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.retain
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], $0

.fall
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .play_sound
	dec [hl]
	ld e, a
	ld d, 14 * TILE_WIDTH
	farcall BattleAnim_Sine_e
	ld a, e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.play_sound
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $2
	ld a, 1
	ld [wSlotsDelay], a
	ld a, SFX_PLACE_PUZZLE_PIECE_DOWN
	call Slots_PlaySFX
	ret

.roll
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp 9 * TILE_WIDTH
	jr nc, .restart
	and $3
	ret nz
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ldh [hSCY], a
	ret

.restart
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	xor a
	ld [hl], a
	ldh [hSCY], a
	ret

Slots_AnimateChansey:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .walk
	dw .one
	dw .two

.walk
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp 13 * TILE_WIDTH
	jr z, .limit
	and $f
	ret nz
	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ret

.limit
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld a, 1
	ld [wSlotsDelay], a

.one
	ld a, [wSlotsDelay]
	cp $2
	jr z, .retain
	cp $5
	ret nz
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.retain
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $8
.two
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .spawn_egg
	dec [hl]
	ret

.spawn_egg
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
	push bc
	depixel 12, 13, 0, 4
	ld a, SPRITE_ANIM_OBJ_SLOTS_EGG
	call InitSpriteAnimStruct
	pop bc
	ret

Slots_WaitSFX:
	push bc
	ld c, 16
	call DelayFrames
	pop bc
	ret

Slots_PlaySFX:
	push de
	ld e, a
	ld d, 0
	call PlaySFX
	pop de
	ret

; The first three positions are repeated to
; avoid needing to check indices when copying.
Reel1Tilemap:
	db SLOTS_SEVEN      ;  0
	db SLOTS_CHERRY     ;  1
	db SLOTS_MAGNEMITE  ;  2
	db SLOTS_LEDYBA     ;  3
	db SLOTS_WOOPER     ;  4
	db SLOTS_SEVEN      ;  5
	db SLOTS_CHERRY     ;  6
	db SLOTS_MAGNEMITE  ;  7
	db SLOTS_LEDYBA     ;  8
	db SLOTS_WOOPER     ;  9
	db SLOTS_BAR        ; 10
	db SLOTS_CHERRY     ; 11
	db SLOTS_MAGNEMITE  ; 12
	db SLOTS_LEDYBA     ; 13
	db SLOTS_WOOPER     ; 14
	db SLOTS_SEVEN      ;  0
	db SLOTS_CHERRY     ;  1
	db SLOTS_MAGNEMITE  ;  2

Reel2Tilemap:
	db SLOTS_SEVEN      ;  0
	db SLOTS_LEDYBA     ;  1
	db SLOTS_CHERRY     ;  2
	db SLOTS_WOOPER     ;  3
	db SLOTS_MAGNEMITE  ;  4
	db SLOTS_BAR        ;  5
	db SLOTS_LEDYBA     ;  6
	db SLOTS_CHERRY     ;  7
	db SLOTS_WOOPER     ;  8
	db SLOTS_MAGNEMITE  ;  9
	db SLOTS_BAR        ; 10
	db SLOTS_LEDYBA     ; 11
	db SLOTS_CHERRY     ; 12
	db SLOTS_WOOPER     ; 13
	db SLOTS_MAGNEMITE  ; 14
	db SLOTS_SEVEN      ;  0
	db SLOTS_LEDYBA     ;  1
	db SLOTS_CHERRY     ;  2

Reel3Tilemap:
	db SLOTS_SEVEN      ;  0
	db SLOTS_WOOPER     ;  1
	db SLOTS_CHERRY     ;  2
	db SLOTS_BAR        ;  3
	db SLOTS_MAGNEMITE  ;  4
	db SLOTS_LEDYBA     ;  5
	db SLOTS_CHERRY     ;  6
	db SLOTS_WOOPER     ;  7
	db SLOTS_MAGNEMITE  ;  8
	db SLOTS_LEDYBA     ;  9
	db SLOTS_BAR        ; 10
	db SLOTS_CHERRY     ; 11
	db SLOTS_WOOPER     ; 12
	db SLOTS_MAGNEMITE  ; 13
	db SLOTS_LEDYBA     ; 14
	db SLOTS_SEVEN      ;  0
	db SLOTS_WOOPER     ;  1
	db SLOTS_CHERRY     ;  2

SlotsTilemap:
INCBIN "gfx/slots/slots.tilemap"

Slots1LZ:
INCBIN "gfx/slots/slots_1.2bpp.lz"

Slots2LZ:
INCBIN "gfx/slots/slots_2.2bpp.lz"

Slots3LZ:
INCBIN "gfx/slots/slots_3.2bpp.lz"
