FieldMoveJumptableReset:
	xor a
	ld hl, wFieldMoveData
	ld bc, wFieldMoveDataEnd - wFieldMoveData
	call ByteFill
	ret

FieldMoveJumptable:
	ld a, [wFieldMoveJumptableIndex]
	rst JumpTable
	ld [wFieldMoveJumptableIndex], a
	bit JUMPTABLE_EXIT_F, a
	jr nz, .okay
	and a
	ret

.okay
	and JUMPTABLE_INDEX_MASK
	scf
	ret

GetPartyNickname:
; write wCurPartyMon nickname to wStringBuffer1-3
	ld hl, wPartyMonNicknames
	ld a, BOXMON
	ld [wMonType], a
	ld a, [wCurPartyMon]
	call GetNickname
	call CopyName1
; copy text from wStringBuffer2 to wStringBuffer3
	ld de, wStringBuffer2
	ld hl, wStringBuffer3
	call CopyName2
	ret

CheckEngineFlag:
; Check engine flag de
; Return carry if flag is not set
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	jr nz, .isset
	scf
	ret
.isset
	xor a
	ret

CheckBadge:
; Check engine flag a (ENGINE_ZEPHYRBADGE thru ENGINE_EARTHBADGE)
; Display "Badge required" text and return carry if the badge is not owned
	call CheckEngineFlag
	ret nc
	ld hl, .BadgeRequiredText
	call MenuTextboxBackup ; push text to queue
	scf
	ret

.BadgeRequiredText:
	text_far _BadgeRequiredText
	text_end

CheckPartyMove:
; Check if a monster in your party has move d.

	ld e, 0
	xor a
	ld [wCurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no
	cp -1
	jr z, .no
	cp EGG
	jr z, .next

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, NUM_MOVES
.check
	ld a, [hli]
	cp d
	jr z, .yes
	dec b
	jr nz, .check

.next
	inc e
	jr .loop

.yes
	ld a, e
	ld [wCurPartyMon], a ; which mon has the move
	xor a
	ret
.no
	scf
	ret

FieldMoveFailed:
	ld hl, .CantUseItemText
	call MenuTextboxBackup
	ret

.CantUseItemText:
	text_far _CantUseItemText
	text_end

PagerCutFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw CutFunction.CheckAble
	dw .DoCutPager
	dw CutFunction.FailCut

.DoCutPager:
	ld hl, Script_CutFromPager
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

CutFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .CheckAble
	dw .DoCut
	dw .FailCut

.CheckAble:
	ld de, ENGINE_HIVEBADGE
	call CheckBadge
	jr c, .nohivebadge
	call CheckMapForSomethingToCut
	jr c, .nothingtocut
	ld a, $1
	ret

.nohivebadge
	ld a, JUMPTABLE_EXIT
	ret

.nothingtocut
	ld a, $2
	ret

.DoCut:
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailCut:
	ld hl, CutNothingText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

UseCutText:
	text_far _UseCutText
	text_end

UsePagerCutText:
	text_far _UsePagerCutText
	text_end

CutNothingText:
	text_far _CutNothingText
	text_end

CheckMapForSomethingToCut:
	; Does the collision data of the facing tile permit cutting?
	call GetFacingTileCoord
	ld c, a
	push de
	farcall CheckCutCollision
	pop de
	jr nc, .fail
	; Get the location of the current block in wOverworldMapBlocks.
	call GetBlockLocation
	ld c, [hl]
	; See if that block contains something that can be cut.
	push hl
	ld hl, CutTreeBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .fail
	; Save the Cut field move data
	ld a, l
	ld [wCutWhirlpoolOverworldBlockAddr], a
	ld a, h
	ld [wCutWhirlpoolOverworldBlockAddr + 1], a
	ld a, b
	ld [wCutWhirlpoolReplacementBlock], a
	ld a, c
	ld [wCutWhirlpoolAnimationType], a
	xor a
	ret

.fail
	scf
	ret

Script_CutFromMenu:
	refreshmap
	special UpdateTimePals

Script_Cut:
	callasm GetPartyNickname
	writetext UseCutText
	refreshmap
	callasm CutDownTreeOrGrass
	closetext
	end

Script_CutFromPager:
	refreshmap
	special UpdateTimePals

Script_PagerCut:
	writetext UsePagerCutText
	cry SCYTHER
	waitbutton
	refreshmap
	callasm CutDownTreeOrGrass
	closetext
	end

CutDownTreeOrGrass:
	farcall CopyBGGreenToOBPal7
	ld hl, wCutWhirlpoolOverworldBlockAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCutWhirlpoolReplacementBlock]
	ld [hl], a
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	call UpdateSprites
	call DelayFrame
	ld a, [wCutWhirlpoolAnimationType]
	ld e, a
	farcall OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	call DelayFrame
	call LoadStandardFont
	ret

