Special::
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret

INCLUDE "data/events/special_pointers.asm"

UnusedDummySpecial:
	ret

SetPlayerPalette:
	ld a, [wScriptVar]
	ld [wPlayerPalIndex], a
	farcall CheckForUsedObjPals
	ret

GameCornerPrizeMonCheckDex:
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu_BackupSprites
	ld a, [wScriptVar]
	ld [wNamedObjectIndex], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret

UnusedSetSeenMon:
	ld a, [wScriptVar]
	dec a
	call SetSeenMon
	ret

FindPartyMonAboveLevel:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne:
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone:
	xor a
	ld [wScriptVar], a
	ret

NameRival:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall _NamingScreen
	ld hl, wRivalName
	ld de, .DefaultName
	call InitName
	ret

.DefaultName:
	db "SILVER@"

NameRater:
	farcall _NameRater
	ret

OverworldTownMap:
	call FadeToMenu_BackupSprites
	farcall _TownMap
	call ExitAllMenus
	ret

UnownPrinter:
	call FadeToMenu_BackupSprites
	farcall _UnownPrinter
	call ExitAllMenus
	ret

DisplayLinkRecord:
	call FadeToMenu_BackupSprites
	farcall _DisplayLinkRecord
	call ExitAllMenus
	ret

PlayersHousePC:
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret

CheckMysteryGift:
	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld a, [sMysteryGiftItem]
	and a
	jr z, .no
	inc a

.no
	ld [wScriptVar], a
	call CloseSRAM
	ret

GetMysteryGiftItem:
	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld a, [sMysteryGiftItem]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .no_room
	xor a
	ld [sMysteryGiftItem], a
	call CloseSRAM
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, .ReceiveItemText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.no_room
	call CloseSRAM
	xor a
	ld [wScriptVar], a
	ret

.ReceiveItemText:
	text_far _ReceiveItemText
	text_end

BugContestJudging:
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	ret

MapRadio:
	ld a, [wScriptVar]
	ld e, a
	farcall PlayRadio
	ret

UnownPuzzle:
	call FadeToMenu_BackupSprites
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	call ExitAllMenus
	ret

SlotMachine:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call StartGameCornerGame
	ret

CardFlip:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call StartGameCornerGame
	ret

UnusedMemoryGame:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_MemoryGame)
	ld hl, _MemoryGame
	call StartGameCornerGame
	ret

StartGameCornerGame:
	call FarQueueScript
	call FadeToMenu_BackupSprites
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call ExitAllMenus
	ret

CheckCoinsAndCoinCase:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret

.NoCoinsText:
	text_far _NoCoinsText
	text_end

.NoCoinCaseText:
	text_far _NoCoinCaseText
	text_end

ClearBGPalettesBufferScreen:
	call ClearBGPalettes
	call BufferScreen
	ret

ScriptReturnCarry:
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret

UnusedCheckUnusedTwoDayTimer:
	farcall CheckUnusedTwoDayTimer
	ld a, [wUnusedTwoDayTimer]
	ld [wScriptVar], a
	ret

ActivateFishingSwarm:
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	jr SetSwarmFlag

StoreSwarmMapIndices::
	ld a, d
	ld [wSwarmMapGroup], a
	ld a, e
	ld [wSwarmMapNumber], a

SetSwarmFlag:
	ld hl, wDailyFlags1
	set DAILYFLAGS1_SWARM_F, [hl]
	ld hl, wSwarmFlags
	res SWARMFLAGS_ALT_SWARM_F, [hl]
	ret

StoreSwarmMapIndicesAlternate::
	ld a, d
	ld [wSwarmMapGroup], a
	ld a, e
	ld [wSwarmMapNumber], a

SetAltSwarmFlag:
	ld hl, wDailyFlags1
	res DAILYFLAGS1_SWARM_F, [hl]
	ld hl, wSwarmFlags
	set SWARMFLAGS_ALT_SWARM_F, [hl]
	ret

CheckSwarmFlag::
	ld hl, wDailyFlags1
	bit DAILYFLAGS1_SWARM_F, [hl]
	jr z, .clear_swarm
	xor a
	ld [wScriptVar], a
	ret

.clear_swarm
	ld a, 1
	ld [wScriptVar], a
	xor a
	ld [wFishingSwarmFlag], a
	ld [wSwarmMapGroup], a
	ld [wSwarmMapNumber], a
	ret

CheckPokerus:
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jp ScriptReturnCarry

ResetLuckyNumberShowFlag:
	farcall LoadOrRegenerateLuckyIDNumber
	ret

CheckLuckyNumberShowFlag:
	ld hl, wLuckyNumberShowFlag
	bit LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	ret

SnorlaxAwake:
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; wScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, TRUE
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [wScriptVar], a
	ret

.ProximityCoords:
	;   x,  y
	db  7,  6 ; left
	db  7,  7 ; left
	db 10,  6 ; right
	db 10,  7 ; right
;respawn
	db 50, 11 ; left
	db 50, 12 ; left
	db 53, 11 ; right
	db 53, 12 ; right
	db 51, 13 ; down
	db 52, 13 ; down
	db -1

PlayCurMonCry:
	ld a, [wCurPartySpecies]
	jp PlayMonCry

