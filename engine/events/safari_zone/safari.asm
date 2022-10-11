GiveSafariBalls:
	ld a, 30
	ld [wSafariBallsRemaining], a
	ld a, HIGH(503)
	ld [wSafariTimeRemaining], a
	ld a, LOW(503)
	ld [wSafariTimeRemaining + 1], a
	ret

SafariZoneBattleScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_SAFARI
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

SafariZoneGameOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_BeeepTimesUp
	waitbutton
	jump BugCatchingContestReturnToGateScript

SafariZoneOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_ContestIsOver
	waitbutton

SafariZoneReturnToGateScript:
	closetext
	jumpstd bugcontestresultswarp

SafariZoneText_BeeepTimesUp:
	; ANNOUNCER: BEEEP! Time's up!
	text_jump UnknownText_0x1bd2ca
	db "@"

SafariZoneText_GameIsOver:
	; ANNOUNCER: The Contest is over!
	text_jump UnknownText_0x1bd2e7
	db "@"
