	object_const_def
	const MOUNTMOONB2F_FOSSIL
	const MOUNTMOONB2F_MUSHROOM
	const MOUNTMOONB2F_POKE_BALL

MountMoonB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MountMoonB2FCheckMushroom

MountMoonB2FCheckMushroom:
	checkflag ENGINE_DAILY_MOUNT_MOON_B2F_MUSHROOM
	iftrue .finishMushroom
	clearevent EVENT_MOUNT_MOON_B2F_MUSHROOM
	random 10
	ifnotequal 0, .TinyMushroom
; 10% chance
.BigMushroom
	setevent EVENT_MOUNT_MOON_B2F_BIG_MUSHROOM_SPAWN
	variablesprite SPRITE_MUSHROOM_1, SPRITE_BIG_MUSHROOM
	sjump .finishMushroom
.TinyMushroom
	variablesprite SPRITE_MUSHROOM_1, SPRITE_TINYMUSHROOM
.finishMushroom
	endcallback

MountMoonB2FMushroom: ;Daily
; This whole script is written out rather than as an itemball
	scall MountMoonB2FParasBattle
	checkevent EVENT_MOUNT_MOON_B2F_BIG_MUSHROOM_SPAWN
	iffalse .skipBigMushroom
	giveitem BIG_MUSHROOM
	getitemname STRING_BUFFER_3, BIG_MUSHROOM
	iffalse MountMoonB2FNoRoomInBagForBigMushroom
	sjump .Mushroom_Finish
.skipBigMushroom
	giveitem TINYMUSHROOM
	getitemname STRING_BUFFER_3, TINYMUSHROOM
	iffalse MountMoonB2FNoRoomInBagForTinyMushroom
.Mushroom_Finish
	disappear MOUNTMOONB2F_MUSHROOM
	setflag ENGINE_DAILY_MOUNT_MOON_B2F_MUSHROOM
	clearevent EVENT_MOUNT_MOON_B2F_BIG_MUSHROOM_SPAWN
	opentext
	writetext MountMoonB2FFoundMushroomText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

MountMoonB2FParasBattle:
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

MountMoonB2FMushroomPicked:
	disappear MOUNTMOONB2F_MUSHROOM
	sjump MountMoonB2FCheckMushroom.finishMushroom

MountMoonB2FNoRoomInBagForTinyMushroom:
	opentext
	getitemname STRING_BUFFER_3, TINYMUSHROOM
	writetext MountMoonB2FFoundMushroomText
	promptbutton
	writetext MountMoonB2FNoRoomForMushroomText
	waitbutton
	closetext
	end

MountMoonB2FNoRoomInBagForBigMushroom:
	opentext
	getitemname STRING_BUFFER_3, BIG_MUSHROOM
	writetext MountMoonB2FFoundMushroomText
	promptbutton
	writetext MountMoonB2FNoRoomForMushroomText
	waitbutton
	closetext
	end

MountMoonB2FFossil:
	opentext
	checkevent EVENT_MT_MORTAR_OBTAINED_HELIX_FOSSIL
	iftrue .GiveDomeFossil
	writetext MountMoonB2FHelixFossilText
	yesorno
	iffalse .nope
	disappear MOUNTMOONB2F_FOSSIL
	setevent EVENT_MT_MOON_OBTAINED_FOSSIL
	verbosegiveitem HELIX_FOSSIL
	closetext
	end

.GiveDomeFossil
	writetext MountMoonB2FDomeFossilText
	yesorno
	iffalse .nope
	disappear MOUNTMOONB2F_FOSSIL
	setevent EVENT_MT_MOON_OBTAINED_FOSSIL
	verbosegiveitem DOME_FOSSIL
.nope
	closetext
	end

MountMoonB2FHiddenMoonStone:
	hiddenitem MOON_STONE, EVENT_MOUNT_MOON_B2F_HIDDEN_MOON_STONE

MountMoonB2FRevive:
	itemball REVIVE

MountMoonB2FHelixFossilText:
	text "…"

	para "It's the HELIX"
	line "FOSSIL that was"
	cont "lost at MT.MORTAR!"

	para "The underground"
	line "current must have"
	cont "carried it here…"

	para "Will you take the"
	line "HELIX FOSSIL?"
	done

MountMoonB2FDomeFossilText:
	text "…"

	para "It's the DOME"
	line "FOSSIL that was"
	cont "lost at MT.MORTAR!"

	para "The underground"
	line "current must have"
	cont "carried it here…"

	para "Will you take the"
	line "DOME FOSSIL?"
	done

MountMoonB2FFoundMushroomText:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

MountMoonB2FNoRoomForMushroomText:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

MountMoonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 17, MOUNT_MOON_B1F, 2
	warp_event  5,  7, MOUNT_MOON_B1F, 3
	warp_event 21, 13, MOUNT_MOON_B1F, 10

	def_coord_events

	def_bg_events
	bg_event 18, 12, BGEVENT_ITEM, MountMoonB2FHiddenMoonStone

	def_object_events
	object_event 10, 11, SPRITE_FOSSIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB2FFossil, EVENT_MT_MOON_OBTAINED_FOSSIL
	object_event 16,  2, SPRITE_MUSHROOM_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB2FMushroom, EVENT_MOUNT_MOON_B2F_MUSHROOM
	object_event  7, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonB2FRevive, EVENT_MOUNT_MOON_B2F_REVIVE
