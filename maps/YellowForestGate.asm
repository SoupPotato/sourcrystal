	const_def 2 ; object constants
	const YELLOWFORESTGATE_GENTLEMAN
	const YELLOWFORESTGATE_JIGGLYPUFF
;	const YELLOWFORESTGATE_FISHER1
;	const YELLOWFORESTGATE_FISHER2
	const YELLOWFORESTGATE_POKEFAN_F
	const YELLOWFORESTGATE_KANGASKHAN
	const YELLOWFORESTGATE_YOUNGSTER
	const YELLOWFORESTGATE_GRAMPS
	const YELLOWFORESTGATE_BUENA
	const YELLOWFORESTGATE_SLOWPOKE
	const YELLOWFORESTGATE_SUPER_NERD
	const YELLOWFORESTGATE_TEACHER
	const YELLOWFORESTGATE_BUTTERFREE
	const YELLOWFORESTGATE_TWIN

YellowForestGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST_GATE
	return

YellowForestGateGentlemanScript:
	jumptextfaceplayer YellowForestGateGentlemanText

YellowForestGateJigglypuffScript:
	opentext
	writetext YellowForestGateJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

YellowForestGateKangaskhanScript:
	opentext
	writetext YellowForestGateKangaskhanText
	waitbutton
	closetext
	end

YellowForestGateSlowpokeScript:
	opentext
	writetext YellowForestGateSlowpokeText1
	pause 30
	writetext YellowForestGateSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end

YellowForestGateButterfreeScript:
	opentext
	writetext YellowForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

YellowForestGatePokefanFScript:
	jumptextfaceplayer YellowForestGatePokefanFText

YellowForestGateTwinScript:
	jumptextfaceplayer YellowForestGateTwinText

YellowForestGateYoungsterScript:
	jumptextfaceplayer YellowForestGateYoungsterText

YellowForestGateBuenaScript:
	jumptextfaceplayer YellowForestGateBuenaText

YellowForestGateSuperNerdScript:
	jumptextfaceplayer YellowForestGateSuperNerdText

YellowForestGateSign:
	jumptext YellowForestGateSignText

YellowForestGateGrampsMartScript:
	faceplayer
	opentext
	writetext YellowForestGateGrampsMartText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

YellowForestGateTeacherMartScript:
	faceplayer
	opentext
	writetext YellowForestGateTeacherMartText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_YELLOW_GATE
	closetext
	end

YellowForestGateGentlemanText:
	text "YELLOW FOREST"
	line "is great!"
	
	para "I just kept going"
	line "after #MON!"
	
	para "That made my"
	line "JIGGLYPUFF upset"
	cont "though."
	done

YellowForestGateJigglypuffText:
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done

YellowForestGateTwinText:
	text "I've always want-"
	line "ed to catch my"
	cont "first #MON at"
	cont "YELLOW FOREST."
	done
	
YellowForestGatePokefanFText:
	text "……………………"
	
	para "I'm not a talker."
	done

YellowForestGateKangaskhanText:
	text "KANGASKHAN: ……………"
	line "……………………………………………"
	done

YellowForestGateYoungsterText:
	text "Yellow, yellow,"
	line "it's so much fun."
	
	para "Yellow, yellow,"
	line "so interesting,"
	cont "huh!"

	para "So many #MON"
	line "are waiting for"
	cont "us!"

	para "…That's a song"
	line "I made up."
	
	para "I sing it when I"
	line "am in the YELLOW"
	cont "FOREST."
	done

YellowForestGateBuenaText:
	text "There are many"
	line "cute #MON to"
	cont "choose from, but"
	cont "nothing beats the"
	cont "cuteness of SLOW-"
	cont "POKE."

	para "People often say"
	line "that I look like"
	cont "one!"
	done

YellowForestGateSlowpokeText1:
	text "SLOWPOKE: …"
	done
	
YellowForestGateSlowpokeText2:
	text "<……>Yawn?"
	done

YellowForestGateSuperNerdText:
	text "YELLOW FOREST…"
	para "It makes me feel"
	line "like I am in a"
	cont "foreign country."
	
	para "It brings up a"
	line "strange feeling."
	done

YellowForestGateGrampsMartText:
	text "I've decided to"
	line "carry #MON"
	cont "drinks."
	
	para "This will be new"
	line "to me, but I will"
	cont "do my best…"
	done

YellowForestGateTeacherMartText:
	text "Oh, you want to"
	line "buy something?"
	
	para "Can you wait while"
	line "I get it ready?"
	
	para "Just a minute…"
	
	para "……………"
	done

YellowForestGateButterfreeText:
	text "BUTTERFREE: Freee."
	done

YellowForestGateSignText:
	text "YELLOW FOREST"
	done
	
YellowForestGatePokecenterSign:
	jumpstd pokecentersign

YellowForestGate_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  5, YELLOW_FOREST_ACTUAL_GATE, 3
	warp_event  7, 11, YELLOW_FOREST_GATE_POKECENTER_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  6, BGEVENT_READ, YellowForestGateSign
	bg_event  8, 11, BGEVENT_READ, YellowForestGatePokecenterSign

	db 12 ; object events
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestGateGentlemanScript, -1
	object_event  5,  6, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, YellowForestGateJigglypuffScript, -1
;	object_event  16,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YellowForestGateSign, -1
;	object_event  17,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestGateSign, -1
	object_event 19,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YellowForestGatePokefanFScript, -1
	object_event 20,  9, SPRITE_KANGASKHAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, YellowForestGateKangaskhanScript, -1
	object_event 19, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YellowForestGateYoungsterScript, -1
	object_event 19, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, YellowForestGateGrampsMartScript, -1
	object_event 20, 20, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YellowForestGateBuenaScript, -1
	object_event 21, 20, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, YellowForestGateSlowpokeScript, -1
	object_event 11, 19, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestGateSuperNerdScript, -1
	object_event  8, 17, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, YellowForestGateTeacherMartScript, -1
	object_event  7, 17, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestGateButterfreeScript, -1
	object_event 11, 12, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestGateTwinScript, -1
