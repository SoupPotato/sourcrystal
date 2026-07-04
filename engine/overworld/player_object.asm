BlankScreen:
	call DisableSpriteUpdates
	xor a
	ldh [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, wAttrmapEnd - wAttrmap
	ld a, $7
	call ByteFill
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ret

SpawnPlayer:
	ld a, -1
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ld a, PLAYER
	ld hl, PlayerObjectTemplate
	call CopyPlayerObjectTemplate
	ld b, PLAYER
	call PlayerSpawn_ConvertCoords
	ld a, PLAYER_OBJECT
	call GetMapObject
	ld hl, MAPOBJECT_PALETTE
	add hl, bc
	lb de, PAL_NPC_RED, OBJECTTYPE_SCRIPT
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .ok
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .ok
	assert PAL_NPC_RED + 1 == PAL_NPC_BLUE
	inc d

.ok
	ld [hl], d
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld [hl], e
	ld a, PLAYER_OBJECT
	ldh [hMapObjectIndex], a
	ld bc, wMapObjects
	ld a, PLAYER_OBJECT
	ldh [hObjectStructIndex], a
	ld de, wObjectStructs
	call CopyMapObjectToObjectStruct
	ld a, PLAYER
	ld [wCenteredObject], a
	ret

PlayerObjectTemplate:
; A dummy map object used to initialize the player object.
; Shorter than the actual amount copied by two bytes.
; Said bytes seem to be unused.
	object_event -4, -4, SPRITE_CHRIS, SPRITEMOVEDATA_PLAYER, 15, 15, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 0, -1

SpawnFollower:
	xor a
	ld [wFollowerNextMovement], a
	ld a, FOLLOWER
	ld hl, FollowerObjectTemplate
	call CopyPlayerObjectTemplate
	ld b, FOLLOWER
	jp PlayerSpawn_ConvertCoords

FollowerObjectTemplate:
	object_event -4, -4, SPRITE_CHRIS, SPRITEMOVEDATA_FOLLOWEROBJ, 15, 15, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

DeleteFollower::
	ld a, FOLLOWER
	jp DeleteObjectStruct

ReappearFollower::
	xor a
	ld [wFollowerNextMovement], a
	call RefreshPlayerCoords
	call RepositionFollowerIfAtNPC
	call RepositionFollowerIfLedge
	ld a, FOLLOWER
	call UnmaskCopyMapObjectStruct
	call AdjustFollowerFacing
	jp InitializeVisibleSprites

; force spawning atop the player, really for the surf case
ReappearFollowerInPlace::
	xor a
	ld [wFollowerNextMovement], a
	call RefreshPlayerCoords
	lb bc, PLAYER, FOLLOWER
	call CopyObjectPosition
	ld a, FOLLOWER
	call UnmaskCopyMapObjectStruct
	call AdjustFollowerFacing
	jp InitializeVisibleSprites

CopyDECoordsToMapObject::
	push de
	ld a, b
	call GetMapObject
	pop de
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld [hl], d
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld [hl], e
	ret

PlayerSpawn_ConvertCoords:
	push bc
	ld a, [wXCoord]
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	pop bc
	call CopyDECoordsToMapObject
	ret

WriteObjectXY::
	ld a, b
	call CheckObjectVisibility
	ret c

	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]
	ldh a, [hMapObjectIndex]
	ld b, a
	call CopyDECoordsToMapObject
	and a
	ret

RepositionFollowerAtCarpet:
; fetch the player's position into de
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
; save position
	push de
	call GetCoordTileCollision
	pop de
; determine how to move the follower
; it should spawn beside the player, but that depends on
; what kind of tile the player is currently standing in.
	cp COLL_WARP_CARPET_UP
	jr z, .up_down
	cp COLL_WARP_CARPET_DOWN
	jr z, .up_down
	cp COLL_WARP_CARPET_LEFT
	jr z, .left_right
	cp COLL_WARP_CARPET_RIGHT
	jr z, .left_right
; anything else redirects to player's pos.
	jr .move_follower
.left_right
	inc e
	push de
	push af
	dec e
	dec e
	jr .check
.up_down
	inc d
	push de
	push af
	dec d
	dec d
