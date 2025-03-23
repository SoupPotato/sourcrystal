BattleCommand_Teleport:
	ld a, [wBattleType]
	cp BATTLETYPE_FORCESHINY
	jr z, .failed
	cp BATTLETYPE_TRAP
	jr z, .failed
	cp BATTLETYPE_CELEBI
	jr z, .failed
	cp BATTLETYPE_SUICUNE
	jr z, .failed

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .failed

; Switch, don't run, in trainer battles
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer_battle
; fallthrough
.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wBattleAnimParam], a
	call SetBattleDraw
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld c, 20
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.trainer_battle
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_trainer

	; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, .failed

	call UpdateBattleMonInParty
	call BattleCommand_LowerSub
	call LoadMoveAnim

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
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call Teleport_LinkPlayerSwitch
	ld hl, TeleportBattleMonEntrance
.end_return
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0
	ret

.enemy_trainer
	call CheckAnyOtherAliveEnemyMons
	jp z, .failed

	call UpdateEnemyMonInParty
	call BattleCommand_LowerSub
	call LoadMoveAnim
	call Teleport_LinkEnemySwitch

	farcall NewEnemyMonStatus

	; teleport enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, 1
	ld [wTypeMatchup], a
	ld hl, ResetEnemyStatLevels
	jr .end_return

Teleport_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, 1
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore
	call CloseWindow

	xor a
	ld [wBattlePlayerAction], a
	ret

Teleport_LinkEnemySwitch:
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
	jr c, .teleport
	cp b
	jr c, .switch

.teleport
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow
