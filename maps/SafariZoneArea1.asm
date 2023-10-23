	object_const_def

SafariZoneArea1_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneArea1Lemonade:
	itemball LEMONADE

SafariZoneArea1MiracleSeed:
	itemball MIRACLE_SEED
	
SafariZoneArea1HiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_SAFARI_ZONE_AREA_1_HIDDEN_SILVER_LEAF

SafariZoneArea1RestHouseSign:
	jumptext SafariZoneArea1RestHouseSignText

SafariZoneArea1Sign:
	jumptext SafariZoneArea1SignText

SafariZoneArea1TrainerTipsSign:
	jumptext SafariZoneArea1TrainerTipsText

SafariZoneArea1RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea1SignText:
	text "AREA1 - PLAINS"
	line "WEST: AREA 2"
	done

SafariZoneArea1TrainerTipsText:
	text "TRAINER TIPS"
	
	para "Press the START"
	line "button to check"
	cont "remaining time!"
	done

SafariZoneArea1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 25, SAFARI_ZONE_ENTRANCE, 1
	warp_event 19, 25, SAFARI_ZONE_ENTRANCE, 1
	warp_event  4, 15, SAFARI_ZONE_AREA_2, 1
	warp_event  4, 14, SAFARI_ZONE_AREA_2, 2
	warp_event 14,  4, SAFARI_ZONE_AREA_3, 3
	warp_event 15,  4, SAFARI_ZONE_AREA_3, 4
	warp_event 33, 10, SAFARI_ZONE_AREA_4, 1
	warp_event 33, 11, SAFARI_ZONE_AREA_4, 2
	warp_event 27, 21, SAFARI_REST_HOUSE_AREA_1, 1

	def_coord_events

	def_bg_events
	bg_event 18, 22, BGEVENT_READ, SafariZoneArea1TrainerTipsSign
	bg_event 21,  7, BGEVENT_ITEM, SafariZoneArea1HiddenSilverLeaf
	bg_event 28, 22, BGEVENT_READ, SafariZoneArea1RestHouseSign
	bg_event  6, 12, BGEVENT_READ, SafariZoneArea1Sign

	def_object_events
	object_event 27,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea1MiracleSeed, EVENT_SAFARI_ZONE_AREA_1_MIRACLE_SEED
	object_event 17, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea1Lemonade, EVENT_SAFARI_ZONE_AREA_1_LEMONADE
