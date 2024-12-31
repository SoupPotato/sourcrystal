RunMapSetupScript::
	ldh a, [hMapEntryMethod]
	and $f
	dec a
	ld c, a
	ld b, 0
	ld hl, MapSetupScripts
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapSetupScript
	ret

INCLUDE "data/maps/setup_scripts.asm"

ReadMapSetupScript:
.loop
	ld a, [hli]
	cp -1 ; end?
	ret z

	push hl

	ld c, a
	ld b, 0
	ld hl, MapSetupCommands
	add hl, bc
	add hl, bc
	add hl, bc

	; bank
	ld b, [hl]
	inc hl

	; address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Bit 7 of the bank indicates a parameter.
	; This is left unused.
	bit MAPSETUPSCRIPT_HAS_PARAM_F, b
	jr z, .go

	pop de
	ld a, [de]
	ld c, a
	inc de
	push de

.go
	ld a, b
	and $7f
	rst FarCall

	pop hl
	jr .loop

INCLUDE "data/maps/setup_script_pointers.asm"

EnableTextAcceleration:
	xor a
	ld [wDisableTextAcceleration], a
	ret

ActivateMapAnims:
	ld a, TRUE
	ldh [hMapAnims], a
	ret

SuspendMapAnims:
	xor a ; FALSE
	ldh [hMapAnims], a
	ret

LoadMapObjects_Connection:
	call ReassociateMapObjectsOrDelete
LoadMapObjects:
	ld a, MAPCALLBACK_OBJECTS
	call RunMapCallback
	farcall LoadObjectMasks
	farcall InitializeVisibleSprites
	ret

ReassociateMapObjectsOrDelete:
; Reassociates the objects if their coordinates match the relative coordinates
; of an object in the new map relative to the player, or it deletes the object.
	ld a, 1
	ldh [hObjectStructIndex], a
	ld bc, wObjectStructs + OBJECT_LENGTH
	ld e, NUM_OBJECT_STRUCTS - 1
.loop_objects
	push de
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld a, [hli]
	ld e, [hl]
	ld d, a
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld [wCurIcon], a
	call .CheckForMatchingMapObject
	jr nc, .DeleteObjectStruct

	; reassociate the object to the new matching mapobject.
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ldh a, [hMapObjectIndex]
	ld [hl], a

	; Update the object's map xy coordinates.
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, d
	ld [hli], a ; MapX
	ld a, e
	ld [hli], a; MapY
	ld a, d
	ld [hli], a ; LastMapX
	ld a, e
	ld [hli], a ; LastMapY
	ld a, d
	ld [hli], a ; InitX
	ld [hl], e ; InitY
.continue
	pop de
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hObjectStructIndex]
	inc a
	ldh [hObjectStructIndex], a
	dec e
	jr nz, .loop_objects
	ret

.DeleteObjectStruct
	; delete the object struct.
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld d, OBJECT_LENGTH
	xor a
.delete_loop
	ld [hli], a
	dec d
	jr nz, .delete_loop
	; mark the object as free.
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld [hl], UNASSOCIATED_OBJECT
	jr .continue

.CheckForMatchingMapObject
	push bc

	; Get the old object's coordinates relative to the player's old map coordinates.
	ld hl, wLastMapXCoord
	ld a, d
	sub 4
	sub [hl]
	dec hl ; wLastMapYCoord
	ld d, a
	ld a, e
	sub 4
	sub [hl]
	ld e, a

	ld a, 1
	ldh [hMapObjectIndex], a
	ld bc, wMapObjects + MAPOBJECT_LENGTH
.loop_map_objects
	push bc

	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [wCurIcon]
	cp [hl]
	jr nz, .next_map_object
	inc hl ; MAPOBJECT_Y_COORD

	; get map object's xy and convert
	ld a, [hli]
	sub 4
	ld c, a
	ld a, [hl]
	sub 4
	ld b, a

	; get the map object's coordinates relative to the player's new map coordinates.
	push hl
	ld hl, wXCoord
	ld a, b
	sub [hl]
	dec hl ; wYCoord
	ld b, a
	ld a, c
	sub [hl]
	ld c, a
	pop hl

	; compare the old and new coordinates
	cp e
	jr nz, .next_map_object
	ld a, b
	cp d
	jr nz, .next_map_object

	; they match, so reassociate the the mapobject to the object.
	ld d, b
	ld e, c
	pop bc
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ldh a, [hObjectStructIndex]
	ld [hl], a

	; convert the mapobject's xy relative coordinates to the new map's xy coordinates.
	ld a, [wXCoord]
	add d
	add 4
	ld d, a
	ld a, [wYCoord]
	add e
	add 4
	ld e, a
	scf
	jr .done

.next_map_object
	pop bc
	ldh a, [hMapObjectIndex]
	inc a
	ldh [hMapObjectIndex], a
	ld hl, MAPOBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, h
	cp HIGH(wMapObjectsEnd)
	jr nz, .loop_map_objects
	ld a, l
	cp LOW(wMapObjectsEnd)
	jr nz, .loop_map_objects
.done
	pop bc
	ret

MapSetup_DummyFunction: ; unreferenced
	ret

ResetPlayerObjectAction:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_RESET_ACTION_F, [hl]
	ret

SkipUpdateMapSprites:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F, [hl]
	ret

CheckUpdatePlayerSprite:
	call .CheckForcedBiking
	jr c, .ok
	call .CheckSurfing
	jr c, .ok
	call .ResetSurfingOrBikingState
	jr c, .ok
	ret

.ok
	call UpdatePlayerSprite
	ret

.CheckForcedBiking:
	and a
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	ret z
	ld a, PLAYER_BIKE
	ld [wPlayerState], a
	scf
	ret

.ResetSurfingOrBikingState:
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .nope
	cp PLAYER_SKATE
	jr z, .nope
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	call GetMapEnvironment
	cp INDOOR
	jr z, .no_biking
	cp ENVIRONMENT_5
	jr z, .no_biking
	cp DUNGEON
	jr z, .no_biking
	jr .nope
.no_biking
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .nope
.surfing
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	scf
	ret

.nope
	and a
	ret

.CheckSurfing:
	call CheckOnWater
	jr nz, .nope2
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .is_surfing
	cp PLAYER_SURF_PIKA
	jr z, .is_surfing
	ld a, PLAYER_SURF
	ld [wPlayerState], a
.is_surfing
	scf
	ret

.nope2
	and a
	ret

FadeOutMapMusic:
	ld a, 6
	call SkipMusic
	ret

ApplyMapPalettes:
	farcall _UpdateTimePals
	ret

FadeMapMusicAndPalettes:
	ld e, LOW(MUSIC_NONE)
	ld a, [wMusicFadeID]
	ld d, HIGH(MUSIC_NONE)
	ld a, [wMusicFadeID + 1]
	ld a, $4
	ld [wMusicFade], a
	call RotateThreePalettesRight
	ret

ForceMapMusic:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .notbiking
	call MinVolume
	ld a, $88
	ld [wMusicFade], a
.notbiking
	call TryRestartMapMusic
	ret
