	object_const_def

Route48_MapScripts:
	def_scene_scripts

	def_callbacks

Route48Nugget:
	itemball NUGGET

Route48Sign:
	jumptext Route48SignText

Route48SignText:
	text "ROUTE 48"
	line "SAFARI ZONE AHEAD"
	done

Route48_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 27,  9, BGEVENT_READ, Route48Sign

	def_object_events
	object_event  4, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route48Nugget, EVENT_ROUTE_48_NUGGET
	object_event 17, -5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, 0, -1
	object_event 18, -2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, 0, -1
	object_event 19, -2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, 0, -1
	object_event  9, -3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, 0, -1
	object_event  6, -5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, 0, -1
