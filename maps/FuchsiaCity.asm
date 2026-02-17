	object_const_def
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_BERRY
	const FUCHSIACITY_APRICORN
	const FUCHSIACITY_FISHER
	const FUCHSIACITY_SLOWPOKE
	const FUCHSIACITY_CHANSEY
	const FUCHSIACITY_VOLTORB
	const FUCHSIACITY_KANGASKHAN
	const FUCHSIACITY_KABUTO
	const FUCHSIACITY_LAPRAS

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

FuchsiaCityFisher:
	jumptextfaceplayer FuchsiaCityFisherText

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

SafariZoneKantoSign:
	jumptext SafariZoneKantoSignText

FuchsiaCityLaprasSign:
	reanchormap
	pokepic LAPRAS
	cry LAPRAS
	waitbutton
	closepokepic
	opentext
	writetext FuchsiaCityLaprasSignText
	waitbutton
	closetext
	end

FuchsiaCitySlowpokeSign:
	reanchormap
	pokepic SLOWPOKE
	cry SLOWPOKE
	waitbutton
	closepokepic
	opentext
	writetext FuchsiaCitySlowpokeSignText
	waitbutton
	closetext
	end

FuchsiaCityChanseySign:
	reanchormap
	pokepic CHANSEY
	cry CHANSEY
	waitbutton
	closepokepic
	opentext
	writetext FuchsiaCityChanseySignText
	waitbutton
	closetext
	end

FuchsiaCityVoltorbSign:
	reanchormap
	pokepic VOLTORB
	cry VOLTORB
	waitbutton
	closepokepic
	opentext
	writetext FuchsiaCityVoltorbSignText
	waitbutton
	closetext
	end

FuchsiaCityKangaskhanSign:
	reanchormap
	pokepic KANGASKHAN
	cry KANGASKHAN
	waitbutton
	closepokepic
	opentext
	writetext FuchsiaCityKangaskhanSignText
	waitbutton
	closetext
	end

FuchsiaCityKabutoSign:
	reanchormap
	pokepic KABUTO
	cry KABUTO
	waitbutton
	closepokepic
	opentext
	writetext FuchsiaCityKabutoSignText
	waitbutton
	closetext
	end

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
	text "That item ball in"
	line "there is really a"
	cont "#MON."
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
	line "FUCHSIA's main"
	cont "attraction."

	text "Many exotic"
	line "#MON can be"
	cont "found there!"
	done

FuchsiaCityFisherText:
	text "ERIK: Where's"
	line "SARA? I said I'd"
	cont "meet her here."
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
	text "#MON PARADISE"
	line "SAFARI ZONE"
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariZoneKantoSignText:
	text "SAFARI ZONE"
	line "#MON-U-CATCH!"
	done

FuchsiaCityKabutoSignText:
	text "Name: KABUTO"

	para "A #MON that"
	line "was resurrected"
	cont "from a fossil."
	done

FuchsiaCityKangaskhanSignText:
	text "Name: KANGASKHAN"

	para "A maternal #MON"
	line "that raises it's"
	cont "young in a pouch"
	cont "on it's belly."
	done

FuchsiaCityChanseySignText:
	text "Name: CHANSEY"

	para "Catching one is"
	line "all up to chance."
	done

FuchsiaCitySlowpokeSignText:
	text "Name: SLOWPOKE"

	para "Friendly and very"
	line "slow moving."
	done

FuchsiaCityVoltorbSignText:
	text "Name: VOLTORB"

	para "The very image of"
	line "a #BALL."
	done

FuchsiaCityLaprasSignText:
	text "Name: LAPRAS"

	para "A.K.A. the king"
	line "of the seas."
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
	warp_event 18,  3, SAFARI_ZONE_KANTO_ENTRANCE, 2
	warp_event 17, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event 18, 35, ROUTE_19_FUCHSIA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneKantoSign
	bg_event 13, 15, BGEVENT_READ, FuchsiaCityLaprasSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 17, 17, BGEVENT_READ, FuchsiaCityNoBerry
	bg_event 15, 17, BGEVENT_READ, FuchsiaCityNoApricorn
	bg_event  7,  7, BGEVENT_READ, FuchsiaCityKabutoSign
	bg_event 13,  7, BGEVENT_READ, FuchsiaCityKangaskhanSign
	bg_event 27,  7, BGEVENT_READ, FuchsiaCityVoltorbSign
	bg_event 33,  7, BGEVENT_READ, FuchsiaCityChanseySign
	bg_event 31, 13, BGEVENT_READ, FuchsiaCitySlowpokeSign

	def_object_events
	object_event 24,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 23, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event 17, 17, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBerryTree, EVENT_FUCHSIA_BERRY
	object_event 15, 17, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityApricornTree, EVENT_FUCHSIA_APRICORN
	object_event 30, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisher, -1
	object_event 30, 12, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event 31,  5, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event 25,  6, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event 12,  6, SPRITE_KANGASKHAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event  6,  5, SPRITE_KABUTO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event  8, 17, SPRITE_LAPRAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
