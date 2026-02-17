	object_const_def

SafariZoneKantoArea3_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneKantoArea3LuckyPunch:
	itemball LUCKY_PUNCH

SafariZoneKantoArea3Protein:
	itemball PROTEIN

SafariZoneKantoArea3KingsRock:
	itemball KINGS_ROCK

SafariZoneKantoArea3RestHouseSign:
	jumptext SafariZoneKantoArea3RestHouseSignText

SafariZoneKantoArea3TrainerTipsSign:
	jumptext SafariZoneKantoArea3TrainerTipsText

SafariZoneKantoArea3TrainerTips2Sign:
	jumptext SafariZoneKantoArea3TrainerTips2Text

SafariZoneKantoArea3TrainerTips3Sign:
	jumptext SafariZoneKantoArea3TrainerTips3Text

SafariZoneKantoArea3Sign:
	jumptext SafariZoneKantoArea3SignText

SafariZoneKantoArea3RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneKantoArea3TrainerTipsText:
	text "TRAINER TIPS"

	para "Win a free HM for"
	line "finding the"
	cont "SECRET HOUSE!"
	done

SafariZoneKantoArea3TrainerTips2Text:
	text "TRAINER TIPS"

	para "#MON hide in"
	line "tall grass!"

	para "Zigzag through"
	line "grassy areas to"
	cont "flush them out."
	done

SafariZoneKantoArea3TrainerTips3Text:
	text "TRAINER TIPS"

	para "The SECRET HOUSE"
	line "is still ahead!"
	done

SafariZoneKantoArea3SignText:
	text "AREA 2"
	done

SafariZoneKantoArea3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 39, 30, SAFARI_ZONE_KANTO_AREA_2, 3
	warp_event 39, 31, SAFARI_ZONE_KANTO_AREA_2, 4
	warp_event  8, 35, SAFARI_ZONE_KANTO_AREA_4, 3
	warp_event  9, 35, SAFARI_ZONE_KANTO_AREA_4, 4
	warp_event  2, 35, SAFARI_ZONE_KANTO_AREA_4, 5
	warp_event  3, 35, SAFARI_ZONE_KANTO_AREA_4, 6
	warp_event 20, 35, SAFARI_ZONE_KANTO_AREA_1, 5
	warp_event 21, 35, SAFARI_ZONE_KANTO_AREA_1, 6
	warp_event 35,  3, SAFARI_KANTO_REST_HOUSE_AREA_3, 1

	def_coord_events

	def_bg_events
	bg_event 26, 28, BGEVENT_READ, SafariZoneKantoArea3TrainerTipsSign
	bg_event 18, 32, BGEVENT_READ, SafariZoneKantoArea3TrainerTips2Sign
	bg_event  4, 25, BGEVENT_READ, SafariZoneKantoArea3TrainerTips3Sign
	bg_event 36,  4, BGEVENT_READ, SafariZoneKantoArea3RestHouseSign
	bg_event 13, 31, BGEVENT_READ, SafariZoneKantoArea3Sign

	def_object_events
	object_event 20, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea3LuckyPunch, EVENT_SAFARI_ZONE_KANTO_AREA_3_LUCKY_PUNCH
	object_event 25,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea3Protein, EVENT_SAFARI_ZONE_KANTO_AREA_3_PROTEIN
	object_event 19,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea3KingsRock, EVENT_SAFARI_ZONE_KANTO_AREA_3_KINGS_ROCK