.check
	push de
	call GetCoordTileCollision
	pop de
	ld b, a
	pop af
	cp b
	jr z, .move_follower_1
	pop de
	push af
	push de
	call GetCoordTileCollision
	pop de
	ld b, a
	pop af
	cp b
	jr z, .move_follower
	ret
.move_follower_1
	pop bc
.move_follower
	ld a, d
	ld [wFollowerObjectXCoord], a
	ld a, e
	ld [wFollowerObjectYCoord], a
	ret

AdjustFollowerFacing:
	ld bc, wPlayerStruct
	call GetSpriteDirection
	ld bc, wFollowerStruct
	jp SetSpriteDirection

RefreshPlayerCoords:
	ld a, [wXCoord]
	add 4
	ld d, a
	ld hl, wPlayerMapX
	sub [hl]
	ld [hl], d
	ld hl, wMapObjects + MAPOBJECT_X_COORD
	ld [hl], d
	ld hl, wPlayerLastMapX
	ld [hl], d
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	ld hl, wPlayerMapY
	sub [hl]
	ld [hl], e
	ld hl, wMapObjects + MAPOBJECT_Y_COORD
	ld [hl], e
	ld hl, wPlayerLastMapY
	ld [hl], e
	ld e, a

; fallthrough

; This is the "base" follower repositioning, solely for positioning
; it exactly one tile behind the player. Other checks like *IsAtNPC
; or *IfLedge add to this.
RefreshFollowerCoords:
	lb bc, PLAYER, FOLLOWER
	call CopyObjectPosition

; move follower backwards based on the player's current direction
	ld a, [wFollowerObject + MAPOBJECT_X_COORD]
	ld d, a
	ld a, [wFollowerObject + MAPOBJECT_Y_COORD]
	ld e, a

; there's two sources:
; PlayerStepDirection is the one used when *walking*
	ld a, [wPlayerStepDirection]
	cp STANDING
	jr nz, .got_direction
; PlayerDirection is when the player is still
	ld a, [wPlayerDirection]
	srl a
	srl a

.got_direction
	call GetOneStepBehind

; fallthrough

ApplyFollowerCoords:
	; apply new calculated coordinates
	ld a, d
	ld [wFollowerObject + MAPOBJECT_X_COORD], a
	ld a, e
	ld [wFollowerObject + MAPOBJECT_Y_COORD], a
	ret

; INPUT
;	a = direction
;	de = object position
; OUTPUT
;	de = one step behind
GetOneStepBehind:
	cp DOWN
	jr z, .is_down
	cp UP
	jr z, .is_up
	cp LEFT
	jr z, .is_left
	cp RIGHT
	jr z, .is_right
	; standing = no change
	ret
.is_down
	dec e
	ret
.is_up
	inc e
	ret
.is_left
	inc d
	ret
.is_right
	dec d
	ret

; INPUT
;	c = who's moving
;	b = whose position to target
; OUTPUT
;	map object `c` pos. <- map object `b` pos.
CopyObjectPosition:
	; de = address of `c` object
	push bc
		ld a, c
		call GetMapObject
		ld d, b
		ld e, c
	pop bc

	; bc = address of `b` object
	ld a, b
	call GetMapObject

	; set `c`s position to where `b` is
	ld hl, MAPOBJECT_X_COORD
	push hl
		add hl, bc
		ld a, [hl]
	pop hl
	add hl, de
	ld [hl], a

	ld hl, MAPOBJECT_Y_COORD
	push hl
		add hl, bc
		ld a, [hl]
	pop hl
	add hl, de
	ld [hl], a
	ret

; should be called right after repositioning/reappearing a follower
;
; here we check if someone's already spawned where the
; follower wants to spawn.
; 
; XXX: IF THE PLAYER IS SURROUNDED, THIS WILL BE AN INFINITE LOOP!
; 
RepositionFollowerIfAtNPC:
; if where the follower spawns is free, don't do anything
	ld a, [wFollowerObject + MAPOBJECT_X_COORD]
	ld d, a
	ld a, [wFollowerObject + MAPOBJECT_Y_COORD]
	ld e, a
	newfarcall IsNPCAtCoord
	ret nc

; reroll anew if it's taken
	ld a, [wPlayerObject + MAPOBJECT_X_COORD]
	ld d, a
	ld a, [wPlayerObject + MAPOBJECT_Y_COORD]
	ld e, a
