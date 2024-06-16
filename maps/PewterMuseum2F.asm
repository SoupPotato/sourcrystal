	object_const_def
	const PEWTER_MUSEUM_2F_SCIENTIST
	const PEWTER_MUSEUM_2F_GRANNY
	const PEWTER_MUSEUM_2F_YOUNGSTER
	const PEWTER_MUSEUM_2F_LASS
	const PEWTER_MUSEUM_2F_PIKACHU
	const PEWTER_MUSEUM_2F_POKEFAN_M

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum2F_Scientist_Script:
	faceplayer
	opentext
	writetext PewterMuseum2F_Scientist_Text
	waitbutton
	closetext
	end

PewterMuseum2F_Granny_Script:
	faceplayer
	opentext
	writetext PewterMuseum2F_Granny_Text
	waitbutton
	closetext
	end

PewterMuseum2F_Youngster_Script:
	faceplayer
	opentext
	writetext PewterMuseum2F_Youngster_Text
	waitbutton
	closetext
	end

PewterMuseum2F_PokefanM_Script:
	faceplayer
	opentext
	writetext PewterMuseum2F_PokefanM_Text
	waitbutton
	closetext
	turnobject PEWTER_MUSEUM_2F_POKEFAN_M, UP
	end

PewterMuseum2F_Lass_Script:
	faceplayer
	opentext
	writetext PewterMuseum2F_Lass_Text
	waitbutton
	closetext
	turnobject PEWTER_MUSEUM_2F_LASS,LEFT
	end

PewterMuseum2F_Pikachu_Script:
	opentext
	writetext PewterMuseum2F_Pikachu_Text
	cry PIKACHU
	waitbutton
	closetext
	end

PewterMuseum2FMeteoriteSign:
	jumptext PewterMuseum2FMeteoriteSignText

PewterMuseum2FShuttleSign:
	jumptext PewterMuseum2FShuttleSignText

PewterMuseum2F_Scientist_Text:
	text "Welcome to the"
	line "2nd floor space"
	cont "exhibit!"
	done

PewterMuseum2F_Granny_Text:
	text "I remember when"
	line "they first sent"
	cont "man into space!"

	para "I watched it on a"
	line "colored TV so many"
	cont "years ago!"
	done

PewterMuseum2F_Youngster_Text:
	text "These MOON STONES"
	line "were found on"
	cont "MT.MOON!"

	para "I wonder what's"
	line "so special about"
	cont "them?"
	done

PewterMuseum2F_PokefanM_Text:
	text "It took a while,"
	line "but I finally"

	para "caught a PIKACHU"
	line "for my little"
	cont "girl!"

	para "She's so happy,"
	line "it makes it all"
	cont "worthwhile."
	done

PewterMuseum2F_Lass_Text:
	text "My PIKACHU is the"
	line "cutest ever!"

	para "My daddy worked so"
	line "hard to catch it."

	para "It means a lot to"
	line "me!"
	done

PewterMuseum2F_Pikachu_Text:
	text "PIKACHU: Pikaaa!"
	done

PewterMuseum2FMeteoriteSignText:
	text "A meteorite that"
	line "fell on MT.MOON."
	
	para "It is thought to"
	line "be a MOON STONE."
	done

PewterMuseum2FShuttleSignText:
	text "SPACE SHUTTLE"
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_1F, 5

	def_coord_events

	def_bg_events
	bg_event  3,  5, BGEVENT_READ, PewterMuseum2FMeteoriteSign
	bg_event 10,  3, BGEVENT_READ, PewterMuseum2FShuttleSign
	bg_event 11,  3, BGEVENT_READ, PewterMuseum2FShuttleSign

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_Scientist_Script, -1
	object_event  1,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_Granny_Script, -1
	object_event  5,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_Youngster_Script, -1
	object_event 11,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_Lass_Script, -1
	object_event 12,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_PokefanM_Script, -1
	object_event 10,  5, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, PewterMuseum2F_Pikachu_Script, -1
