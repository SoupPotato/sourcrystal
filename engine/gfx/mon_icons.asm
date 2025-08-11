LoadOverworldMonIcon:
	ld a, e
	ld [wCurIcon], a
	cp ICON_UNOWN
	jr nz, .not_unown

	ld a, [wCurIconForm]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, UnownIconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	lb bc, BANK("Unown Icons"), 8
	ret

.not_unown
	; fallthrough
_LoadOverworldMonIcon:
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	jp GetIconBank

SetMenuMonIconColor:
	push hl
	push de
	push bc
	push af

	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	call GetMenuMonIconPalette
	ld hl, wShadowOAMSprite00Attributes
	jr _ApplyMenuMonIconColor

SetMenuMonIconColor_NoShiny:
	push hl
	push de
	push bc
	push af

	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	and a
	call GetMenuMonIconPalette_PredeterminedShininess
	ld hl, wShadowOAMSprite00Attributes
	jr _ApplyMenuMonIconColor

LoadPartyMenuMonIconColors:
	push hl
	push de
	push bc
	push af

	ld a, [wPartyCount]
	sub c
	ld [wCurPartyMon], a
	ld e, a
	ld d, 0

	ld hl, wPartyMon1Item
	call GetPartyLocation
	ld a, [hl]
	ld [wCurIconMonHasItemOrMail], a

	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld a, MON_DVS
	call GetPartyParamLocation
	call GetMenuMonIconPalette
	ld hl, wShadowOAMSprite00Attributes
	push af
	ld a, [wCurPartyMon]
	swap a
	ld d, 0
	ld e, a
	add hl, de
	pop af

	ld de, 4
	ld [hl], a ; top left
	add hl, de
	ld [hl], a ; top right
	add hl, de
	push hl
	add hl, de
	ld [hl], a ; bottom right
	pop hl
	ld d, a
	ld a, [wCurIconMonHasItemOrMail]
	and a
	ld a, PAL_OW_RED ; item or mail color
	jr nz, .ok
	ld a, d
.ok
	ld [hl], a ; bottom left
	jr _FinishMenuMonIconColor

_ApplyMenuMonIconColor:
	ld c, 4
	ld de, 4
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	; fallthrough
_FinishMenuMonIconColor:
	pop af
	pop bc
	pop de
	pop hl
	ret

GetMonPalInBCDE:
; Sets BCDE to mon icon palette.
; Input: c = species, b = shininess (1=true, 0=false)
	ld hl, MonMenuIconPals
	dec c

	; This sets z if mon is shiny.
	dec b
	ld b, 0
	add hl, bc
	ld a, [hl]
	jr z, .shiny
	swap a
.shiny
	and $f

	; Now we have the target color. Get the palette (+ 2 to avoid white).
	ld hl, PartyMenuOBPals + 2
	ld bc, 1 palettes
	call AddNTimes

	push hl
	ld a, BANK(PartyMenuOBPals)
	call GetFarWord
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	ld a, BANK(PartyMenuOBPals)
	call GetFarWord
	ld d, h
	ld e, l
	ret

GetMenuMonIconPalette:
	ld c, l
	ld b, h
	farcall CheckShininess
GetMenuMonIconPalette_PredeterminedShininess:
	push af
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, MonMenuIconPals
	add hl, bc
	ld e, [hl]
	pop af
	ld a, e
	jr c, .shiny
	swap a
.shiny
	and $f
	ld e, a
	ret

LoadPagerMonIcon:
	ld a, e
	call ReadMonMenuIcon
	ld [wCurIcon], a
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurIcon]
	cp MAGIKARP ; first mon in Icons2
	ld bc, 8 tiles
	ld e, BANK("Mon Icons 1")
	ret c
	ld e, BANK("Mon Icons 2")
	ret

LoadMenuMonIcon:
	push hl
	push de
	push bc
	call .LoadIcon
	pop bc
	pop de
	pop hl
	ret

.LoadIcon:
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to MONICON_* constants
	dw PartyMenu_InitAnimatedMonIcon    ; MONICON_PARTYMENU
	dw NamingScreen_InitAnimatedMonIcon ; MONICON_NAMINGSCREEN
	dw MoveList_InitAnimatedMonIcon     ; MONICON_MOVES
	dw Trade_LoadMonIconGFX             ; MONICON_TRADE
	dw Mobile_InitAnimatedMonIcon       ; MONICON_MOBILE1
	dw Mobile_InitPartyMenuBGPal71      ; MONICON_MOBILE2
	dw Unused_GetPartyMenuMonIcon       ; MONICON_UNUSED