CheckOverworldTileArrays:
	; Input: c contains the tile you're facing
	; Output: Replacement tile in b and effect on wild encounters in c, plus carry set.
	;         Carry is not set if the facing tile cannot be replaced, or if the tileset
	;         does not contain a tile you can replace.

	; Dictionary lookup for pointer to tile replacement table
	push bc
	ld a, [wMapTileset]
	ld de, 3
	call IsInArray
	pop bc
	jr nc, .nope
	; Load the pointer
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Look up the tile you're facing
	ld de, 3
	ld a, c
	call IsInArray
	jr nc, .nope
	; Load the replacement to b
	inc hl
	ld b, [hl]
	; Load the animation type parameter to c
	inc hl
	ld c, [hl]
	scf
	ret

.nope
	xor a
	ret

INCLUDE "data/collision/field_move_blocks.asm"

FlashFunction:
	call .CheckUseFlash
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.CheckUseFlash:
	ld de, ENGINE_ZEPHYRBADGE
	farcall CheckBadge
	jr c, .nozephyrbadge

	push hl
	farcall SpecialAerodactylChamber
	pop hl
	jr c, .useflash
	ld a, [wTimeOfDayPalset]
	cp DARKNESS_PALSET
	jr nz, .notadarkcave
.useflash
	ld d, FLASH
	call CheckPartyMove
	jr nc, .got_party_move
	call UseFlashPager
	ld a, JUMPTABLE_EXIT | $1
	ret

.got_party_move
	call UseFlash
	ld a, JUMPTABLE_EXIT | $1
	ret

.notadarkcave
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

.nozephyrbadge
	ld a, JUMPTABLE_EXIT
	ret

UseFlash:
	ld hl, Script_UseFlash
	jp QueueScript

UseFlashPager:
	ld hl, Script_UseFlashPager
	jp QueueScript

Script_UseFlash:
	refreshmap
	special UpdateTimePals
	writetext UseFlashTextScript
	waitbutton
	closetext
	playsound SFX_FLASH
	waitsfx
	callasm BlindingFlash
	end

UseFlashTextScript:
	text_far _BlindingFlashText
	text_end

Script_UseFlashPager:
	refreshmap
	special UpdateTimePals
	writetext UseFlashPagerTextScript
	cry MAREEP
	waitbutton
	closetext
	playsound SFX_FLASH
	waitsfx
	callasm BlindingFlash
	end

UseFlashPagerTextScript:
	text_far _BlindingFlashPagerText
	text_end

PagerSurfFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw SurfFunction.TrySurf
	dw .DoSurfPager
	dw SurfFunction.FailSurf
	dw SurfFunction.AlreadySurfing

.DoSurfPager:
	call GetSurfType
	ld [wSurfingPlayerState], a
	call GetPartyNickname
	ld hl, SurfPagerFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

SurfFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TrySurf
	dw .DoSurf
	dw .FailSurf
	dw .AlreadySurfing

.TrySurf:
	ld de, ENGINE_FOGBADGE
	call CheckBadge
	jr c, .nofogbadge
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	jr nz, .cannotsurf
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .alreadyfail
	cp PLAYER_SURF_PIKA
	jr z, .alreadyfail
	call GetFacingTileCoord
	call GetTilePermission
	cp WATER_TILE
	jr nz, .cannotsurf
	call CheckDirection
	jr c, .cannotsurf
	farcall CheckFacingObject
	jr c, .cannotsurf
	ld a, $1
	ret
.nofogbadge
	ld a, JUMPTABLE_EXIT
	ret
.alreadyfail
	ld a, $3
	ret
.cannotsurf
	ld a, $2
	ret

.DoSurf:
	call GetSurfType
	ld [wSurfingPlayerState], a
	call GetPartyNickname
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailSurf:
	ld hl, CantSurfText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

.AlreadySurfing:
	ld hl, AlreadySurfingText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

SurfFromMenuScript:
	special UpdateTimePals

UsedSurfScript:
	writetext UsedSurfText ; "used SURF!"
	waitbutton
	closetext

	callasm .stubbed_fn

	readmem wSurfingPlayerState
	writevar VAR_MOVEMENT

	special UpdatePlayerSprite
	special PlayMapMusic
	special SurfStartStep
	end

.stubbed_fn
	farcall StubbedTrainerRankings_Surf
	ret

SurfPagerFromMenuScript:
	special UpdateTimePals

UsedSurfPagerScript:
	writetext UsedSurfPagerText ; "used SURF!"
	cry LAPRAS
	waitbutton
	closetext

	callasm .stubbed_fn

	readmem wSurfingPlayerState
	writevar VAR_MOVEMENT

	special UpdatePlayerSprite
	special PlayMapMusic
	special SurfStartStep
	end

.stubbed_fn
	farcall StubbedTrainerRankings_Surf
	ret

UsedSurfText:
	text_far _UsedSurfText
	text_end

UsedSurfPagerText:
	text_far _UsedSurfPagerText
	text_end

CantSurfText:
	text_far _CantSurfText
	text_end

AlreadySurfingText:
	text_far _AlreadySurfingText
	text_end

GetSurfType:
; Surfing on Pikachu uses an alternate sprite.
; This is done by using a separate movement type.

	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de

	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret

CheckDirection:
; Return carry if a tile permission prevents you
; from moving in the direction you're facing.

; Get player direction
	ld a, [wPlayerDirection]
	and %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .Directions
	add hl, de

