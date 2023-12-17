	object_const_def
	const SAFARIZONERESTHOUSEAREA4_HIKER
	const SAFARIZONERESTHOUSEAREA4_COOLTRAINER_M

SafariRestHouseArea4_MapScripts:
	def_scene_scripts

	def_callbacks

SafariRestHouseArea4HikerScript:
	faceplayer
	opentext
	writetext SafariRestHouseArea4HikerScript_Text
	waitbutton
	closetext
	end

SafariRestHouseArea4CooltrainerMScript:
	faceplayer
	opentext
	writetext SafariRestHouseArea4CooltrainerMScript_Text
	waitbutton
	closetext
	end

SafariRestHouseArea4HikerScript_Text:
	text "Thank goodness for"
	line "this REST HOUSE…"

	para "The peaks here are"
	line "quite a hiking"
	cont "challenge."
	done

SafariRestHouseArea4CooltrainerMScript_Text:
	text "I just caught a"
	line "CHANSEY!"
	
	para "It was difficult"
	line "finding one, but"
	cont "it was worth it."
	done

SafariRestHouseArea4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_AREA_4, 5
	warp_event  3,  7, SAFARI_ZONE_AREA_4, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariRestHouseArea4HikerScript, 0
	object_event  3,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariRestHouseArea4CooltrainerMScript, 0