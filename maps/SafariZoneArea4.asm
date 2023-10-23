	object_const_def

SafariZoneArea4_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneArea4ThunderStone:
	itemball THUNDERSTONE

SafariZoneArea4FullHeal:
	itemball FULL_HEAL

SafariZoneArea4HardStone:
	itemball HARD_STONE

SafariZoneArea4HiddenRevive:
	hiddenitem REVIVE, EVENT_SAFARI_ZONE_AREA_4_HIDDEN_REVIVE

SafariZoneArea4HiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_SAFARI_ZONE_AREA_4_HIDDEN_X_ACCURACY

SafariZoneArea4Sign:
	jumptext SafariZoneArea4SignText

SafariZoneArea4Sign2:
	jumptext SafariZoneArea4Sign2Text

SafariZoneArea4RestHouseSign:
	jumptext SafariZoneArea4RestHouseSignText

SafariZoneArea4RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea4SignText:
	text "AREA 4 - PEAKS"
	line "WEST: AREA 1"
	done

SafariZoneArea4Sign2Text:
	text "AREA 4 - PEAKS"
	line "WEST: AREA 3"
	done

SafariZoneArea4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 38, SAFARI_ZONE_AREA_1, 7
	warp_event  8, 39, SAFARI_ZONE_AREA_1, 8
	warp_event  6, 24, SAFARI_ZONE_AREA_3, 5
	warp_event  6, 25, SAFARI_ZONE_AREA_3, 6
	warp_event 19, 13, SAFARI_REST_HOUSE_AREA_4, 1

	def_coord_events

	def_bg_events
	bg_event 22,  5, BGEVENT_ITEM, SafariZoneArea4HiddenRevive
	bg_event 13, 26, BGEVENT_ITEM, SafariZoneArea4HiddenXAccuracy
	bg_event 20, 14, BGEVENT_READ, SafariZoneArea4RestHouseSign
	bg_event 10, 38, BGEVENT_READ, SafariZoneArea4Sign
	bg_event  8, 24, BGEVENT_READ, SafariZoneArea4Sign2

	def_object_events
	object_event 27, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea4FullHeal, EVENT_SAFARI_ZONE_AREA_4_FULL_HEAL
	object_event 18, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea4HardStone, EVENT_SAFARI_ZONE_AREA_4_HARD_STONE
	object_event  8, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea4ThunderStone, EVENT_SAFARI_ZONE_AREA_4_THUNDERSTONE