; Can you walk in this direction?
	ld a, [wTilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

.Directions:
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT

TrySurfOW::
; Checking a tile in the overworld.
; Return carry if fail is allowed.

; Don't ask to surf if already fail.
	ld a, [wPlayerState]
	cp PLAYER_SURF_PIKA
	jr z, .quit
	cp PLAYER_SURF
	jr z, .quit

; Must be facing water.
	ld a, [wFacingTileID]
	call GetTilePermission
	cp WATER_TILE
	jr nz, .quit

; Check tile permissions.
	call CheckDirection
	jr c, .quit

	ld de, ENGINE_FOGBADGE
	call CheckEngineFlag
	jr c, .quit

	ld d, SURF
	call CheckPartyMove
	jr nc, .got_party_move
	
	ld de, ENGINE_PAGER_SURF
	call CheckEngineFlag
	jr c, .quit

	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	jr nz, .quit

	call GetSurfType
	ld [wSurfingPlayerState], a

	ld a, BANK(AskSurfPagerScript)
	ld hl, AskSurfPagerScript
	call CallScript

	scf
	ret

.got_party_move
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	jr nz, .quit

	call GetSurfType
	ld [wSurfingPlayerState], a
	call GetPartyNickname

	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call CallScript

	scf
	ret

.quit
	xor a
	ret

AskSurfScript:
	opentext
	writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	closetext
	end

AskSurfPagerScript:
	opentext
	writetext AskSurfPagerText
	yesorno
	iftrue UsedSurfPagerScript
	closetext
	end

AskSurfText:
	text_far _AskSurfText
	text_end

AskSurfPagerText:
	text_far _AskSurfPagerText
	text_end

UsedFlyPagerText:
	text_jump _UsedFlyPagerText
	db "@"

FlyFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryFly
	dw .DoFly
	dw FlyPagerFunction.FailFly

.TryFly:
	ld de, ENGINE_STORMBADGE
	call CheckBadge
	jp c, FlyPagerFunction.nostormbadge
	call GetMapEnvironment
	call CheckOutdoorMap
	jp z, .outdoors
	jp FlyPagerFunction.indoors

.outdoors
	xor a
	ldh [hMapAnims], a
	call LoadStandardMenuHeader
	call ClearSprites
	farcall _FlyMap
	ld a, e
	cp -1
	jp z, FlyPagerFunction.illegal
	cp NUM_SPAWNS
	jp nc, FlyPagerFunction.illegal

	ld [wDefaultSpawnpoint], a
	call CloseWindow
	ld a, $1
	ret

.DoFly:
	ld hl, .FlyScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FlyScript:
	refreshmap
	callasm FlyPagerFunction.StopPalFading
	callasm ClearSavedObjPals
	callasm CopyBGGreenToOBPal7
	callasm LoadWeatherPal
	special UpdateTimePals
	callasm FlyPagerFunction.SetWeatherFlyFlag
	callasm FlyFromAnim
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	callasm SkipUpdateMapSprites
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	callasm CopyBGGreenToOBPal7
	callasm FlyToAnim
	callasm FlyPagerFunction.ClearWeatherFlyFlag
	special WaitSFX
	callasm FlyPagerFunction.ReturnFromFly
	end

FlyPagerFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryFly
	dw .DoFly
	dw .FailFly

.TryFly:
	ld de, ENGINE_STORMBADGE
	call CheckBadge
	jr c, .nostormbadge
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .outdoors
	jr .indoors

.outdoors
	xor a
	ldh [hMapAnims], a
	call LoadStandardMenuHeader
	call ClearSprites
	ld a, PIDGEOT
	ld [wCurPartySpecies], a
	farcall _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp NUM_SPAWNS
	jr nc, .illegal

	ld [wDefaultSpawnpoint], a
	call CloseWindow
	ld a, $1
	ret

.nostormbadge
	ld a, JUMPTABLE_EXIT | $2
	ret

.indoors
	ld a, $2
	ret

.illegal
	call CloseWindow
	call WaitBGMap
	ld a, JUMPTABLE_EXIT
	ret

.DoFly:
	ld hl, .FlyPagerScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailFly:
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT | $2
	ret

.FlyPagerScript:
	refreshmap
	writetext UsedFlyPagerText ; "used FLY!"
	cry PIDGEOT
	waitbutton
	closetext
	callasm .StopPalFading
	callasm ClearSavedObjPals
	callasm CopyBGGreenToOBPal7
	callasm LoadWeatherPal
	special UpdateTimePals
	callasm .SetWeatherFlyFlag
	callasm FlyFromAnim
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	callasm SkipUpdateMapSprites
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	callasm CopyBGGreenToOBPal7
	callasm FlyToAnim
	callasm .ClearWeatherFlyFlag
	special WaitSFX
	callasm .ReturnFromFly
	end

.ReturnFromFly:
	farcall RespawnPlayer
	farcall ClearSavedObjPals
	farcall CheckForUsedObjPals
	call DelayFrame
	call UpdatePlayerSprite
	farcall LoadOverworldFont
	ret

.SetWeatherFlyFlag:
	ld hl, wWeatherFlags
	set OW_WEATHER_DO_FLY_F, [hl]
	ret

.ClearWeatherFlyFlag:
	ld hl, wWeatherFlags
	res OW_WEATHER_DO_FLY_F, [hl]
	ret

.StopPalFading:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPalFadeDelayFrames)
	ldh [rSVBK], a
	xor a
	ld [wPalFadeDelayFrames], a
	pop af
	ldh [rSVBK], a
	ld hl, wPalFlags
	res NO_DYN_PAL_APPLY_UNTIL_RESET_F, [hl]
	ret

