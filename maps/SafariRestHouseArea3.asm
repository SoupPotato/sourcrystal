	object_const_def
	const SAFARIZONERESTHOUSEAREA3_FISHER
	const SAFARIZONERESTHOUSEAREA3_COOLTRAINER_F

SafariRestHouseArea3_MapScripts:
	def_scene_scripts

	def_callbacks

SafariRestHouseArea3FisherScript:
	faceplayer
	opentext
	writetext SafariRestHouseArea3FisherScript_Text
	waitbutton
	closetext
	end

SafariRestHouseArea3CooltrainerFScript:
	faceplayer
	opentext
	writetext SafariRestHouseArea3CooltrainerFScript_Text
	waitbutton
	closetext
	end

SafariRestHouseArea3FisherScript_Text:
	text "I really need a"
	line "break from all"
	cont "that walking."

	para "You need to do a"
	line "lot of it if you"
	cont "want to find the"
	cont "rarer #MON."
	done

SafariRestHouseArea3CooltrainerFScript_Text:
	text "Using BAIT makes"
	line "the wild #MON"
	cont "less likely to"
	cont "flee…"
	
	para "But it also makes"
	line "it harder to"
	cont "catch."
	
	para "Likewise, throwing"
	line "a ROCK makes them"
	cont "easier to catch"
	cont "but more likely to"
	cont "flee…"
	
	para "It's a difficult"
	line "choice."
	done

SafariRestHouseArea3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_AREA_3, 7
	warp_event  3,  7, SAFARI_ZONE_AREA_3, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariRestHouseArea3FisherScript, 0
	object_event  3,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariRestHouseArea3CooltrainerFScript, 0
