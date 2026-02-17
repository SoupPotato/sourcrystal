	object_const_def

SafariZoneKantoArea2_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneKantoArea2Carbos:
	itemball CARBOS

SafariZoneKantoArea2MaxPotion:
	itemball MAX_POTION

SafariZoneKantoArea2FullRestore:
	itemball FULL_RESTORE

SafariZoneKantoArea2LuckyEgg:
	itemball LUCKY_EGG

SafariZoneKantoArea2RestHouseSign:
	jumptext SafariZoneKantoArea2RestHouseSignText

SafariZoneKantoArea2TrainerTipsSign:
	jumptext SafariZoneKantoArea2TrainerTipsText

SafariZoneKantoArea2Sign:
	jumptext SafariZoneKantoArea2SignText

SafariZoneKantoArea2RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneKantoArea2TrainerTipsText:
	text "TRAINER TIPS"
	
	para "The remaining time"
	line "declines only"
	cont "while you walk!"
	done

SafariZoneKantoArea2SignText:
	text "AREA 1"
	line "NORTH: AREA 2"
	done

SafariZoneKantoArea2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 22, SAFARI_ZONE_KANTO_AREA_1, 3
	warp_event  0, 23, SAFARI_ZONE_KANTO_AREA_1, 4
	warp_event  0,  4, SAFARI_ZONE_KANTO_AREA_3, 1
	warp_event  0,  5, SAFARI_ZONE_KANTO_AREA_3, 2
	warp_event 25,  9, SAFARI_KANTO_REST_HOUSE_AREA_2, 1

	def_coord_events

	def_bg_events
	bg_event  6,  4, BGEVENT_READ, SafariZoneKantoArea2TrainerTipsSign
	bg_event 26, 10, BGEVENT_READ, SafariZoneKantoArea2RestHouseSign
	bg_event  5, 23, BGEVENT_READ, SafariZoneKantoArea2Sign

	def_object_events
	object_event 20, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea2Carbos, EVENT_SAFARI_ZONE_KANTO_AREA_2_CARBOS
	object_event  3,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea2MaxPotion, EVENT_SAFARI_ZONE_KANTO_AREA_2_MAX_POTION
	object_event 21, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea2FullRestore, EVENT_SAFARI_ZONE_KANTO_AREA_2_FULL_RESTORE
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea2LuckyEgg, EVENT_SAFARI_ZONE_KANTO_AREA_2_LUCKY_EGG