WaterfallFunction:
	call .TryWaterfall
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryWaterfall:
	ld de, ENGINE_RISINGBADGE
	farcall CheckBadge
	ld a, JUMPTABLE_EXIT
	ret c
	call CheckMapCanWaterfall
	jr c, .failed
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.failed
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

CheckMapCanWaterfall:
	ld a, [wPlayerDirection]
	and $c
	cp FACE_UP
	jr nz, .failed
	ld a, [wTileUp]
	call CheckWaterfallTile
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret

Script_WaterfallFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedWaterfall:
	callasm GetPartyNickname
	writetext .UseWaterfallText
	waitbutton
	closetext
	playsound SFX_BUBBLEBEAM
.loop
	applymovement PLAYER, .WaterfallStep
	callasm .CheckContinueWaterfall
	iffalse .loop
	end

.CheckContinueWaterfall:
	xor a
	ld [wScriptVar], a
	ld a, [wPlayerTileCollision]
	call CheckWaterfallTile
	ret z
	farcall StubbedTrainerRankings_Waterfall
	ld a, $1
	ld [wScriptVar], a
	ret

.WaterfallStep:
	turn_waterfall UP
	step_end

.UseWaterfallText:
	text_far _UseWaterfallText
	text_end

Script_UsedWaterfallPager:
	writetext .UseWaterfallPagerText
	cry LAPRAS
	waitbutton
	closetext
	playsound SFX_BUBBLEBEAM
.loop
	applymovement PLAYER, Script_UsedWaterfall.WaterfallStep
	callasm Script_UsedWaterfall.CheckContinueWaterfall
	iffalse .loop
	end

.UseWaterfallPagerText:
	text_far _UseWaterfallPagerText
	text_end

TryWaterfallOW::
	ld de, ENGINE_RISINGBADGE
	call CheckEngineFlag
	jr c, .failed
	call CheckMapCanWaterfall
	jr c, .failed

	ld d, WATERFALL
	call CheckPartyMove
	jr nc, .got_party_move

	ld a, BANK(Script_AskWaterfallPager)
	ld hl, Script_AskWaterfallPager
	call CallScript
	scf
	ret

.got_party_move
	ld a, BANK(Script_AskWaterfall)
	ld hl, Script_AskWaterfall
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret

Script_CantDoWaterfall:
	jumptext .HugeWaterfallText

.HugeWaterfallText:
	text_far _HugeWaterfallText
	text_end

Script_AskWaterfall:
	opentext
	writetext .AskWaterfallText
	yesorno
	iftrue Script_UsedWaterfall
	closetext
	end

.AskWaterfallText:
	text_far _AskWaterfallText
	text_end

Script_AskWaterfallPager:
	opentext
	writetext Script_AskWaterfall.AskWaterfallText
	yesorno
	iftrue Script_UsedWaterfallPager
	closetext
	end

EscapeRopeFunction:
	call FieldMoveJumptableReset
	ld a, $1
	jr EscapeRopeOrDig

DigFunction:
	call FieldMoveJumptableReset
	ld a, $2

EscapeRopeOrDig:
	ld [wEscapeRopeOrDigType], a
.loop
	ld hl, .DigTable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.DigTable:
	dw .CheckCanDig
	dw .DoDig
	dw .FailDig

.CheckCanDig:
	call GetMapEnvironment
	cp CAVE
	jr z, .incave
	cp DUNGEON
	jr z, .incave
.fail
	ld a, $2
	ret

.incave
	ld hl, wDigWarpNumber
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	ld a, $1
	ret

.DoDig:
	ld hl, wDigWarpNumber
	ld de, wNextWarp
	ld bc, 3
	call CopyBytes
	call GetPartyNickname
	ld a, [wEscapeRopeOrDigType]
	cp $2
	jr nz, .escaperope
	ld hl, .UsedDigScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.escaperope
	farcall SpecialKabutoChamber
	ld hl, .UsedEscapeRopeScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailDig:
	ld a, [wEscapeRopeOrDigType]
	cp $2
	jr nz, .failescaperope
	ld hl, .CantUseDigText
	call MenuTextbox
	call WaitPressAorB_BlinkCursor
	call CloseWindow

.failescaperope
	ld a, JUMPTABLE_EXIT
	ret

.UseDigText:
	text_far _UseDigText
	text_end

.UseEscapeRopeText:
	text_far _UseEscapeRopeText
	text_end

.CantUseDigText:
	text_far _CantUseDigText
	text_end

.UsedEscapeRopeScript:
	refreshmap
	special UpdateTimePals
	writetext .UseEscapeRopeText
	sjump .UsedDigOrEscapeRopeScript

.UsedDigScript:
	refreshmap
	special UpdateTimePals
	writetext .UseDigText

.UsedDigOrEscapeRopeScript:
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .DigOut
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, .DigReturn
	end

