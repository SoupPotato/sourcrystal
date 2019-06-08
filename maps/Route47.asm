	const_def 2 ; object constants

Route47_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route47Revive:
	itemball REVIVE

Route47MysticWater:
	itemball MYSTIC_WATER

Route47QuickClaw:
	itemball QUICK_CLAW

Route47MaxRepel:
	itemball MAX_REPEL

Route47HiddenPearl:
	hiddenitem PEARL, EVENT_ROUTE_47_HIDDEN_PEARL

Route47HiddenStardust:
	hiddenitem STARDUST, EVENT_ROUTE_47_HIDDEN_STARDUST

Route47_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 67, 21, CLIFF_EDGE_GATE, 2
	warp_event 52, 17, CLIFF_CAVE, 1
	warp_event 53, 21, CLIFF_CAVE, 2
	warp_event 53, 29, CLIFF_CAVE, 3

	db 0 ; coord events

	db 2 ; bg events
	signpost 33, 34, BGEVENT_ITEM, Route47HiddenPearl
	signpost 28, 12, BGEVENT_ITEM, Route47HiddenStardust

	db 4 ; object events
	object_event 39, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47Revive, EVENT_ROUTE_47_REVIVE
	object_event 11, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47MysticWater, EVENT_ROUTE_47_MYSTIC_WATER
	object_event 31, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47QuickClaw, EVENT_ROUTE_47_QUICK_CLAW
	object_event 7, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47MaxRepel, EVENT_ROUTE_47_MAX_REPEL