GameboyCheck:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	jr nz, .sgb
; gb
	xor a ; GBCHECK_GB
	jr .done

.sgb
	ld a, GBCHECK_SGB
	jr .done

.cgb
	ld a, GBCHECK_CGB
.done
	ld [wScriptVar], a
	ret

FadeOutMusic:
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret

Diploma:
	call FadeToMenu_BackupSprites
	farcall _Diploma
	call ExitAllMenus
	ret

PrintDiploma:
	call FadeToMenu_BackupSprites
	farcall _PrintDiploma
	call ExitAllMenus
	ret

TrainerHouse:
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call OpenSRAM
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM

RespawnOneOffs:
	; Set CHECK_FLAG once to be used multiple times
	ld b, CHECK_FLAG
	ld de, ENGINE_PLAYER_CAUGHT_SNORLAX
	farcall EngineFlagAction
	jr nz, .CaughtSnorlax
	ld de, EVENT_ROUTE_11_SNORLAX
	farcall EventFlagAction
	jr z, .CaughtSnorlax ; Snorlax Not Been Woken Yet
	eventflagreset EVENT_ROUTE_11_SNORLAX_RESPAWN
.CaughtSnorlax

	ld de, ENGINE_PLAYER_CAUGHT_SUDOWOODO
	farcall EngineFlagAction
	jr nz, .CaughtSudowoodo
	eventflagreset EVENT_ROUTE_36_SUDOWOODO
.CaughtSudowoodo

	ld de, ENGINE_PLAYER_CAUGHT_ARTICUNO
	farcall EngineFlagAction
	jr nz, .CaughtArticuno
	eventflagreset EVENT_ARTICUNO_APPEAR
.CaughtArticuno

	ld de, ENGINE_PLAYER_CAUGHT_ZAPDOS
	farcall EngineFlagAction
	jr nz, .CaughtZapdos
	eventflagreset EVENT_ZAPDOS_APPEAR
.CaughtZapdos

	ld de, ENGINE_PLAYER_CAUGHT_MOLTRES
	farcall EngineFlagAction
	jr nz, .CaughtMoltres
	eventflagreset EVENT_MOLTRES_APPEAR
.CaughtMoltres

	ld de, ENGINE_PLAYER_CAUGHT_MEWTWO
	farcall EngineFlagAction
	jr nz, .CaughtMewtwo
	eventflagreset EVENT_CERULEAN_CAVE_B1F_MEWTWO ; No special event flag needed. Mewtwo is always there when you first enter the cave.
.CaughtMewtwo

	ld de, ENGINE_PLAYER_CAUGHT_MEW
	farcall EngineFlagAction
	jr nz, .CaughtMew
	eventflagreset EVENT_FOUGHT_MEW
.CaughtMew

	ld de, ENGINE_PLAYER_CAUGHT_RAIKOU
	farcall EngineFlagAction
	jr nz, .CaughtRaikou
	ld hl, wRoamMon1Species
	ld a, [hl]
	and a
	call z, RespawnRoamingRaikou
.CaughtRaikou

	ld de, ENGINE_PLAYER_CAUGHT_ENTEI
	farcall EngineFlagAction
	jr nz, .CaughtEntei
	ld hl, wRoamMon2Species
	ld a, [hl]
	and a
	call z, RespawnRoamingEntei
.CaughtEntei

	ld de, ENGINE_PLAYER_CAUGHT_SUICUNE
	farcall EngineFlagAction
	jr nz, .CaughtOrNeverFoughtSuicune
	eventflagreset EVENT_TIN_TOWER_1F_SUICUNE
.CaughtOrNeverFoughtSuicune

	ld de, ENGINE_PLAYER_CAUGHT_LUGIA
	farcall EngineFlagAction
	jr nz, .CaughtLugia
	eventflagreset EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	eventflagreset EVENT_FOUGHT_LUGIA
.CaughtLugia

	ld de, ENGINE_PLAYER_CAUGHT_HO_OH
	farcall EngineFlagAction
	ret nz
	eventflagreset EVENT_TIN_TOWER_ROOF_HO_OH
	eventflagreset EVENT_FOUGHT_HO_OH
	ret

RespawnRoamingRaikou:
	ld a, RAIKOU
	ld [wRoamMon1Species], a
	ld a, 50
	ld [wRoamMon1Level], a
	ld a, GROUP_ROUTE_42
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_42
	ld [wRoamMon1MapNumber], a
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ret

RespawnRoamingEntei:
	ld a, ENTEI
	ld [wRoamMon2Species], a
	ld a, 50
	ld [wRoamMon2Level], a
	ld a, GROUP_ROUTE_37
	ld [wRoamMon2MapGroup], a
	ld a, MAP_ROUTE_37
	ld [wRoamMon2MapNumber], a
	xor a ; generate new stats
	ld [wRoamMon2HP], a
	ret

RespawnRoamingSuicune:
	ld a, SUICUNE
	ld [wRoamMon3Species], a
	ld a, 50
	ld [wRoamMon3Level], a
	ld a, GROUP_ROUTE_38
	ld [wRoamMon3MapGroup], a
	ld a, MAP_ROUTE_38
	ld [wRoamMon3MapNumber], a
	xor a ; generate new stats
	ld [wRoamMon3HP], a
	ret