.DigOut:
	step_dig 32
	hide_object
	step_end

.DigReturn:
	show_object
	return_dig 32
	step_end

TeleportFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryTeleport
	dw .DoTeleport
	dw .FailTeleport

.TryTeleport:
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .CheckIfSpawnPoint
	jr .nope

.CheckIfSpawnPoint:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	jr nc, .nope
	ld a, c
	ld [wDefaultSpawnpoint], a
	ld a, $1
	ret

.nope
	ld a, $2
	ret

.DoTeleport:
	call GetPartyNickname
	ld hl, .TeleportScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailTeleport:
	ld hl, .CantUseTeleportText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

.TeleportReturnText:
	text_far _TeleportReturnText
	text_end

.CantUseTeleportText:
	text_far _CantUseTeleportText
	text_end

.TeleportScript:
	refreshmap
	special UpdateTimePals
	callasm ClearSpritesUnderTextbox
	opentext
	writetext .TeleportReturnText
	pause 60
	refreshmap
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end

.TeleportFrom:
	teleport_from
	step_end

.TeleportTo:
	teleport_to
	step_end

PagerStrengthFunction:
	call .TryStrength
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryStrength:
	ld de, ENGINE_PLAINBADGE
	call CheckBadge
	jr c, .Failed

	ld hl, Script_StrengthPagerFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.Failed:
	ld a, JUMPTABLE_EXIT
	ret

StrengthFunction:
	call .TryStrength
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryStrength:
	ld de, ENGINE_PLAINBADGE
	call CheckBadge
	jr c, .Failed

	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.Failed:
	ld a, JUMPTABLE_EXIT
	ret

SetStrengthFlag:
	ld hl, wBikeFlags
	set BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wStrengthSpecies], a
	call GetPartyNickname
	ret

Script_StrengthFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedStrength:
	callasm SetStrengthFlag
	writetext .UseStrengthText
	readmem wStrengthSpecies
	cry 0 ; plays [wStrengthSpecies] cry
	waitbutton
	writetext .MoveBoulderText
	closetext
	end

.UseStrengthText:
	text_far _UseStrengthText
	text_end

.MoveBoulderText:
	text_far _MoveBoulderText
	text_end

Script_StrengthPagerFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedStrengthPager:
	callasm SetStrengthFlag
	writetext .UseStrengthPagerText
	cry MACHOKE
	waitbutton
	writetext .MoveBoulderPagerText
	closetext
	end

.UseStrengthPagerText:
	text_far _UseStrengthPagerText
	text_end

.MoveBoulderPagerText:
	text_far _MoveBoulderPagerText
	text_end

AskStrengthScript:
	callasm TryStrengthOW
	iffalse .AskStrengthPager
	ifequal $1, .DontMeetRequirements
	ifequal $3, .AskStrength
	sjump .AlreadyUsedStrength

.DontMeetRequirements:
	jumptext BouldersMayMoveText

.AlreadyUsedStrength:
	jumptext BouldersMoveText

.AskStrength:
	opentext
	writetext AskStrengthText
	yesorno
	iftrue Script_UsedStrength
	closetext
	end

.AskStrengthPager:
	opentext
	writetext AskStrengthPagerText
	yesorno
	iftrue Script_UsedStrengthPager
	closetext
	end

AskStrengthText:
	text_far _AskStrengthText
	text_end

AskStrengthPagerText:
	text_far _AskStrengthPagerText
	text_end

BouldersMoveText:
	text_far _BouldersMoveText
	text_end

BouldersMayMoveText:
	text_far _BouldersMayMoveText
	text_end

TryStrengthOW:
	ld de, ENGINE_PLAINBADGE
	call CheckEngineFlag
	jr c, .nope

	ld d, STRENGTH
	call CheckPartyMove
	jr nc, .got_party_move

	ld de, ENGINE_PAGER_STRENGTH
	call CheckEngineFlag
	jr c, .nope

	ld hl, wBikeFlags
	bit BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	jr z, .already_using

	ld a, 2
	jr .done

.nope
	ld a, 1
	jr .done

.got_party_move
	ld a, 3
	jr .done

.already_using
	xor a
	jr .done

.done
	ld [wScriptVar], a
	ret

PagerWhirlpoolFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw WhirlpoolFunction.TryWhirlpool
	dw .DoWhirlpoolPager
	dw WhirlpoolFunction.FailWhirlpool

.DoWhirlpoolPager:
	ld hl, Script_WhirlpoolPagerFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

WhirlpoolFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryWhirlpool
	dw .DoWhirlpool
	dw .FailWhirlpool

.TryWhirlpool:
	ld de, ENGINE_GLACIERBADGE
	call CheckBadge
	jr c, .noglacierbadge

	call TryWhirlpoolMenu
	jr c, .failed
	ld a, $1
	ret

.failed
	ld a, $2
	ret

.noglacierbadge
	ld a, JUMPTABLE_EXIT
	ret

.DoWhirlpool:
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailWhirlpool:
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

UseWhirlpoolText:
	text_far _UseWhirlpoolText
	text_end

UseWhirlpoolPagerText:
	text_far _UseWhirlpoolPagerText
	text_end

