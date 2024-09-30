	object_const_def
	const MOUNTMOONB1F_MUSHROOM

MountMoonB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MountMoonB1FCheckMushroom

MountMoonB1FCheckMushroom:
	checkflag ENGINE_DAILY_MOUNT_MOON_B1F_MUSHROOM
	iftrue .finishMushroom
	clearevent EVENT_MOUNT_MOON_B1F_MUSHROOM
	random 10
	ifnotequal 0, .TinyMushroom
; 10% chance
.BigMushroom
	setevent EVENT_MOUNT_MOON_B1F_BIG_MUSHROOM_SPAWN
	variablesprite SPRITE_MUSHROOM_1, SPRITE_BIG_MUSHROOM
	sjump .finishMushroom
.TinyMushroom
	variablesprite SPRITE_MUSHROOM_1, SPRITE_TINYMUSHROOM
.finishMushroom
	endcallback

MountMoonB1FMushroom: ;Daily
; This whole script is written out rather than as an itemball
	scall MountMoonB1FParasBattle
	checkevent EVENT_MOUNT_MOON_B1F_BIG_MUSHROOM_SPAWN
	iffalse .skipBigMushroom
	giveitem BIG_MUSHROOM
	getitemname STRING_BUFFER_3, BIG_MUSHROOM
	iffalse MountMoonB1FNoRoomInBagForBigMushroom
	sjump .Mushroom_Finish
.skipBigMushroom
	giveitem TINYMUSHROOM
	getitemname STRING_BUFFER_3, TINYMUSHROOM
	iffalse MountMoonB1FNoRoomInBagForTinyMushroom
.Mushroom_Finish
	disappear MOUNTMOONB1F_MUSHROOM
	setflag ENGINE_DAILY_MOUNT_MOON_B1F_MUSHROOM
	clearevent EVENT_MOUNT_MOON_B1F_BIG_MUSHROOM_SPAWN
	opentext
	writetext MountMoonB1FFoundMushroomText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

MountMoonB1FParasBattle:
	random 5
	ifnotequal 0, .skip
; 20% chance
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .challenge_mode
	loadwildmon PARAS, 12
	jump .got_wild_mon
.challenge_mode
	loadwildmon PARAS, 22
.got_wild_mon
	cry PARAS
	startbattle
	reloadmapafterbattle
.skip
	end

MountMoonB1FMushroomPicked:
	disappear MOUNTMOONB1F_MUSHROOM
	sjump MountMoonB1FCheckMushroom.finishMushroom

MountMoonB1FNoRoomInBagForTinyMushroom:
	opentext
	getitemname STRING_BUFFER_3, TINYMUSHROOM
	writetext MountMoonB1FFoundMushroomText
	promptbutton
	writetext MountMoonB1FNoRoomForMushroomText
	waitbutton
	closetext
	end

MountMoonB1FNoRoomInBagForBigMushroom:
	opentext
	getitemname STRING_BUFFER_3, BIG_MUSHROOM
	writetext MountMoonB1FFoundMushroomText
	promptbutton
	writetext MountMoonB1FNoRoomForMushroomText
	waitbutton
	closetext
	end

MountMoonB1FFoundMushroomText:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

MountMoonB1FNoRoomForMushroomText:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

MountMoonB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, MOUNT_MOON_1F, 2
	warp_event 17,  9, MOUNT_MOON_B2F, 1
	warp_event 15,  3, MOUNT_MOON_B2F, 2
	warp_event  7, 21, MOUNT_MOON_SQUARE, 1
	warp_event 19, 21, MOUNT_MOON_SQUARE, 2
	warp_event 19,  3, ROUTE_4, 2
	warp_event  7, 19, MOUNT_MOON_1F, 3
	warp_event 19, 19, MOUNT_MOON_B1F, 9
	warp_event 27,  9, MOUNT_MOON_B1F, 8
	warp_event 27,  3, MOUNT_MOON_B2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  8, SPRITE_MUSHROOM_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB1FMushroom, EVENT_MOUNT_MOON_B1F_MUSHROOM
