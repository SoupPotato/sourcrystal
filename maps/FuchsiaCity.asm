	object_const_def
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_BERRY
	const FUCHSIACITY_APRICORN

FuchsiaCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, FuchsiaCityFruittrees

FuchsiaCityFlypointCallback:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

FuchsiaCityFruittrees:
;Berry:
	checkflag ENGINE_DAILY_FUCHSIA_BERRY
	iftrue .NoBerry
	appear FUCHSIACITY_BERRY
.NoBerry:
	;fallthrough

;Apricorn:
	checkflag ENGINE_DAILY_FUCHSIA_APRICORN
	iftrue .NoApricorn
	appear FUCHSIACITY_APRICORN
.NoApricorn:
	endcallback

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd PokecenterSignScript

FuchsiaCityMartSign:
	jumpstd MartSignScript

FuchsiaCityBerryTree:
	opentext
	getitemname STRING_BUFFER_3, ASPEAR_BERRY
	writetext FuchsiaCityBerryTreeText
	promptbutton
	writetext FuchsiaCityHeyItsBerryApricornText
	promptbutton
	giveitem ASPEAR_BERRY
	iffalse FuchsiaCityNoRoomInBag
	disappear FUCHSIACITY_BERRY
	setflag ENGINE_DAILY_FUCHSIA_BERRY
	writetext FuchsiaCityFoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

FuchsiaCityApricornTree:
	opentext
	getitemname STRING_BUFFER_3, RED_APRICORN
	writetext FuchsiaCityApricornTreeText
	promptbutton
	writetext FuchsiaCityHeyItsBerryApricornText
	promptbutton
	giveitem RED_APRICORN
	iffalse FuchsiaCityNoRoomInBag
	disappear FUCHSIACITY_APRICORN
	setflag ENGINE_DAILY_FUCHSIA_APRICORN
	writetext FuchsiaCityFoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

FuchsiaCityNoBerry:
	opentext
	writetext FuchsiaCityBerryTreeText
	promptbutton
	writetext FuchsiaCityNothingHereText
	waitbutton
	closetext
	end

FuchsiaCityNoApricorn:
	opentext
	writetext FuchsiaCityApricornTreeText
	promptbutton
	writetext FuchsiaCityNothingHereText
	waitbutton
	closetext
	end

FuchsiaCityNoRoomInBag:
	writetext FuchsiaCityNoRoomInBagText
	waitbutton
	closetext
	end

FuchsiaCityYoungsterText:
	text "One of the ELITE"
	line "FOUR used to be"

	para "the LEADER of"
	line "FUCHSIA's GYM."
	done

FuchsiaCityPokefanMText:
	text "KOGA's daughter"
	line "succeeded him as"

	para "the GYM LEADER"
	line "after he joined"
	cont "the ELITE FOUR."
	done

FuchsiaCityTeacherText:
	text "The SAFARI ZONE is"
	line "closed… It's sad,"

	para "considering it's"
	line "FUCHSIA's main"
	cont "attraction."
	done

FuchsiaCitySignText:
	text "FUCHSIA CITY"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "FUCHSIA CITY"
	line "#MON GYM"
	cont "LEADER: JANINE"

	para "The Poisonous"
	line "Ninja Master"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariZoneClosedSignText:
	text "The WARDEN is"
	line "traveling abroad."

	para "Therefore, the"
	line "SAFARI ZONE is"
	cont "closed."
	done

NoLitteringSignText:
	text "No littering."

	para "Please take your"
	line "waste with you."
	done

FuchsiaCityBerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

FuchsiaCityApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

FuchsiaCityNothingHereText:
	text "There's nothing"
	line "here…"
	done

FuchsiaCityHeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

FuchsiaCityFoundItemText:
	text_far _FoundItemText
	text_end

FuchsiaCityNoRoomInBagText:
	text_far _CantCarryItemText
	text_end

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_OLDER_SISTERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 17, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event 18, 35, ROUTE_19_FUCHSIA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneClosedSign
	bg_event 13, 15, BGEVENT_READ, NoLitteringSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 17, 17, BGEVENT_READ, FuchsiaCityNoBerry
	bg_event 15, 17, BGEVENT_READ, FuchsiaCityNoApricorn

	def_object_events
	object_event 23, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event 17, 17, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBerryTree, EVENT_FUCHSIA_BERRY
	object_event 15, 17, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityApricornTree, EVENT_FUCHSIA_APRICORN