TryWhirlpoolMenu:
	call GetFacingTileCoord
	ld c, a
	push de
	call CheckWhirlpoolTile
	pop de
	jr c, .failed
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .failed
	; Save the Whirlpool field move data
	ld a, l
	ld [wCutWhirlpoolOverworldBlockAddr], a
	ld a, h
	ld [wCutWhirlpoolOverworldBlockAddr + 1], a
	ld a, b
	ld [wCutWhirlpoolReplacementBlock], a
	ld a, c
	ld [wCutWhirlpoolAnimationType], a
	xor a
	ret

.failed
	scf
	ret

Script_WhirlpoolFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedWhirlpool:
	callasm GetPartyNickname
	writetext UseWhirlpoolText
	refreshmap
	callasm DisappearWhirlpool
	closetext
	end

Script_WhirlpoolPagerFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedWhirlpoolPager:
	writetext UseWhirlpoolPagerText
	cry REMORAID
	waitbutton
	refreshmap
	callasm DisappearWhirlpool
	closetext
	end

DisappearWhirlpool:
	ld hl, wCutWhirlpoolOverworldBlockAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCutWhirlpoolReplacementBlock]
	ld [hl], a
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	ld a, [wCutWhirlpoolAnimationType]
	ld e, a
	farcall PlayWhirlpoolSound
	call BufferScreen
	call GetMovementPermissions
	ret

TryWhirlpoolOW::
	ld de, ENGINE_GLACIERBADGE
	call CheckEngineFlag
	jr c, .failed

	ld d, WHIRLPOOL
	call CheckPartyMove
	jr c, .no_party_move

	ld de, ENGINE_PAGER_WHIRLPOOL
	call CheckEngineFlag
	jr c, .failed

	call TryWhirlpoolMenu
	jr c, .failed
	ld a, BANK(Script_AskWhirlpoolOW)
	ld hl, Script_AskWhirlpoolOW
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool
	call CallScript
	scf
	ret

.no_party_move
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, BANK(Script_AskWhirlpoolPagerOW)
	ld hl, Script_AskWhirlpoolPagerOW
	call CallScript
	scf
	ret


Script_MightyWhirlpool:
	jumptext .MayPassWhirlpoolText

.MayPassWhirlpoolText:
	text_far _MayPassWhirlpoolText
	text_end

Script_AskWhirlpoolOW:
	opentext
	writetext AskWhirlpoolText
	yesorno
	iftrue Script_UsedWhirlpool
	closetext
	end

Script_AskWhirlpoolPagerOW:
	opentext
	writetext AskWhirlpoolPagerText
	yesorno
	iftrue Script_UsedWhirlpoolPager
	closetext
	end

AskWhirlpoolText:
	text_far _AskWhirlpoolText
	text_end

AskWhirlpoolPagerText:
	text_far _AskWhirlpoolPagerText
	text_end

HeadbuttFunction:
	call TryHeadbuttFromMenu
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

TryHeadbuttFromMenu:
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .no_tree

	ld hl, HeadbuttFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.no_tree
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

UseHeadbuttText:
	text_far _UseHeadbuttText
	text_end

HeadbuttNothingText:
	text_far _HeadbuttNothingText
	text_end

HeadbuttFromMenuScript:
	refreshmap
	special UpdateTimePals

HeadbuttScript:
	callasm GetPartyNickname
	writetext UseHeadbuttText

	refreshmap
	callasm ShakeHeadbuttTree

	callasm TreeMonEncounter
	iffalse .no_battle
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	checkflag ENGINE_SAFARI_ZONE
	iffalse .nosafarigame
	copybytetovar wSafariBallsRemaining
	iffalse .SafariZoneOutOfBallsScript
.nosafarigame
	end

.no_battle
	writetext HeadbuttNothingText
	waitbutton
	closetext
	end

.SafariZoneOutOfBallsScript
	farjump SafariZoneGameOverScript

TryHeadbuttOW::
	ld d, HEADBUTT
	call CheckPartyMove
	jr c, .no

	ld a, BANK(AskHeadbuttScript)
	ld hl, AskHeadbuttScript
	call CallScript
	scf
	ret

.no
	xor a
	ret

AskHeadbuttScript:
	opentext
	writetext AskHeadbuttText
	yesorno
	iftrue HeadbuttScript
	closetext
	end

AskHeadbuttText:
	text_far _AskHeadbuttText
	text_end
	

RockSmashFunction:
	call TryRockSmashFromMenu
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

PagerRockSmashFunction:
	call TryRockSmashFromPager
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

TryRockSmashFromPager:
	call GetFacingObject
	jr c, TryRockSmashFromMenu.no_rock
	ld a, d
	cp SPRITEMOVEDATA_SMASHABLE_ROCK
	jr nz, TryRockSmashFromMenu.no_rock

	ld hl, RockSmashFromPagerScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

TryRockSmashFromMenu:
	call GetFacingObject
	jr c, .no_rock
	ld a, d
	cp SPRITEMOVEDATA_SMASHABLE_ROCK
	jr nz, .no_rock

	ld hl, RockSmashFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.no_rock
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

GetFacingObject:
	farcall CheckFacingObject
	jr nc, .fail

	ldh a, [hObjectStructIndex]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret

