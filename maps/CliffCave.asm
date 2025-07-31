	object_const_def
	const CLIFFCAVE_POKEFAN_M

CliffCave_MapScripts:
	def_scene_scripts

	def_callbacks

CliffCaveManScript:
	jumptextfaceplayer CliffCaveManText

CliffCaveHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_CLIFF_CAVE_HIDDEN_ULTRA_BALL

CliffCaveManText:
	text "If you see a fork"
	line "in the road inside"

	para "a cave, then most"
	line "likely one way is"

	para "correct and the"
	line "other way leads to"
	cont "a dead end."

	para "But people can't"
	line "help trying both."

	para "Do you want to go"
	line "up the ladder or"
	cont "down the ladder?"
	done

CliffCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  9, ROUTE_47, 2
	warp_event  7, 21, ROUTE_47, 3
	warp_event  7, 37, ROUTE_47, 4
	warp_event  5,  3, CLIFF_CAVE, 5
	warp_event  5, 19, CLIFF_CAVE, 4
	warp_event  9, 19, CLIFF_CAVE, 7
	warp_event  9, 31, CLIFF_CAVE, 6

	def_coord_events

	def_bg_events
	bg_event 11,  9, BGEVENT_ITEM, CliffCaveHiddenUltraBall

	def_object_events
	object_event 7, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, CliffCaveManScript, -1