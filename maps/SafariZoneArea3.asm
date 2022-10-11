	const_def 2 ; object constants

SafariZoneArea3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea3Protein:
	itemball PROTEIN

SafariZoneArea3Nugget:
	itemball NUGGET

SafariZoneArea3HiddenBigMushroom1:
	hiddenitem BIG_MUSHROOM, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_BIG_MUSHROOM_1

SafariZoneArea3HiddenBigMushroom2:
	hiddenitem BIG_MUSHROOM, EVENT_SAFARI_ZONE_AREA_3_HIDDEN_BIG_MUSHROOM_2

SafariZoneArea3Sign:
	jumptext SafariZoneArea3SignText

SafariZoneArea3Sign2:
	jumptext SafariZoneArea3Sign2Text

SafariZoneArea3NoticeSign:
	jumptext SafariZoneArea3NoticeText

SafariZoneArea3RestHouseSign:
	jumptext SafariZoneArea3RestHouseSignText

SafariZoneArea3RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea3SignText:
	text "AREA 3 - MARSHLAND"
	line "EAST: AREA 4"
	done

SafariZoneArea3Sign2Text:
	text "AREA 3 - MARSHLAND"
	line "SOUTH: AREA 1"
	done

SafariZoneArea3NoticeText:
	text "NOTICE"
	
	para "We are not in any"
	line "way responsible"
	cont "for any lost or"
	cont "dropped items."
	done

SafariZoneArea3_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  8, 29, SAFARI_ZONE_AREA_2, 3
	warp_event  9, 29, SAFARI_ZONE_AREA_2, 4
	warp_event 26, 29, SAFARI_ZONE_AREA_1, 5
	warp_event 27, 29, SAFARI_ZONE_AREA_1, 6
	warp_event 35, 18, SAFARI_ZONE_AREA_4, 3
	warp_event 35, 19, SAFARI_ZONE_AREA_4, 4
	warp_event 17, 27, SAFARI_REST_HOUSE_AREA_3, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 28,  4, BGEVENT_ITEM, SafariZoneArea3HiddenBigMushroom1
	bg_event 13, 16, BGEVENT_ITEM, SafariZoneArea3HiddenBigMushroom2
	bg_event 10, 28, BGEVENT_READ, SafariZoneArea3NoticeSign
	bg_event 18, 28, BGEVENT_READ, SafariZoneArea3RestHouseSign
	bg_event 32, 16, BGEVENT_READ, SafariZoneArea3Sign
	bg_event 28, 26, BGEVENT_READ, SafariZoneArea3Sign2

	db 2 ; object events
	object_event  8,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea3Protein, EVENT_SAFARI_ZONE_AREA_3_PROTEIN
	object_event 25, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SafariZoneArea3Nugget, EVENT_SAFARI_ZONE_AREA_3_NUGGET
