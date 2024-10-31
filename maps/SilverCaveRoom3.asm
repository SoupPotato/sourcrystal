	object_const_def
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	checkevent EVENT_BEAT_RED
	iffalse .not_defeated
	loadtrainer RED, RED2
	sjump .go
.not_defeated:
	loadtrainer RED, RED1
.go:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_BEAT_RED
	clearevent EVENT_BEAT_FALKNER_REMATCH
	clearevent EVENT_BEAT_BUGSY_REMATCH
	clearevent EVENT_BEAT_WHITNEY_REMATCH
	clearevent EVENT_BEAT_MORTY_REMATCH
	clearevent EVENT_BEAT_CHUCK_REMATCH
	clearevent EVENT_BEAT_JASMINE_REMATCH
	clearevent EVENT_BEAT_PRYCE_REMATCH
	clearevent EVENT_BEAT_CLAIR_REMATCH
	clearevent EVENT_BEAT_BROCK_REMATCH
	clearevent EVENT_BEAT_MISTY_REMATCH
	clearevent EVENT_BEAT_LT_SURGE_REMATCH
	clearevent EVENT_BEAT_ERIKA_REMATCH
	clearevent EVENT_BEAT_JANINE_REMATCH
	clearevent EVENT_BEAT_SABRINA_REMATCH
	clearevent EVENT_BEAT_BLAINE_REMATCH
	clearevent EVENT_BEAT_BLUE_REMATCH
	special HealParty
	refreshscreen
	credits
	end

RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "<……>"
	line "<……>"
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_UPPER_MOUNTAINSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
