	object_const_def
	const ROUTE6_POKEFAN
	const ROUTE6_TWIN_1
	const ROUTE6_TWIN_2
	const ROUTE6_LASS
	const ROUTE6_YOUNGSTER

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TwinsDayandDani1:
	trainer TWINS, DAYANDDANI1, EVENT_BEAT_TWINS_DAYANDDANI, TwinsDayandDaniSeenText, TwinsDayandDaniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsDayandDani1AfterBattleText
	waitbutton
	closetext
	end

TwinsDayandDani2:
	trainer TWINS, DAYANDDANI2, EVENT_BEAT_TWINS_DAYANDDANI, TwinsDayandDaniSeenText, TwinsDayandDaniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsDayandDani2AfterBattleText
	waitbutton
	closetext
	end

CamperViktor:
	trainer CAMPER, VIKTOR, EVENT_BEAT_CAMPER_VIKTOR, CamperViktorSeenText, CamperViktorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperViktorAfterBattleText
	waitbutton
	closetext
	end

PicnickerSelina:
	trainer PICNICKER, SELINA, EVENT_BEAT_PICNICKER_SELINA, PicnickerSelinaSeenText, PicnickerSelinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSelinaAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

TwinsDayandDaniSeenText:
	text "DAY: Are you"
	line "going to beat us?"

	para "DANI: We'll knock"
	line "you flat!"
	done

TwinsDayandDaniBeatenText:
	text "DAY: Waah!"

	para "DANI: Eeeeh!"
	done

TwinsDayandDani1AfterBattleText:
	text "DAY: You beat"
	line "us…"
	done

TwinsDayandDani2AfterBattleText:
	text "DANI: Looks like"
	line "we got bounced."
	done

PicnickerSelinaSeenText:
	text "I'm headed out on"
	line "a picnic."

	para "Do you know why?"
	done

PicnickerSelinaBeatenText:
	text "You are pretty"
	line "good!"
	done

PicnickerSelinaAfterBattleText:
	text "The reason I'm"
	line "going on a picnic…"

	para "It's because I"
	line "really want to"
	cont "smell the fresh"
	cont "air…"

	para "Do you know what"
	line "I mean?"
	done

CamperViktorSeenText:
	text "Walking with your"
	line "gear and #MON"
	
	para "gives you that"
	line "great outdoor"
	cont "feeling!"
	done

CamperViktorBeatenText:
	text "Yaha! I lost!"
	done

CamperViktorAfterBattleText:
	text "Are you also on"
	line "a solo journey?"

	para "See you again"
	line "sometime."

	para "Bye for now!"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19,  7, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 12,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 21,  9, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 14, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TwinsDayandDani1, -1
	object_event 15, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TwinsDayandDani2, -1
	object_event  9, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, PicnickerSelina, -1
	object_event  5, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, CamperViktor, -1