RockSmashFromMenuScript:
	refreshmap
	special UpdateTimePals

RockSmashScript:
	callasm GetPartyNickname
	writetext UseRockSmashText
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovementlasttalked MovementData_RockSmash
	disappear LAST_TALKED

	callasm RockMonEncounter
	readmem wTempWildMonSpecies
	iffalse .no_battle
	randomwildmon
	startbattle
	reloadmapafterbattle

.no_battle
	callasm RockItemEncounter
	iffalse .no_item
	opentext
	verbosegiveitem ITEM_FROM_MEM
	closetext
.no_item
	end

RockSmashFromPagerScript:
	refreshmap
	special UpdateTimePals

RockSmashPagerScript:
	callasm GetPartyNickname
	writetext UseRockSmashPagerText
	cry CUBONE
	waitbutton
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovementlasttalked MovementData_RockSmash
	disappear LAST_TALKED

	callasm RockMonEncounter
	readmem wTempWildMonSpecies
	iffalse .no_battle
	randomwildmon
	startbattle
	reloadmapafterbattle

.no_battle
	callasm RockItemEncounter
	iffalse .no_item
	opentext
	verbosegiveitem ITEM_FROM_MEM
	closetext
.no_item
	end

MovementData_RockSmash:
	rock_smash 10
	step_end

UseRockSmashText:
	text_far _UseRockSmashText
	text_end

UseRockSmashPagerText:
	text_far _UseRockSmashPagerText
	text_end

AskRockSmashScript:
	callasm TryRockSmashOW
	ifequal $1, .no
	ifequal $2, .AskRockSmash
	ifequal $3, .AskRockSmashPager

.AskRockSmash:
	opentext
	writetext AskRockSmashText
	yesorno
	iftrue RockSmashScript
	closetext
	end
.no
	jumptext MaySmashText

.AskRockSmashPager:
	opentext
	writetext AskRockSmashPagerText
	yesorno
	iftrue RockSmashPagerScript
	closetext
	end

TryRockSmashOW:
	ld d, ROCK_SMASH
	call CheckPartyMove
	jr nc, .got_party_move

	ld de, ENGINE_PAGER_ROCK_SMASH
	call CheckEngineFlag
	jr c, .nope

	ld a, 3
	jr .done

.got_party_move
	ld a, 2
	jr .done

.nope
	ld a, 1

.done
	ld [wScriptVar], a
	ret

MaySmashText:
	text_far _MaySmashText
	text_end

AskRockSmashText:
	text_far _AskRockSmashText
	text_end

AskRockSmashPagerText:
	text_far _AskRockSmashPagerText
	text_end

HasRockSmash: ; always return true
	xor a
	ld [wScriptVar], a
	ret

FishFunction:
	ld a, e
	push af
	call FieldMoveJumptableReset
	pop af
	ld [wFishingRodUsed], a
.loop
	ld hl, .FishTable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.FishTable:
	dw .TryFish
	dw .FishNoBite
	dw .FishGotSomething
	dw .FailFish
	dw .FishNoFish

.TryFish:
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .fail
	cp PLAYER_SURF_PIKA
	jr z, .fail
	call GetFacingTileCoord
	call GetTilePermission
	cp WATER_TILE
	jr nz, .fail
	farcall CheckFacingObject
	jr nc, .facingwater
.fail
	ld a, $3
	ret

.facingwater
	call GetFishingGroup
	and a
	jr nz, .goodtofish
	ld a, $4
	ret

.goodtofish
	ld d, a
	ld a, [wFishingRodUsed]
	ld e, a
	farcall Fish
	ld a, d
	and a
	jr z, .nonibble
	ld [wTempWildMonSpecies], a
	ld a, e
	ld [wCurPartyLevel], a
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_SAFARI_GAME_F, [hl]
	jr nz, .safari_zone
	ld a, BATTLETYPE_FISH
	ld [wBattleType], a
	ld a, $2
	ret

.safari_zone
	ld a, BATTLETYPE_SAFARI_FISH
	ld [wBattleType], a
	ld a, $2
	ret

.nonibble
	ld a, $1
	ret

.FailFish:
	ld a, JUMPTABLE_EXIT
	ret

.FishGotSomething:
	ld a, $1
	ld [wFishingResult], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FishNoBite:
	ld a, $2
	ld [wFishingResult], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FishNoFish:
	ld a, $0
	ld [wFishingResult], a
	ld hl, Script_NotEvenANibble2
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

Script_NotEvenANibble:
	scall Script_FishCastRod
	writetext RodNothingText
	sjump Script_NotEvenANibble_FallThrough

Script_NotEvenANibble2:
	scall Script_FishCastRod
	writetext RodNothingText

Script_NotEvenANibble_FallThrough:
	callasm PutTheRodAway
	callasm DelayFrame
	loademote EMOTE_SHADOW
	closetext
	end

Script_GotABite:
	scall Script_FishCastRod
	callasm Fishing_CheckFacingUp
	iffalse .NotFacingUp
	applymovement PLAYER, .Movement_FacingUp
	sjump .FightTheHookedPokemon

.NotFacingUp:
	applymovement PLAYER, .Movement_NotFacingUp

