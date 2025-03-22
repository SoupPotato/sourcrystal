BattleCommand_BatonPass:
	; Store Substitute state
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	push af
	push hl

	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, .FailedBatonPass

	call UpdateBattleMonInParty
	call BattleCommand_LowerSub
	call LoadMoveAnim

	pop hl
	res SUBSTATUS_SUBSTITUTE, [hl]
	push hl

	ld c, 32
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call BatonPass_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, .BatonPass_EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore

	call ResetBatonPassStatus
	jr .RestoreSubstituteDoll

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, .FailedBatonPass

	call CheckAnyOtherAliveEnemyMons
	jp z, .FailedBatonPass

	call UpdateEnemyMonInParty
	call BattleCommand_LowerSub
	call LoadMoveAnim
	call BatonPass_LinkEnemySwitch

	pop hl
	res SUBSTATUS_SUBSTITUTE, [hl]
	push hl

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, .BatonPass_EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	call ResetBatonPassStatus
	; fallthrough
.RestoreSubstituteDoll:
	pop hl
	pop af
	ret z
	set SUBSTATUS_SUBSTITUTE, [hl]

	; Make the Substitute doll reappear.
	call _CheckBattleScene
	jr nc, .skip_fast_anims
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSubNoAnim
	; Why not return early? Compare with transform.asm
.skip_fast_anims
	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	ld a, $2
	ld [wBattleAnimParam], a
	ld a, SUBSTITUTE
	jp LoadAnim

.FailedBatonPass:
	pop hl
	pop af
	call AnimateFailedMove
	jp PrintButItFailed

.BatonPass_EndMoveEffect:
	pop hl
	pop af
	jp EndMoveEffect

BatonPass_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

BatonPass_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .baton_pass
	cp b
	jr c, .switch

.baton_pass
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow

ResetBatonPassStatus:
; Reset status changes that aren't passed by Baton Pass.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	jr nz, .ok

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
.ok

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wEnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wPlayerSubStatus5

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	res SUBSTATUS_ENCORED, [hl]

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	xor a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ret

CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, wOTPartyMon1HP
	ld a, [wOTPartyCount]
	ld d, a
	ld a, [wCurOTMon]
	ld e, a

	; fallthrough

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret
