ItemFinder:
	farcall CheckForHiddenItems
	jr c, .found_something
	ld hl, .Script_FoundNothing
	jr .resume

.found_something
	ld hl, .Script_FoundSomething

.resume
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.ItemfinderSound:
; if dx == 0 && dy == 0; no direction
; so the item is below us
	ld a, [wHiddenItemXDelta]
	ld b, a
	ld a, [wHiddenItemYDelta]
	or b
	jr z, .skip_animation
	ld a, [wHiddenItemYDelta]
	and a
	jr nz, .dy_is_not_zero
	; b already loaded with wHiddenItemXDelta
	bit 7, b
	jr z, .east
	; dx < 0
	ld a, ANIMFUNC_ITEMFINDER_WEST
	ld [wHiddenItemDirection], a
	jr .got_direction
.east
	ld a, ANIMFUNC_ITEMFINDER_EAST
	ld [wHiddenItemDirection], a
	jr .got_direction
.dy_is_not_zero
	; a is already loaded with wHiddenItemYDelta
	bit 7, a
	jr z, .north
	; dy < 0
	ld a, ANIMFUNC_ITEMFINDER_SOUTH
	ld [wHiddenItemDirection], a
	jr .got_direction
.north
	ld a, ANIMFUNC_ITEMFINDER_NORTH
	ld [wHiddenItemDirection], a
.got_direction
	call ItemFinderAnimation
	ret

.skip_animation
	ld c, 4
.sfx_loop
	push bc
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call WaitPlaySFX
	ld de, SFX_TRANSACTION
	call WaitPlaySFX
	pop bc
	dec c
	jr nz, .sfx_loop
	ret

.Script_FoundSomething:
	refreshmap
	special UpdateTimePals
	callasm .ItemfinderSound
	writetext .ItemfinderItemNearbyText
	closetext
	end

.Script_FoundNothing:
	refreshmap
	special UpdateTimePals
	writetext .ItemfinderNopeText
	closetext
	end

.ItemfinderItemNearbyText:
	text_far _ItemfinderItemNearbyText
	text_end

.ItemfinderNopeText:
	text_far _ItemfinderNopeText
	text_end

ItemFinderAnimation:
	xor a
	ld [wJumptableIndex], a
	ld [wHiddenItemArrowSprite], a
	farcall ClearSpriteAnims

	; load gfx
	ld de, ItemFinderGFX
	ld hl, vTiles1 tile 0
	lb bc, BANK(ItemFinderGFX), 24
	call Request2bpp

	ld hl, wWeatherFlags
	res OW_WEATHER_DISABLED_F, [hl]

.loop
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .finish

	; update overworld
	call .RefreshSprites

	; update sprite animations
	ld a, LOW(wShadowOAMSprite32)
	ld [wCurSpriteOAMAddr], a
	farcall DoNextFrameForAllSprites_OW

	; prevent from going too fast
	call DelayFrame
	farcall DoOverworldWeather
	ld hl, wOverworldRunTimer
	inc [hl]
	call .Jumptable
	call DelayFrame
	jr .loop

.finish
	call .FinishSprites
	call BufferScreen
	call DelayFrame
	call LoadStandardFont
	ret

; from the subroutine from cut:
;   1. update the overworld sprites (every frame)
;   2. shift by 8 slots to make room for the itemfinder sprites
.RefreshSprites:
	farcall HandleMapObjects
	farcall _UpdateSprites
	; shift all sprites left in OAM by 8 slots
	; a = (NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH) - a
	ldh a, [hUsedOAMIndex]
	cpl
	add NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH + 1
	; hl = source
	ld h, HIGH(wShadowOAM)
	ld l, a
	; de = destination
	sub (8 * SPRITEOAMSTRUCT_LENGTH)
	ld e, a
	ld d, h
	; bc = length
	ld b, 0
	ldh a, [hUsedOAMIndex]
	ld c, a
.copy_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy_loop
	ret

; from the subroutine from cut:
;   1. shift ALL sprites right by 8 slots to ensure the weather thing affects what it's
;      supposed to
.FinishSprites:
	; hl = source
	ld hl, wShadowOAMSprite31 + 3
	; de = destination
	ld de, wShadowOAMSprite39 + 3
	; bc = length
	ld bc, SPRITEOAMSTRUCT_LENGTH * (40-8)
.copy_done_loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .copy_done_loop
	ret

.Jumptable:
	jumptable .dw, wJumptableIndex

.dw
rept 3
	dw .SpawnArrowAndPlayFirstSound
	dw .WaitAnimSFX
	dw .PlaySecondSound
	dw .WaitAnimSFX
endr
	dw .WaitALittleMore
	dw .WaitAnimSFX
	dw .Finish

.SpawnArrowAndPlayFirstSound:
	depixel 10, 10, 4, 0 ; start from middle of screen
	ld a, SPRITE_ANIM_OBJ_ITEMFINDER
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_VAR1 ; Direction
	add hl, bc
	ld a, [wHiddenItemDirection]
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_VAR2 ; Sprite offset
	add hl, bc
	ld a, [wHiddenItemArrowSprite]
	ld [hl], a
	add 4
	ld [wHiddenItemArrowSprite], a

	ld a, 3
	ld [wFrameCounter], a

	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call PlaySFX

	ld hl, wJumptableIndex
	inc [hl]
	ret

.PlaySecondSound:
	ld a, 6
	ld [wFrameCounter], a

	ld de, SFX_TRANSACTION
	call WaitPlaySFX

	ld hl, wJumptableIndex
	inc [hl]
	ret

.WaitAnimSFX:
	ld a, 1
	ldh [hBGMapMode], a
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret
.done
	ld hl, wJumptableIndex
	inc [hl]
	ret

.WaitALittleMore:
; should be enough time for all sprites to deinit
	ld a, 10 ; frames
	ld [wFrameCounter], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.Finish:
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret

ItemFinderGFX:
INCBIN "gfx/overworld/itemfinder.2bpp"