; repeat the directional check from before
	ld a, [wPlayerStepDirection]
	cp STANDING
	jr nz, .got_dir
	ld a, [wPlayerDirection]
	srl a
	srl a
; duplicates GetOneStepBehind, but with checks
.got_dir
	cp DOWN
	jr z, .is_down
	cp UP
	jr z, .is_up
	cp LEFT
	jr z, .is_left
	cp RIGHT
	jr z, .is_right
	; standing = no change; re-apply coordinates
.is_down
	dec e
	newfarcall IsNPCAtCoord
	jr nc, ApplyFollowerCoords
; restore the player's position so we can
; calculate the next available direction
	inc e
.is_up
	inc e
	newfarcall IsNPCAtCoord
	jp nc, ApplyFollowerCoords
	dec e
.is_left
	inc d
	newfarcall IsNPCAtCoord
	jp nc, ApplyFollowerCoords
	dec d
.is_right
	dec d
	newfarcall IsNPCAtCoord
	jp nc, ApplyFollowerCoords
	inc d
; infinite loop here, because I don't really want odd
; edge cases where "the follower doesn't spawn in sometimes"
; and it should be unlikely that the player is surrounded, anyway.
	jr .is_down

; pushes the follower further away if the player has just jumped
; from a ledge, so as not to spawn ON the ledge itself.
RepositionFollowerIfLedge:
	ld a, [wFollowerObject + MAPOBJECT_X_COORD]
	ld d, a
	ld a, [wFollowerObject + MAPOBJECT_Y_COORD]
	ld e, a
; repeat the directional check YET AGAIN
	ld a, [wPlayerStepDirection]
	cp STANDING
	jp nz, .got_dir
	ld a, [wPlayerDirection]
	srl a
	srl a
.got_dir
	call GetOneStepBehind
	push de
	call GetCoordTileCollision
	pop de
	and $f0
	cp HI_NYBBLE_LEDGES
; if it isn't, no need to do anything
	ret nz
; prepare the follower for a jump
	ld a, FOLLOWERMOVE_PREPARE_JUMP
	ld [wFollowerNextMovement], a
	jp ApplyFollowerCoords


CopyObjectStruct::
	call CheckObjectMask
	and a
	ret nz ; masked

; Force the follower into slot 1 (player's on slot 0)
; enables the loading behavior to be predictable
	ldh a, [hMapObjectIndex]
	cp FOLLOWER
	jr z, .follower

; Because the follower is forced onto slot 1, that means
; the rest of the objects will have to occupy slot 2+
	ld hl, wObject2Struct + OBJECT_MAP_OBJECT_INDEX
	ld a, 2
	ld de, OBJECT_LENGTH
.loop
	ldh [hObjectStructIndex], a
	ld a, [hl]
	inc a
	assert UNASSOCIATED_OBJECT == -1
	jr z, .done
	add hl, de
	ldh a, [hObjectStructIndex]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	scf
	ret ; overflow

.follower
; And yes it has to be OBJECT_MAP_OBJECT_INDEX
	ld hl, wFollowerStruct + OBJECT_MAP_OBJECT_INDEX
	ld a, FOLLOWER
	ldh [hObjectStructIndex], a

.done
	ld d, h
	ld e, l
	dec de
	call CopyMapObjectToObjectStruct
	ld hl, wStateFlags
	bit SCRIPTED_MOVEMENT_STATE_F, [hl]
	ret z

	ld hl, OBJECT_FLAGS2
	add hl, de
	set FROZEN_F, [hl]
	farcall CheckForUsedObjPals
	ret

CopyMapObjectToObjectStruct:
	call .CopyMapObjectToTempObject
	call CopyTempObjectToObjectStruct
	ret

.CopyMapObjectToTempObject:
	ldh a, [hObjectStructIndex]
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld [hl], a

	ldh a, [hMapObjectIndex]
	ld [wTempObjectCopyMapObjectIndex], a

	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopySprite], a

	call GetSpriteVTile
	ld [wTempObjectCopySpriteVTile], a

	ld a, [hl]
	call GetSpritePalette
	ld [wTempObjectCopyPalette], a

	ld hl, MAPOBJECT_PALETTE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .skip_color_override
	dec a
	ld [wTempObjectCopyPalette], a

.skip_color_override
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyMovement], a

	ld hl, MAPOBJECT_SIGHT_RANGE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRange], a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyX], a

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyY], a

	ld hl, MAPOBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRadius], a
	ret

