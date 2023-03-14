	const_def 2 ; object constants
	const PEWTER_MUSEUM_1F_SCIENTIST_1
	const PEWTER_MUSEUM_1F_SCIENTIST_2
	const PEWTER_MUSEUM_1F_SCIENTIST_3
	const PEWTER_MUSEUM_1F_GRAMPS
	const PEWTER_MUSEUM_1F_SUPER_NERD
	const PEWTER_MUSEUM_1F_OLD_AMBER

PewterMuseum1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterMuseum1F_Reception_Scientist_Script:
	faceplayer
	opentext
	checkcode VAR_FACING
	ifequal DOWN, .DontSneakIn
	ifequal LEFT, .DontSneakIn
	writetext PewterMuseum1F_Scientist_ReceptionText
	waitbutton
	closetext
	turnobject PEWTER_MUSEUM_1F_SCIENTIST_1, LEFT
	end

.DontSneakIn:
	writetext PewterMuseum1F_Scientist_ReceptionBackWayText
	waitbutton
	closetext
	turnobject PEWTER_MUSEUM_1F_SCIENTIST_1, LEFT
	end

PewterMuseum1F_Fossil_Scientist_Script:
	faceplayer
	opentext
	writetext PewterMuseum1F_Scientist_PrideAndJoyText
	waitbutton
	closetext
	end

PewterMuseum1F_Old_Amber_Scientist_Script:
	faceplayer
	opentext
	checkevent EVENT_PEWTER_MUSEUM_OBTAINED_OLD_AMBER
	iftrue .GotAmber
	writetext PewterMuseum1F_Scientist_TakeTheAmberCheckedText
	waitbutton
	disappear PEWTER_MUSEUM_1F_OLD_AMBER
	setevent EVENT_PEWTER_MUSEUM_OBTAINED_OLD_AMBER
	verbosegiveitem OLD_AMBER
	closetext
	end

.GotAmber
	writetext PewterMuseum1F_Scientist_GetTheAmberCheckedText
	waitbutton
	closetext
	end

PewterMuseum1F_Amber_Script:
	opentext
	writetext PewterMuseum1F_AmberText
	waitbutton
	closetext
	end

PewterMuseum1F_Scientist_ReceptionBackWayText:
	text "Hey!"

	para "You can't sneak in"
	line "through the back!"

	para "Well, not that it"
	line "matters…"

	para "You can't view the"
	line "exhibits from here"
	cont "anyway."
	done

PewterMuseum1F_Scientist_PrideAndJoyText:
	text "We managed to find"
	line "two fossils of"

	para "very rare, extinct"
	line "#MON!"

	para "They are the pride"
	line "and joy of the"
	cont "MUSEUM!"
	done

PewterMuseum1F_Scientist_TakeTheAmberCheckedText:
	text "Ssh! I have a"
	line "secret to share."

	para "I found this chunk"
	line "of AMBER, and I"

	para "believe it may"
	line "contain #MON"
	cont "DNA!"

	para "My colleagues say"
	line "it's all nonsense!"

	para "So, I would like"
	line "to ask a favor."

	para "Could you get this"
	line "AMBER examined?"

	para "I hear there is a"
	line "good team of re-"
	cont "searchers at the"
	cont "RUINS OF ALPH who"
	cont "can help!"
	done

PewterMuseum1F_Scientist_GetTheAmberCheckedText:
	text "Ssh!"
	line "Get the OLD AMBER"
	cont "checked!"
	done

PewterMuseum1F_AmberText:
	text "A beautiful piece"
	line "of AMBER…"

	para "It's clear and"
	line "gold!"
	done

PewterMuseum1F_Scientist_ReceptionText:
	text "TEST"
	done

PewterMuseum1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 6
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, PEWTER_MUSEUM_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 12,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1F_Reception_Scientist_Script, -1
	object_event 15,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1F_Old_Amber_Scientist_Script, -1
	object_event 17,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1F_Fossil_Scientist_Script, -1
	object_event  2,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16,  2, SPRITE_OLD_AMBER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, PewterMuseum1F_Amber_Script, EVENT_PEWTER_MUSEUM_OBTAINED_OLD_AMBER