.FightTheHookedPokemon:
	pause 40
	applymovement PLAYER, .Movement_RestoreRod
	writetext RodBiteText
	callasm PutTheRodAway
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	checkflag ENGINE_SAFARI_ZONE
	iffalse .nosafarigame
	copybytetovar wSafariBallsRemaining
	iffalse .SafariZoneOutOfBallsScript
.nosafarigame
	end

.SafariZoneOutOfBallsScript
	farjump SafariZoneGameOverScript

.Movement_NotFacingUp:
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	show_emote
	step_end

.Movement_FacingUp:
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	step_sleep 1
	show_emote
	step_end

.Movement_RestoreRod:
	hide_emote
	fish_cast_rod
	step_end

Fishing_CheckFacingUp:
	ld a, [wPlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .up
	xor a

.up
	ld [wScriptVar], a
	ret

Script_FishCastRod:
	refreshmap
	loadmem hBGMapMode, $0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
	loademote EMOTE_SHOCK
	applymovement PLAYER, MovementData_CastRod
	pause 40
	end

MovementData_CastRod:
	fish_cast_rod
	step_end

PutTheRodAway:
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ld [wPlayerAction], a
	call UpdateSprites
	call UpdatePlayerSprite
	ret

RodBiteText:
	text_far _RodBiteText
	text_end

RodNothingText:
	text_far _RodNothingText
	text_end

UnusedNothingHereText: ; unreferenced
	text_far _UnusedNothingHereText
	text_end

BikeFunction:
	call .TryBike
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryBike:
	call .CheckEnvironment
	jr c, .CannotUseBike
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .GetOnBike
	cp PLAYER_BIKE
	jr z, .GetOffBike
	jr .CannotUseBike

.GetOnBike:
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call .CheckIfRegistered
	call QueueScript
	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	ld de, MUSIC_BICYCLE
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ld a, $1
	ret

.GetOffBike:
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	jr nz, .CantGetOffBike
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call .CheckIfRegistered
	ld a, BANK(Script_GetOffBike)
	jr .done

.CantGetOffBike:
	ld hl, Script_CantGetOffBike
	jr .done

.CannotUseBike:
	ld a, $0
	ret

.done
	call QueueScript
	ld a, $1
	ret

.CheckIfRegistered:
	ld a, [wUsingItemWithSelect]
	and a
	ret z
	ld h, d
	ld l, e
	ret

.CheckEnvironment:
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	jr .nope

.ok
	call GetPlayerTilePermission
	and $f ; lo nybble only
	jr nz, .nope ; not FLOOR_TILE
	xor a
	ret

.nope
	scf
	ret

Script_GetOnBike:
	refreshmap
	special UpdateTimePals
	loadvar VAR_MOVEMENT, PLAYER_BIKE
	writetext GotOnBikeText
	waitbutton
	closetext
	special UpdatePlayerSprite
	end

Script_GetOnBike_Register:
	loadvar VAR_MOVEMENT, PLAYER_BIKE
	closetext
	special UpdatePlayerSprite
	end

Overworld_DummyFunction: ; unreferenced
	ret

Script_GetOffBike:
	refreshmap
	special UpdateTimePals
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	writetext GotOffBikeText
	waitbutton

FinishGettingOffBike:
	closetext
	special UpdatePlayerSprite
	special PlayMapMusic
	end

Script_GetOffBike_Register:
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	sjump FinishGettingOffBike

Script_CantGetOffBike:
	writetext .CantGetOffBikeText
	waitbutton
	closetext
	end

.CantGetOffBikeText:
	text_far _CantGetOffBikeText
	text_end

GotOnBikeText:
	text_far _GotOnBikeText
	text_end

GotOffBikeText:
	text_far _GotOffBikeText
	text_end

TryCutOW::
	ld de, ENGINE_HIVEBADGE
	call CheckEngineFlag
	jr c, .cant_cut

	ld d, CUT
	call CheckPartyMove
	jr nc, .got_party_move

	ld de, ENGINE_PAGER_CUT
	call CheckEngineFlag
	jr c, .cant_cut

	ld a, BANK(AskCutPagerScript)
	ld hl, AskCutPagerScript
	jr .go
.got_party_move
	ld a, BANK(AskCutScript)
	ld hl, AskCutScript
.go
	call CallScript
	scf
	ret

.cant_cut
	ld a, BANK(CantCutScript)
	ld hl, CantCutScript
	call CallScript
	scf
	ret

AskCutScript:
	opentext
	writetext AskCutText
	yesorno
	iffalse .declined
	callasm CheckCutMap
	iftrue Script_Cut
.declined
	closetext
	end

AskCutPagerScript:
	opentext
	writetext AskCutPagerText
	yesorno
	iffalse .declined
	callasm CheckCutMap
	iftrue Script_PagerCut
.declined
	closetext
	end

CheckCutMap:
	xor a
	ld [wScriptVar], a
	call CheckMapForSomethingToCut
	ret c
	ld a, TRUE
	ld [wScriptVar], a
	ret

AskCutText:
	text_far _AskCutText
	text_end

AskCutPagerText:
	text_far _AskCutPagerText
	text_end

CantCutScript:
	jumptext CanCutText

CanCutText:
	text_far _CanCutText
	text_end
