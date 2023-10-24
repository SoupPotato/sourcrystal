GiveSafariBalls:
	ld a, 30
	ld [wSafariBallsRemaining], a
	ld a, HIGH(500)
	ld [wSafariTimeRemaining], a
	ld a, LOW(500)
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
	writetext SafariZoneText_TimesUp
	writetext SafariZoneText_GameIsOver
	waitbutton
	jump SafariZoneReturnToGateScript

SafariZoneOutOfBallsScript:
	playmusic MUSIC_NONE
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariZoneText_OutOfBalls
	writetext SafariZoneText_GameIsOver
	waitbutton

SafariZoneReturnToGateScript::
	closetext
	clearflag ENGINE_SAFARI_ZONE
	jumpstd SafariZoneOverWarpScript

SafariZoneText_TimesUp::
	; PA: Ding-dong!
	text_jump _SafariTimeUpText
	db "@"

SafariZoneText_GameIsOver::
	; PA: Your SAFARI Game is over!
	text_jump _SafariGameOverText
	db "@"

SafariZoneText_OutOfBalls::
	; PA: You are out of SAFARI BALLS!
	text_jump _SafariOutOfBallsText
	db "@"