InitializeVisibleSprites:
; this special case is for the bike/surf status, lets
; the engine know not to make the follower reappear here
	ld a, [wPlayerState]
	assert PLAYER_NORMAL == 0
	and a ; PLAYER_NORMAL
	jr z, .follower
	ld bc, wMap2Object
	ld a, 2
	jr .loop
.follower
	ld bc, wFollowerObject
	ld a, 1
.loop
	ldh [hMapObjectIndex], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next

	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp UNASSOCIATED_MAPOBJECT
	jr nz, .next

	ld a, [wXCoord]
	ld d, a
	ld a, [wYCoord]
	ld e, a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next

	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next

	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next

	push bc
	call CopyObjectStruct
	pop bc
	jp c, .ret

.next
	ld hl, MAPOBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndex]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret

.ret
	ret

CheckObjectEnteringVisibleRange::
	ld a, [wPlayerStepDirection]
	cp STANDING
	ret z
	ld hl, .dw
	rst JumpTable
	ret

.dw
	dw .Down
	dw .Up
	dw .Left
	dw .Right

.Up:
	ld a, [wYCoord]
	sub 1
	jr .Vertical

.Down:
	ld a, [wYCoord]
	add 9
.Vertical:
	ld d, a
	ld a, [wXCoord]
	ld e, a
	ld bc, wFollowerObject
	ld a, 1
.loop_v
	ldh [hMapObjectIndex], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_v
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .next_v
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp UNASSOCIATED_MAPOBJECT
	jr nz, .next_v
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next_v
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next_v
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next_v
	ld hl, MAPOBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndex]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop_v
	ret

.Left:
	ld a, [wXCoord]
	sub 1
	jr .Horizontal

.Right:
	ld a, [wXCoord]
	add 10
.Horizontal:
	ld e, a
	ld a, [wYCoord]
	ld d, a
	ld bc, wFollowerObject
	ld a, 1
.loop_h
	ldh [hMapObjectIndex], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_h
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, e
	cp [hl]
	jr nz, .next_h
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp UNASSOCIATED_MAPOBJECT
	jr nz, .next_h
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next_h
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next_h
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next_h
	ld hl, MAPOBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndex]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop_h
	ret

CopyTempObjectToObjectStruct:
	ld a, [wTempObjectCopyMapObjectIndex]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopyMovement]
	call CopySpriteMovementData

	ld a, [wTempObjectCopyPalette]
	ld hl, OBJECT_PAL_INDEX
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopyY]
	call .InitYCoord

	ld a, [wTempObjectCopyX]
	call .InitXCoord

	ld a, [wTempObjectCopySprite]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopySpriteVTile]
	ld hl, OBJECT_SPRITE_TILE
	add hl, de
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_RESET

	ld hl, OBJECT_FACING
	add hl, de
	ld [hl], STANDING

	ld a, [wTempObjectCopyRadius]
	call .InitRadius

	ld a, [wTempObjectCopyRange]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a

	farcall CheckForUsedObjPals
	and a
	ret

.InitYCoord:
	ld hl, OBJECT_INIT_Y
	add hl, de
	ld [hl], a

	ld hl, OBJECT_MAP_Y
	add hl, de
	ld [hl], a

	ld hl, wYCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetY
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ret

.InitXCoord:
	ld hl, OBJECT_INIT_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_MAP_X
	add hl, de
	ld [hl], a
	ld hl, wXCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetX
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ret

.InitRadius:
	ld h, a
	inc a
	and $f
	ld l, a
	ld a, h
	add $10
	and $f0
	or l
	ld hl, OBJECT_RADIUS
	add hl, de
	ld [hl], a
	ret

TrainerWalkToPlayer:
	ldh a, [hLastTalked]
	call InitMovementBuffer
	ld a, movement_step_sleep
	call AppendToMovementBuffer
	ld a, [wSeenTrainerDistance]
	dec a
	jr z, .TerminateStep
	ldh a, [hLastTalked]
	ld b, a
	ld c, PLAYER
	ld d, 1
	call .GetPathToPlayer
	call DecrementMovementBufferCount

.TerminateStep:
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret

.GetPathToPlayer:
	push de
	push bc
; get player object struct, load to de
	ld a, c
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct
	ld d, b
	ld e, c