Unused_GetPartyMenuMonIcon:
	call InitPartyMenuIcon
	call .GetPartyMonItemGFX
	call SetPartyMonIconAnimSpeed
	ret

.GetPartyMonItemGFX:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .no_item
	push hl
	push bc
	ld d, a
	callfar ItemIsMail
	pop bc
	pop hl
	jr c, .not_mail
	ld a, $06
	jr .got_tile
.not_mail
	ld a, $05
	; fallthrough

.no_item
	ld a, $04
.got_tile
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

Mobile_InitAnimatedMonIcon:
	call PartyMenu_InitAnimatedMonIcon
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld a, SPRITE_ANIM_FUNC_NULL
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, 9 * TILE_WIDTH
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, 9 * TILE_WIDTH
	ld [hl], a
	ret

Mobile_InitPartyMenuBGPal71:
	call InitPartyMenuIcon
	call SetPartyMonIconAnimSpeed
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld a, SPRITE_ANIM_FUNC_NULL
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, 3 * TILE_WIDTH
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, 12 * TILE_WIDTH
	ld [hl], a
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

PartyMenu_InitAnimatedMonIcon:
	call InitPartyMenuIcon
	call .SpawnItemIcon
	call SetPartyMonIconAnimSpeed
	ret

.SpawnItemIcon:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callfar ItemIsMail
	pop bc
	pop hl
	jr c, .mail
	ld a, SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM
	jr .okay

.mail
	ld a, SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL
.okay
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

InitPartyMenuIcon:
	call LoadPartyMenuMonIconColors
	ld a, [wCurIconTile]
	push af
	ldh a, [hObjectStructIndex]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	push hl
	ld [wCurIcon], a
	pop hl
	ld a, MON_DVS
	call GetPartyParamLocation
	ld e, l
	ld d, h
	call GetMemIconGFX
	ldh a, [hObjectStructIndex]
; y coord
	add a
	add a
	add a
	add a
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	pop af
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	ret

SetPartyMonIconAnimSpeed:
	push bc
	ldh a, [hObjectStructIndex]
	ld b, a
	call .getspeed
	ld a, b
	pop bc
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ret

.getspeed
	farcall PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, .speeds
	add hl, de
	ld b, [hl]
	ret

.speeds
	db $00 ; HP_GREEN
	db $40 ; HP_YELLOW
	db $80 ; HP_RED

NamingScreen_InitAnimatedMonIcon:
	ld hl, wTempMonDVs
	call SetMenuMonIconColor
	ld a, [wTempIconSpecies]
	push hl
	pop de
	ld [wCurIcon], a
	xor a
	call GetIconGFX
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ret

MoveList_InitAnimatedMonIcon:
	ld a, MON_DVS
	call GetPartyParamLocation
	call SetMenuMonIconColor
	ld a, [wTempIconSpecies]
	push hl
	pop de
	ld [wCurIcon], a
	xor a
	call GetIconGFX
	ld d, 3 * TILE_WIDTH + 2 ; depixel 3, 4, 2, 4
	ld e, 4 * TILE_WIDTH + 4
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ret

Trade_LoadMonIconGFX:
	ld hl, wTempMonDVs
	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	ld [wCurIcon], a
	call GetMenuMonIconPalette
	add a
	add a
	add a
	ld e, a
	farcall SetSecondOBJPalette
	ld a, $62
	ld [wCurIconTile], a
	ld de, wTempMonDVs
	call GetMemIconGFX
	ret

FlyFunction_GetMonIcon:
	push de
	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret

GetSpeciesIcon:
; Load species icon into VRAM at tile a
	push de
	ld a, MON_DVS
	call GetPartyParamLocation
	call SetMenuMonIconColor
	ld a, [wTempIconSpecies]
	push hl
	pop hl
	ld [wCurIcon], a
	pop de
	ld a, e
	ld e, l
	ld d, h
	call GetIconGFX
	ret

