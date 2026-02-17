	object_const_def

SafariZoneKantoArea4_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneKantoArea4GoldLeaf:
	itemball GOLD_LEAF

SafariZoneKantoArea4MaxEther:
	itemball MAX_ETHER

SafariZoneKantoArea4MaxPotion:
	itemball MAX_POTION

SafariZoneKantoArea4MaxRevive:
	itemball MAX_REVIVE

SafariZoneKantoArea4HiddenRevive:
	hiddenitem REVIVE, EVENT_SAFARI_ZONE_KANTO_AREA_4_HIDDEN_REVIVE

SafariZoneKantoArea4RestHouseSign:
	jumptext SafariZoneKantoArea4RestHouseSignText

SafariZoneKantoArea4TrainerTipsSign:
	jumptext SafariZoneKantoArea4TrainerTipsText

SafariZoneKantoArea4RequestNoticeSign:
	jumptext SafariZoneKantoArea4RequestNoticeText

SafariZoneKantoArea4Sign:
	jumptext SafariZoneKantoArea4SignText

SafariZoneKantoArea4RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneKantoArea4TrainerTipsText:
	text "TRAINER TIPS"

	para "Zone Exploration"
	line "Campaign!"

	para "The Search for"
	line "the SECRET HOUSE!"
	done

SafariZoneKantoArea4RequestNoticeText:
	text "REQUEST NOTICE"

	para "…"

	para "The text has been"
	line "scribbled over!"
	done

SafariZoneKantoArea4SignText:
	text "AREA 3"
	line "EAST: CENTER AREA"
	done

SafariZoneKantoArea4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 22, SAFARI_ZONE_KANTO_AREA_1, 7
	warp_event 29, 23, SAFARI_ZONE_KANTO_AREA_1, 8
	warp_event 26,  0, SAFARI_ZONE_KANTO_AREA_3, 3
	warp_event 27,  0, SAFARI_ZONE_KANTO_AREA_3, 4
	warp_event 20,  0, SAFARI_ZONE_KANTO_AREA_3, 5
	warp_event 21,  0, SAFARI_ZONE_KANTO_AREA_3, 6
	warp_event 11, 11, SAFARI_KANTO_REST_HOUSE_AREA_4, 1
	warp_event  3,  3, SAFARI_KANTO_SECRET_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 26,  4, BGEVENT_READ, SafariZoneKantoArea4TrainerTipsSign
	bg_event 17,  3, BGEVENT_READ, SafariZoneKantoArea4RequestNoticeSign
	bg_event 12, 12, BGEVENT_READ, SafariZoneKantoArea4RestHouseSign
	bg_event 24, 22, BGEVENT_READ, SafariZoneKantoArea4Sign
	bg_event  6,  5, BGEVENT_ITEM, SafariZoneKantoArea4HiddenRevive

	def_object_events
	object_event 19,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea4GoldLeaf, EVENT_SAFARI_ZONE_KANTO_AREA_4_GOLD_LEAF
	object_event  9,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea4MaxEther, EVENT_SAFARI_ZONE_KANTO_AREA_4_MAX_ETHER
	object_event  8, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea4MaxPotion, EVENT_SAFARI_ZONE_KANTO_AREA_4_MAX_POTION
	object_event 18, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneKantoArea4MaxRevive, EVENT_SAFARI_ZONE_KANTO_AREA_4_MAX_REVIVE
