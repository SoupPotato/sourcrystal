	const_def 2 ; object constants
	const YELLOWFOREST_POKE_BALL1
	const YELLOWFOREST_POKE_BALL2
	const YELLOWFOREST_POKE_BALL3
	const YELLOWFOREST_POKE_BALL4
	const YELLOWFOREST_POKE_BALL5

YellowForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

YellowForestThunderStone:
	itemball THUNDERSTONE

YellowForestMiracleSeed:
	itemball MIRACLE_SEED

YellowForestUltraBall:
	itemball ULTRA_BALL

YellowForestLemonade:
	itemball LEMONADE

YellowForestSurfPikachuDoll:
	disappear YELLOWFOREST_POKE_BALL5
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	opentext
	writetext YellowForestSurfPikachuDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext YellowForestSurfPikachuDollSentText
	waitbutton
	closetext
	end

YellowForestHiddenBigMushroom1:
	hiddenitem BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM_1

YellowForestHiddenBigMushroom2:
	hiddenitem BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM_2

YellowForestHiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF

YellowForestHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_YELLOW_FOREST_HIDDEN_SILVER_LEAF

YellowForestSurfPikachuDollText:
	text "<PLAYER> found"
	line "SURF PIKACHU DOLL."
	done

YellowForestSurfPikachuDollSentText:
	text "SURF PIKACHU DOLL"
	line "was sent home."
	done

YellowForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 28, 45, YELLOW_FOREST_GATE, 1
	warp_event 29, 45, YELLOW_FOREST_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 30,  4, BGEVENT_ITEM, YellowForestHiddenBigMushroom1
	bg_event 34, 36, BGEVENT_ITEM, YellowForestHiddenBigMushroom2
	bg_event  5, 37, BGEVENT_ITEM, YellowForestHiddenGoldLeaf
	bg_event 17, 16, BGEVENT_ITEM, YellowForestHiddenSilverLeaf

	db 5 ; object events
	object_event 25, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestThunderStone, EVENT_YELLOW_FOREST_THUNDERSTONE
	object_event 32, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestMiracleSeed, EVENT_YELLOW_FOREST_MIRACLE_SEED
	object_event 11, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestUltraBall, EVENT_YELLOW_FOREST_ULTRA_BALL
	object_event 49, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestLemonade, EVENT_YELLOW_FOREST_LEMONADE
	object_event 41, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YellowForestSurfPikachuDoll, EVENT_DECO_SURFING_PIKACHU_DOLL
