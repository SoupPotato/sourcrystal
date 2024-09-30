	object_const_def
	const MOUNTMOON1F_RIVAL
	const MOUNTMOON1F_MUSHROOM

MountMoon1F_MapScripts:
	def_scene_scripts
	scene_script MountMoon1FRivalEncounterScene, SCENE_MOUNTMOON_RIVAL_BATTLE
	scene_script MountMoon1FNoopScene,           SCENE_MOUNTMOON_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MountMoon1FCheckRivalAndMushroom

MountMoon1FCheckRivalAndMushroom:
	checkflag ENGINE_DAILY_MOUNT_MOON_1F_MUSHROOM
	iftrue .finishMushroom
	clearevent EVENT_MOUNT_MOON_1F_MUSHROOM
	random 10
	ifnotequal 0, .TinyMushroom
; 10% chance
.BigMushroom
	setevent EVENT_MOUNT_MOON_1F_BIG_MUSHROOM_SPAWN
	variablesprite SPRITE_MUSHROOM_1, SPRITE_BIG_MUSHROOM
	sjump .finishMushroom
.TinyMushroom
	variablesprite SPRITE_MUSHROOM_1, SPRITE_TINYMUSHROOM
.finishMushroom
	;fallthrough
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse .notgone
	endcallback

.notgone
	appear MOUNTMOON1F_RIVAL
	end

MountMoon1FRivalEncounterScene:
	sdefer MountMoon1FRivalBattleScript
	end

MountMoon1FNoopScene:
	end

MountMoon1FMushroomPicked:
	disappear MOUNTMOON1F_MUSHROOM
	sjump MountMoon1FCheckRivalAndMushroom.finishMushroom

MountMoon1FRivalBattleScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoon1FRivalTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoon1FRivalTextWin, MountMoon1FRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoon1FRivalTextWin, MountMoon1FRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoon1FRivalTextWin, MountMoon1FRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoon1FRivalTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementAfter
	disappear MOUNTMOON1F_RIVAL
	setscene SCENE_MOUNTMOON_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoon1FMushroom: ;Daily
; This whole script is written out rather than as an itemball
	scall MountMoon1FParasBattle
	checkevent EVENT_MOUNT_MOON_1F_BIG_MUSHROOM_SPAWN
	iffalse .skipBigMushroom
	giveitem BIG_MUSHROOM
	getitemname STRING_BUFFER_3, BIG_MUSHROOM
	iffalse MountMoon1FNoRoomInBagForBigMushroom
	sjump .Mushroom_Finish
.skipBigMushroom
	giveitem TINYMUSHROOM
	getitemname STRING_BUFFER_3, TINYMUSHROOM
	iffalse MountMoon1FNoRoomInBagForTinyMushroom
.Mushroom_Finish
	disappear MOUNTMOON1F_MUSHROOM
	setflag ENGINE_DAILY_MOUNT_MOON_1F_MUSHROOM
	clearevent EVENT_MOUNT_MOON_1F_BIG_MUSHROOM_SPAWN
	opentext
	writetext MountMoon1FFoundMushroomText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

MountMoon1FParasBattle:
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

MountMoon1FNoRoomInBagForTinyMushroom:
	opentext
	getitemname STRING_BUFFER_3, TINYMUSHROOM
	writetext MountMoon1FFoundMushroomText
	promptbutton
	writetext MountMoon1FNoRoomForMushroomText
	waitbutton
	closetext
	end

MountMoon1FNoRoomInBagForBigMushroom:
	opentext
	getitemname STRING_BUFFER_3, BIG_MUSHROOM
	writetext MountMoon1FFoundMushroomText
	promptbutton
	writetext MountMoon1FNoRoomForMushroomText
	waitbutton
	closetext
	end

MountMoon1FRivalMovementBefore:
	step DOWN
	step DOWN
	step_end

MountMoon1FRivalMovementAfter:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step_end

MountMoon1FRivalTextBefore:
	text "<……> <……> <……>"

	para "It's been a while,"
	line "<PLAYER>."

	para "…Since I lost to"
	line "you, I thought"

	para "about what I was"
	line "lacking with my"
	cont "#MON…"

	para "And we came up"
	line "with an answer."

	para "<PLAYER>, now we'll"
	line "show you!"
	done

MountMoon1FRivalTextWin:
	text "<……> <……> <……>"

	para "I thought I raised"
	line "my #MON to be"

	para "the best they"
	line "could be…"

	para "…But it still "
	line "wasn't enough…"
	done

MountMoon1FRivalTextAfter:
	text "<……> <……> <……>"

	para "…You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I'm going to be"
	line "the greatest #-"
	cont "MON trainer ever."

	para "Because these guys"
	line "are behind me."

	para "…Listen, <PLAYER>."

	para "One of these days"
	line "I'm going to prove"

	para "how good I am by"
	line "beating you."
	done

MountMoon1FRivalTextLoss:
	text "<……> <……> <……>"

	para "I've repaid my"
	line "debt to you."

	para "With my #MON,"
	line "I'm going to beat"

	para "the CHAMPION and"
	line "become the world's"
	cont "greatest trainer."
	done

MountMoon1FFoundMushroomText:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

MountMoon1FNoRoomForMushroomText:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

MountMoon1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 27, ROUTE_4, 1
	warp_event  7,  5, MOUNT_MOON_B1F, 1
	warp_event 15, 11, MOUNT_MOON_B1F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13, 24, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event  6, 26, SPRITE_MUSHROOM_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoon1FMushroom, EVENT_MOUNT_MOON_1F_MUSHROOM
