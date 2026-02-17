	object_const_def

SafariZoneKantoArea1_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneKantoArea1Nugget:
	itemball NUGGET

SafariZoneKantoArea1RestHouseSign:
	jumptext SafariZoneKantoArea1RestHouseSignText

SafariZoneKantoArea1TrainerTipsSign:
	jumptext SafariZoneKantoArea1TrainerTipsText

SafariZoneKantoArea1Sign:
	jumptext SafariZoneKantoCenterAreaSignText

SafariZoneKantoArea1RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneKantoArea1TrainerTipsText:
	text "TRAINER TIPS"
	
	para "Press the START"
	line "button to check"
	cont "remaining time!"
	done

SafariZoneKantoCenterAreaSignText:
	text "CENTER AREA"
	line "EAST: AREA 1"
	done

SafariZoneKantoArea1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 25, SAFARI_ZONE_KANTO_ENTRANCE, 1
	warp_event 15, 25, SAFARI_ZONE_KANTO_ENTRANCE, 1
	warp_event 29, 10, SAFARI_ZONE_KANTO_AREA_2, 1
	warp_event 29, 11, SAFARI_ZONE_KANTO_AREA_2, 2
	warp_event 14,  0, SAFARI_ZONE_KANTO_AREA_3, 7
	warp_event 15,  0, SAFARI_ZONE_KANTO_AREA_3, 8
	warp_event  0, 10, SAFARI_ZONE_KANTO_AREA_4, 1
	warp_event  0, 11, SAFARI_ZONE_KANTO_AREA_4, 2
	warp_event 17, 19, SAFARI_KANTO_REST_HOUSE_AREA_1, 1

	def_coord_events

	def_bg_events
	bg_event 14, 22, BGEVENT_READ, SafariZoneKantoArea1TrainerTipsSign
	bg_event 18, 20, BGEVENT_READ, SafariZoneKantoArea1RestHouseSign
	bg_event 20, 16, BGEVENT_READ, SafariZoneKantoArea1Sign

	def_object_events
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea1Nugget, EVENT_SAFARI_ZONE_KANTO_AREA_1_NUGGET
