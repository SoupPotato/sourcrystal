GiveSafariBalls:
	ld a, 30
	ld [wSafariBallsRemaining], a
	ld a, HIGH(5)
	ld [wSafariTimeRemaining], a
	ld a, LOW(5)
	ld [wSafariTimeRemaining + 1], a
	ret 

SafariZoneBattleScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_SAFARI
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wSafariBallsRemaining
	iffalse SafariZoneOutOfBallsScript
	end

SafariZoneGameOverScript::
	playmusic MUSIC_NONE
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariZoneText_BeeepTimesUp
	waitbutton
	writetext SafariZoneText_GameIsOver
	waitbutton
	jump SafariZoneReturnToGateScript

SafariZoneOutOfBallsScript:
	playmusic MUSIC_NONE
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariZoneText_GameIsOver
	waitbutton

SafariZoneReturnToGateScript::
	closetext
	clearflag ENGINE_SAFARI_ZONE
	jumpstd safarizoneoverwarp

SafariZoneText_BeeepTimesUp::
	; PA: Ding-dong!
	text_jump Text_SafariTimeUp
	db "@"

SafariZoneText_GameIsOver::
	; PA: Your SAFARI Game is over!
	text_jump Text_SafariGameOver
	db "@"