GetSwarmIcon:
	push de
	ld a, [wTempSpecies]
	call FlyMonMenuIcon
	ld [wCurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret

SetOWFlyMonColor:
	push hl
	push de
	push bc
	push af
	call GetMenuMonIconPalette
	ld [wNeededPalIndex], a
	ld b, a
	push bc
	ld b, 0
	ld a, [wUsedObjectPals]
	inc a
	jr z, .unset_bit_found
	dec a
	ld b, -1
.bit_check_loop
	inc b
	rrca
	jr c, .bit_check_loop
.unset_bit_found
	ld a, b
	pop bc
	ld c, a
	ld a, b
	ld b, 0
	ld hl, wLoadedObjPal0
	add hl, bc
	ld [hl], a
	push bc
	ld a, c
	ld bc, 1 palettes
	ld hl, wOBPals1
	call AddNTimes
	ld d, h
	ld e, l
	farcall CopySpritePal
	pop bc
	ldh a, [hUsedOAMIndex]
	cp (NUM_SPRITE_OAM_STRUCTS - NUM_FLYFROM_ANIM_OAMS - 1) * SPRITEOAMSTRUCT_LENGTH
	; if we didn't have enough OAM slots, we need to use the last NUM_FLYFROM_ANIM_OAMS slots
	ld a, (NUM_SPRITE_OAM_STRUCTS - NUM_FLYFROM_ANIM_OAMS) * SPRITEOAMSTRUCT_LENGTH
	jr nc, .got_oam_addr
	ldh a, [hUsedOAMIndex]
	; a = (NUM_SPRITE_OAM_STRUCTS - NUM_FLYFROM_ANIM_OAMS) * SPRITEOAMSTRUCT_LENGTH + 1
	cpl
	add (NUM_SPRITE_OAM_STRUCTS - NUM_FLYFROM_ANIM_OAMS) * SPRITEOAMSTRUCT_LENGTH + 1
.got_oam_addr
	ld hl, wShadowOAM + SPRITEOAMSTRUCT_ATTRIBUTES
	add l
	ld l, a
	ld a, c
	ld c, 4
	ld de, 4
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	jp PopAFBCDEHL

GetMemIconGFX:
	ld a, [wCurIconTile]
GetIconGFX:
	call GetIcon_a
	ld de, 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

HeldItemIcons:
INCBIN "gfx/stats/mail.2bpp"
INCBIN "gfx/stats/item.2bpp"

GetIcon_de:
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a:
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon:
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	push de
	ld de, vTiles0
	add hl, de
	pop de
	push hl

	push hl
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .not_unown
	ld l, e
	ld h, d
	predef GetUnownLetter
	ld a, [wUnownLetter]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, UnownIconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	lb bc, BANK("Unown Icons"), 8
	pop hl
	jr .continue

.not_unown
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	call GetIconBank
.continue
	call GetGFXUnlessMobile
	pop hl
	ret

GetIconBank:
	ld a, [wCurIcon]
	cp MAGIKARP ; first species in "Mon Icons 2"
	lb bc, BANK("Mon Icons 1"), 8
	ret c
	ld b, BANK("Mon Icons 2")
	ret

GetGFXUnlessMobile:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, .not_mobile
	jp Get2bppViaHDMA
.not_mobile
	ld a, [wSwarmFlags]
	and (1 << SWARMFLAGS_LOAD_POKEGEAR_GFX_F)
	jp z, Request2bpp
	ld c, 8
	jp Get2bpp


GetStorageIcon_a:
; Load frame 1 icon graphics into VRAM starting from tile a
	ld l, a ; no-optimize hl|bc|de = a * 16 (rept)
	ld h, 0
rept 4
	add hl, hl
endr
	ld de, vTiles0
	add hl, de
	; fallthrough
GetStorageIcon:
	push hl
	ld a, [wCurIcon]
	ld e, a
	ld a, [wCurIconForm]
	ld d, a
	call LoadOverworldMonIcon
	ld c, 4
	pop hl
	newfarjp BillsPC_SafeGet2bpp

FreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wMenuCursorY]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, SPRITE_ANIM_FUNC_NULL
	jr .ok

.loadwithtwo
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SWITCH

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

UnfreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
.loop
	ld a, [hl]
	and a
	jr z, .next
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_PARTY_MON
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

HoldSwitchmonIcon:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wSwitchMon]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .is_switchmon
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SELECTED
	jr .join_back

.is_switchmon
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SWITCH
.join_back
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

ReadMonMenuIcon:
	cp EGG
	jr z, .egg
	dec a
	ld hl, MonMenuIcons
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret
.egg
	ld a, ICON_EGG
	ret

FlyMonMenuIcon: ; 8eab3
	jr z, .bird
	dec a
	ld hl, MonMenuIcons
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret
.bird
	ld a, ICON_PIDGEOT
	ret

INCLUDE "data/pokemon/menu_icons.asm"

INCLUDE "data/pokemon/menu_icon_pals.asm"

INCLUDE "data/pokemon/icon_pointers.asm"

INCLUDE "data/pokemon/unown_icon_pointers.asm"
