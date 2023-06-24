BattleCommand_Teleport:
; teleport

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
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
; Only need to check these next things if it's your turn
	ld a, [hBattleTurn]
	and a
	jr nz, .enemy_turn
; Switch, don't run, in trainer battles
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer_battle

; If your level is greater than the opponent's, you run without fail.
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .run_away
; Generate a number between 0 and (YourLevel + TheirLevel).
	add b
	ld c, a
	inc c
.loop_player
	call BattleRandom
	cp c
	jr nc, .loop_player
; If that number is greater than 4 times your level, run away.
	srl b
	srl b
	cp b
	jr nc, .run_away

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.enemy_turn
	ld a, [wBattleMode]
	dec a
	jp nz, .enemy_trainer
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .run_away
	add b
	ld c, a
	inc c
.loop_enemy
	call BattleRandom
	cp c
	jr nc, .loop_enemy
	srl b
	srl b
	cp b
	; This does the wrong thing. What was
	; probably intended was jr c, .failed
	; The way this is made makes enemy use
	; of Teleport always succeed if able
	jr nc, .run_away
.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wKickCounter], a
	call SetBattleDraw
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld c, 20
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextBox

.trainer_battle
	; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, .failed

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 32
	call DelayFrames

	; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu_NoLoop

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
	call SetPalettes
	call Teleport_LinkPlayerSwitch
	ld hl, TeleportBattleMonEntrance
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
	call AnimateCurrentMove
	call Teleport_LinkEnemySwitch

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
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0
	ret

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