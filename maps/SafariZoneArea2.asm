	object_const_def

SafariZoneArea2_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneArea2UltraBall:
	itemball ULTRA_BALL

SafariZoneArea2Carbos:
	itemball CARBOS

SafariZoneArea2HiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_SAFARI_ZONE_AREA_2_HIDDEN_GOLD_LEAF

SafariZoneArea2RestHouseSign:
	jumptext SafariZoneArea2RestHouseSignText

SafariZoneArea2Sign:
	jumptext SafariZoneArea2SignText

SafariZoneArea2TrainerTipsSign:
	jumptext SafariZoneArea2TrainerTipsText

SafariZoneArea2RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea2SignText:
	text "AREA 2 - DESERT"
	line "NORTH: AREA 3"
	done

SafariZoneArea2TrainerTipsText:
	text "TRAINER TIPS"
	
	para "The remaining time"
	line "declines only"
	cont "while you walk!"
	done

SafariZoneArea2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 37, 27, SAFARI_ZONE_AREA_1, 3
	warp_event 37, 26, SAFARI_ZONE_AREA_1, 4
	warp_event 28,  8, SAFARI_ZONE_AREA_3, 1
	warp_event 29,  8, SAFARI_ZONE_AREA_3, 2
	warp_event 33, 11, SAFARI_REST_HOUSE_AREA_2, 1

	def_coord_events

	def_bg_events
	bg_event 34, 26, BGEVENT_READ, SafariZoneArea2TrainerTipsSign
	bg_event 18, 21, BGEVENT_ITEM, SafariZoneArea2HiddenGoldLeaf
	bg_event 34, 12, BGEVENT_READ, SafariZoneArea2RestHouseSign
	bg_event 26, 10, BGEVENT_READ, SafariZoneArea2Sign

	def_object_events
	object_event 31, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea2UltraBall, EVENT_SAFARI_ZONE_AREA_2_ULTRA_BALL
	object_event  7, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea2Carbos, EVENT_SAFARI_ZONE_AREA_2_CARBOS
