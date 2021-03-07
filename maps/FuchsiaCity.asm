	const_def 2 ; object constants
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_BERRY
	const FUCHSIACITY_APRICORN

FuchsiaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Fruittrees

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return
	
.Fruittrees
.Berry:
	checkflag ENGINE_DAILY_FUCHSIA_BERRY
	iftrue .NoBerry
	appear FUCHSIACITY_BERRY
.NoBerry:
	;return
	
.Apricorn:
	checkflag ENGINE_DAILY_FUCHSIA_APRICORN
	iftrue .NoApricorn
	appear FUCHSIACITY_APRICORN
.NoApricorn:
	return

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
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaBerryTree:
	opentext
	writetext FuchsiaBerryTreeText
	buttonsound
	writetext FuchsiaHeyItsBerryText
	buttonsound
	verbosegiveitem ASPEAR_BERRY
	iffalse .NoRoomInBag
	disappear FUCHSIACITY_BERRY
	setflag ENGINE_DAILY_FUCHSIA_BERRY
.NoRoomInBag
	closetext
	end
	
FuchsiaApricornTree:
	opentext
	writetext FuchsiaApricornTreeText
	buttonsound	
	writetext FuchsiaHeyItsApricornText
	buttonsound
	verbosegiveitem RED_APRICORN
	iffalse .NoRoomInBag
	disappear FUCHSIACITY_APRICORN
	setflag ENGINE_DAILY_FUCHSIA_APRICORN
.NoRoomInBag
	closetext
	end

FuchsiaNoBerry:
	opentext
	writetext FuchsiaBerryTreeText
	buttonsound
	writetext FuchsiaNothingHereText
	waitbutton
	closetext
	end

FuchsiaNoApricorn:
	opentext
	writetext FuchsiaApricornTreeText
	buttonsound
	writetext FuchsiaNothingHereText
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
	
FuchsiaBerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

FuchsiaHeyItsBerryText:
	text "Hey! It's"
	line "ASPEAR BERRY!"
	done

FuchsiaApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

FuchsiaHeyItsApricornText:
	text "Hey! It's"
	line "RED APRICORN!"
	done	

FuchsiaNothingHereText:
	text "There's nothing"
	line "here…"
	done
	
FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_BROTHERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 37, 16, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 17, ROUTE_15_FUCHSIA_GATE, 2
	warp_event 17, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event 18, 35, ROUTE_19_FUCHSIA_GATE, 2

	db 0 ; coord events

	db 10 ; bg events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneClosedSign
	bg_event 13, 15, BGEVENT_READ, NoLitteringSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 17, 17, BGEVENT_READ, FuchsiaNoBerry
	bg_event 15, 17, BGEVENT_READ, FuchsiaNoApricorn

	db 5 ; object events
	object_event 23, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event 17, 17, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, FuchsiaBerryTree, EVENT_FUCHSIA_BERRY
	object_event 15, 17, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaApricornTree, EVENT_FUCHSIA_APRICORN