; get last talked object struct, load to bc
	pop bc
	ld a, b
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct

; get last talked coords, load to bc
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

; get player coords, load to de
	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, de
	ld e, [hl]
	ld d, a

	pop af
	call ComputePathToWalkToPlayer
	ret

SurfStartStep:
	newfarcall DeleteFollower
	ld a, [wPlayerDirection]
	srl a
	srl a
	maskbits NUM_DIRECTIONS
	ld e, a
	ld d, 0
	ld hl, .movement_data
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(.movement_data)
	jp StartAutoInput

.movement_data
	db D_DOWN,  0, -1
	db D_UP,    0, -1
	db D_LEFT,  0, -1
	db D_RIGHT, 0, -1

FollowNotExact::
	push bc
	ld a, c
	call CheckObjectVisibility
	ld d, b
	ld e, c
	pop bc
	ret c

	ld a, b
	call CheckObjectVisibility
	ret c

; object 2 is now in bc, object 1 is now in de
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hl]
	cp b
	jr z, .same_x
	jr c, .to_the_left
	inc b
	jr .continue

.to_the_left
	dec b
	jr .continue

.same_x
	ld hl, OBJECT_MAP_Y
	add hl, de
	ld a, [hl]
	cp c
	jr z, .continue
	jr c, .below
	inc c
	jr .continue

.below
	dec c

.continue
	ld hl, OBJECT_MAP_X
	add hl, de
	ld [hl], b
	ld a, b
	ld hl, wXCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetX
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_MAP_Y
	add hl, de
	ld [hl], c
	ld a, c
	ld hl, wYCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetY
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ldh a, [hObjectStructIndex]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, de
	ld [hl], SPRITEMOVEDATA_FOLLOWNOTEXACT
	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_RESET
	ret

GetRelativeFacing::
; Determines which way map object e would have to turn to face map object d.  Returns carry if it's impossible for whatever reason.
	ld a, d
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld d, a
	ld a, e
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld e, a
	call .GetFacing_e_relativeto_d
	ret

.carry
	scf
	ret

.GetFacing_e_relativeto_d:
; Determines which way object e would have to turn to face object d.  Returns carry if it's impossible.
; load the coordinates of object d into bc
	ld a, d
	call GetObjectStruct
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a
	push bc
; load the coordinates of object e into de
	ld a, e
	call GetObjectStruct
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop bc
; |x1 - x2|
	ld a, b
	sub d
	jr z, .same_x_1
	jr nc, .b_right_of_d_1
	cpl
	inc a

.b_right_of_d_1
; |y1 - y2|
	ld h, a
	ld a, c
	sub e
	jr z, .same_y_1
	jr nc, .c_below_e_1
	cpl
	inc a

.c_below_e_1
; |y1 - y2| - |x1 - x2|
	sub h
	jr c, .same_y_1

.same_x_1
; compare the y coordinates
	ld a, c
	cp e
	jr z, .same_x_and_y
	jr c, .c_directly_below_e
; c directly above e
	ld d, DOWN
	and a
	ret

.c_directly_below_e
	ld d, UP
	and a
	ret

.same_y_1
	ld a, b
	cp d
	jr z, .same_x_and_y
	jr c, .b_directly_right_of_d
; b directly left of d
	ld d, RIGHT
	and a
	ret

.b_directly_right_of_d
	ld d, LEFT
	and a
	ret

.same_x_and_y
	scf
	ret

QueueFollowerFirstStep:
	call .QueueFirstStep
	jr c, .same
	ld [wFollowMovementQueue], a
	xor a
	ld [wFollowerMovementQueueLength], a
	ret

.same
	ld a, -1
	ld [wFollowerMovementQueueLength], a
	ret

.QueueFirstStep:
	ld a, [wObjectFollow_Leader]
	call GetObjectStruct
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [wObjectFollow_Follower]
	call GetObjectStruct
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, d
	cp [hl]
	jr z, .check_y
	jr c, .left
	and a
	ld a, movement_step + RIGHT
	ret

.left
	and a
	ld a, movement_step + LEFT
	ret

.check_y
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, e
	cp [hl]
	jr z, .same_xy
	jr c, .up
	and a
	ld a, movement_step + DOWN
	ret

.up
	and a
	ld a, movement_step + UP
	ret

.same_xy
	scf
	ret
