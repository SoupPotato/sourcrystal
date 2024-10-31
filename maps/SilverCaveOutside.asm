	object_const_def
	const SILVER_CAVE_OUTSIDE_BERRY

SilverCaveOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilverCaveOutsideFlypointCallback
	callback MAPCALLBACK_OBJECTS, SilverCaveOutsideFruittree

SilverCaveOutsideFlypointCallback:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	endcallback

SilverCaveOutsideFruittree:
.Berry:
	checkflag ENGINE_DAILY_SILVER_CAVE_OUTSIDE_BERRY
	iftrue .NoBerry
	appear SILVER_CAVE_OUTSIDE_BERRY
.NoBerry:
	endcallback

MtSilverPokecenterSign:
	jumpstd PokecenterSignScript

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE

SilverCaveOutsideBerryTree:
	opentext
	getitemname STRING_BUFFER_3, LUM_BERRY
	writetext SilverCaveOutsideBerryTreeText
	promptbutton
	writetext SilverCaveOutsideHeyItsBerryText
	promptbutton
	giveitem LUM_BERRY
	iffalse SilverCaveOutsideNoRoomInBag
	disappear SILVER_CAVE_OUTSIDE_BERRY
	setflag ENGINE_DAILY_SILVER_CAVE_OUTSIDE_BERRY
	writetext SilverCaveOutsideFoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

SilverCaveOutsideNoBerry:
	opentext
	writetext SilverCaveOutsideBerryTreeText
	promptbutton
	writetext SilverCaveOutsideNothingHereText
	waitbutton
	closetext
	end

SilverCaveOutsideNoRoomInBag:
	writetext SilverCaveOutsideNoRoomInBagText
	waitbutton
	closetext
	end

MtSilverSignText:
	text "MT.SILVER"
	done

SilverCaveOutsideBerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

SilverCaveOutsideNothingHereText:
	text "There's nothing"
	line "here…"
	done

SilverCaveOutsideHeyItsBerryText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

SilverCaveOutsideFoundItemText:
	text_far _FoundItemText
	text_end

SilverCaveOutsideNoRoomInBagText:
	text_far _CantCarryItemText
	text_end

SilverCaveOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 19, SILVER_CAVE_POKECENTER_1F, 1
	warp_event 18, 11, SILVER_CAVE_ROOM_1, 1

	def_coord_events

	def_bg_events
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event 27, 20, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore
	bg_event  9, 25, BGEVENT_READ, SilverCaveOutsideNoBerry

	def_object_events
	object_event  9, 25, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilverCaveOutsideBerryTree, EVENT_SILVER_CAVE_OUTSIDE_BERRY
