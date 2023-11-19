	object_const_def
	const SILVERCAVEITEMROOMS_MOLTRES
	const SILVERCAVEITEMROOMS_POKE_BALL1
	const SILVERCAVEITEMROOMS_POKE_BALL2

SilverCaveItemRooms_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Moltres

.Moltres:
	checkevent EVENT_FOUGHT_MOLTRES
	iftrue .NoAppear
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Appear
	jump .NoAppear

.Appear:
	appear SILVERCAVEITEMROOMS_MOLTRES
	endcallback

.NoAppear:
	disappear SILVERCAVEITEMROOMS_MOLTRES
	endcallback

SilverCaveItemRoomsHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_SILVERCAVEITEMROOMS_HIDDEN_HYPER_POTION

SilverCaveItemRoomsHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_SILVERCAVEITEMROOMS_HIDDEN_ULTRA_BALL

SilverCaveItemRoomsMaxRevive:
	itemball MAX_REVIVE

SilverCaveItemRoomsFullRestore:
	itemball FULL_RESTORE

SilverCaveItemRoomsMoltres:
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MOLTRES, 50
	startbattle
	disappear SILVERCAVEITEMROOMS_MOLTRES
	setevent EVENT_FOUGHT_MOLTRES
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_MOLTRES
.nocatch
	end

MoltresText:
	text "Gyaoo!"
	done

SilverCaveItemRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, SILVER_CAVE_ROOM_2, 3
	warp_event  7, 15, SILVER_CAVE_ROOM_2, 4
	warp_event  9, 31, SILVER_CAVE_ROOM_2, 5

	def_coord_events

	def_bg_events
	bg_event  4, 22, BGEVENT_ITEM, SilverCaveItemRoomsHiddenHyperPotion
	bg_event 15, 22, BGEVENT_ITEM, SilverCaveItemRoomsHiddenUltraBall

	def_object_events
	object_event  9, 24, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0,  SilverCaveItemRoomsMoltres, EVENT_MOLTRES_APPEAR
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsMaxRevive, EVENT_SILVER_CAVE_ITEM_ROOMS_MAX_REVIVE
	object_event 15, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsFullRestore, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
