	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphResearchCenterNoopScene,        SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

RuinsOfAlphResearchCenterNoopScene:
	end

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterFossilScientistScript:
	faceplayer
	opentext
	checkevent EVENT_FOSSIL_SCIENTIST_WORKING_HELIX
	iftrue .check_fossil_step_count_helix
	checkevent EVENT_FOSSIL_SCIENTIST_WORKING_DOME
	iftrue .check_fossil_step_count_dome
	checkevent EVENT_FOSSIL_SCIENTIST_WORKING_AMBER
	iftrue .check_fossil_step_count_amber
	writetext RuinsOfAlphResearchCenterFossilScientistDoYouHaveFossilText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue IsOldAmber
	writetext RuinsOfAlphResearchCenterFossilScientistNoFossilText
	waitbutton
	closetext
	end

.check_fossil_step_count_helix
	callasm FossilCheckStepCount
	iftrue .give_omanyte
	writetext RuinsOfAlphResearchCenterFossilScientistNotDoneYetText
	waitbutton
	closetext
	end

.check_fossil_step_count_dome
	callasm FossilCheckStepCount
	iftrue .give_kabuto
	writetext RuinsOfAlphResearchCenterFossilScientistNotDoneYetText
	waitbutton
	closetext
	end

.check_fossil_step_count_amber
	callasm FossilCheckStepCount
	iftrue .give_aerodactyl
	writetext RuinsOfAlphResearchCenterFossilScientistNotDoneYetText
	waitbutton
	closetext
	end


.give_omanyte
	writetext RuinsOfAlphResearchCenterFossilScientistDoneOmanyteText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .No_Room
	writetext RuinsOfAlphResearchCenterPlayerReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .omanyte_challenge_mode
	givepoke OMANYTE, 20
	jump .omanyte_finish
.omanyte_challenge_mode
	givepoke OMANYTE, 25
.omanyte_finish
	writetext RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText
	waitbutton
	closetext
	clearevent EVENT_FOSSIL_SCIENTIST_WORKING_HELIX
	end

.give_kabuto
	writetext RuinsOfAlphResearchCenterFossilScientistDoneKabutoText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .No_Room
	writetext RuinsOfAlphResearchCenterPlayerReceivedKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .kabuto_challenge_mode
	givepoke KABUTO, 20
	jump .kabuto_finish
.kabuto_challenge_mode
	givepoke KABUTO, 25
.kabuto_finish
	writetext RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText
	waitbutton
	closetext
	clearevent EVENT_FOSSIL_SCIENTIST_WORKING_DOME
	end

.give_aerodactyl
	writetext RuinsOfAlphResearchCenterFossilScientistDoneAerodactylText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .No_Room
	writetext RuinsOfAlphResearchCenterPlayerReceivedAerodactylText
	playsound SFX_CAUGHT_MON
	waitsfx
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .aerodactyl_challenge_mode
	givepoke AERODACTYL, 20
	jump .aerodactyl_finish
.aerodactyl_challenge_mode
	givepoke AERODACTYL, 25
.aerodactyl_finish
	writetext RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText
	waitbutton
	closetext
	clearevent EVENT_FOSSIL_SCIENTIST_WORKING_AMBER
	end

.No_Room
	writetext RuinsOfAlphResearchCenterFossilScientistNoRoomForFossilPokemonText
	waitbutton
	closetext
	end


.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_amber
	writetext RuinsOfAlphResearchCenterFossilScientistIsHelixFossilText
	yesorno
	iftrue GaveHelixFossil
	jump .no_fossil

.own_dome
	checkitem OLD_AMBER
	iftrue .ask_dome_amber
	writetext RuinsOfAlphResearchCenterFossilScientistIsDomeFossilText
	yesorno
	iftrue GaveDomeFossil
	jump .no_fossil

.own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsDomeFossil
	jump .no_fossil

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsOldAmber
	jump .no_fossil

.ask_dome_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsDomeFossil
	ifequal $2, IsOldAmber
	jump .no_fossil

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsDomeFossil
	ifequal $3, IsOldAmber
.no_fossil:
	writetext RuinsOfAlphResearchCenterFossilScientistNoFossilText
	waitbutton
	closetext
	end

HelixDomeMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"
	db "CANCEL@"

HelixAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "HELIX FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

DomeAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

HelixDomeAmberMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

IsHelixFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistIsHelixFossilText
	yesorno
	iffalse DeniedRessurection
	jump GaveHelixFossil

IsDomeFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistIsDomeFossilText
	yesorno
	iffalse DeniedRessurection
	jump GaveDomeFossil

IsOldAmber:
	writetext RuinsOfAlphResearchCenterFossilScientistIsOldAmberText
	yesorno
	iffalse DeniedRessurection
	jump GaveOldAmber

DeniedRessurection:
	writetext RuinsOfAlphResearchCenterFossilScientistNoFossilText
	waitbutton
	closetext
	end

GaveHelixFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistGaveFossilText
	waitbutton
	closetext
	takeitem HELIX_FOSSIL
	setevent EVENT_FOSSIL_SCIENTIST_WORKING_HELIX
	callasm FossilSetStepCount
	end

GaveDomeFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistGaveFossilText
	waitbutton
	closetext
	takeitem DOME_FOSSIL
	setevent EVENT_FOSSIL_SCIENTIST_WORKING_DOME
	callasm FossilSetStepCount
	end

GaveOldAmber:
	writetext RuinsOfAlphResearchCenterFossilScientistGaveFossilText
	waitbutton
	closetext
	takeitem OLD_AMBER
	setevent EVENT_FOSSIL_SCIENTIST_WORKING_AMBER
	callasm FossilSetStepCount
	end


RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

FossilSetStepCount:
	ld a, 50
	ld [wFossilStepCount], a
	ret

FossilCheckStepCount:
	ld a, [wFossilStepCount]
	cp 0
	jr z, .yes
	ld a, FALSE
	ld [wScriptVar], a
	ret
.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret

RuinsOfAlphResearchCenterModifiedDexText:
	text "Done!"

	para "I modified your"
	line "#DEX."

	para "I added an"
	line "optional #DEX"

	para "to store UNOWN"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "You caught all the"
	line "UNOWN variations?"

	para "That's a great"
	line "achievement!"

	para "I've set up the"
	line "printer here for"
	cont "handling UNOWN."

	para "Feel free to use"
	line "it anytime."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#MON appeared"
	line "in the RUINS?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the RUINS."

	para "The RUINS appear"
	line "to have been built"

	para "as a habitat for"
	line "#MON."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "RUINS."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the RUINS."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "MON you saw in the"
	cont "RUINS?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done

RuinsOfAlphResearchCenterUnusedText1: ; unreferenced
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the RUINS."

	para "We've focused our"
	line "studies on that."
	done

RuinsOfAlphResearchCenterUnusedText2: ; unreferenced
	text "According to my"
	line "research…"

	para "Those mysterious"
	line "patterns appeared"

	para "when the #COM"
	line "CENTER was built."

	para "It must mean that"
	line "radio waves have"

	para "some sort of a"
	line "link…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of {d:NUM_UNOWN}"
	line "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "UNOWN may be"
	line "printed out."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF.SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

RuinsOfAlphResearchCenterFossilScientistDoYouHaveFossilText:
	text "Hiya!"

	para "I am important"
	line "doctor!"

	para "I come here to"
	line "find fossils at"
	cont "RUINS!"

	para "But I am not hav-"
	line "ing the luck!"

	para "I must do the"
	line "fossil-studying"

	para "so that I can be"
	line "bringing the"

	para "ancient #MON"
	line "back to life with"

	para "my Resurrection"
	line "Machine!"

	para "Do you have fossil"
	line "maybe?"
	done

RuinsOfAlphResearchCenterFossilScientistNoFossilText:
	text "No fossil!"
	line "Is too bad!"
	done

RuinsOfAlphResearchCenterFossilScientistIsHelixFossilText:
	text "Oh! That is"
	line "HELIX FOSSIL!"

	para "Is Fossil of"
	line "OMANYTE, a"
	cont "#MON that is"
	cont "being extinct!"

	para "You are wanting"
	line "me to bring the"

	para "OMANYTE back"
	line "to life?"
	done

RuinsOfAlphResearchCenterFossilScientistIsDomeFossilText:
	text "Oh! That is"
	line "DOME FOSSIL!"

	para "Is Fossil of"
	line "KABUTO, a"
	cont "#MON that is"
	cont "being extinct!"

	para "You are wanting"
	line "me to bring the"

	para "KABUTO back"
	line "to life?"
	done

RuinsOfAlphResearchCenterFossilScientistIsOldAmberText:
	text "Oh! That is"
	line "OLD AMBER!"

	para "Is Fossil of"
	line "AERODACTYL, a"
	cont "#MON that is"
	cont "being extinct!"

	para "You are wanting"
	line "me to bring the"

	para "AERODACTYL back"
	line "to life?"
	done

RuinsOfAlphResearchCenterFossilScientistGaveFossilText:
	text "Is good!"
	
	para "But I take a"
	line "little time!"
	
	para "You go for walk"
	line "a little while…"
	done

RuinsOfAlphResearchCenterFossilScientistNotDoneYetText:
	text "I am not being"
	line "done yet."
	
	para "I take a little"
	line "time!"
	
	para "You go walk."
	line "I am the busy!"
	done

RuinsOfAlphResearchCenterFossilScientistDoneOmanyteText:
	text "Where were you?"
	
	para "Your fossil is"
	line "back to life!"
	
	para "It was OMANYTE"
	line "like I think!"
	done

RuinsOfAlphResearchCenterFossilScientistDoneKabutoText:
	text "Where were you?"
	
	para "Your fossil is"
	line "back to life!"
	
	para "It was KABUTO"
	line "like I think!"
	done

RuinsOfAlphResearchCenterFossilScientistDoneAerodactylText:
	text "Where were you?"
	
	para "Your fossil is"
	line "back to life!"
	
	para "It was AERODACTYL"
	line "like I think!"
	done

RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText:
	text "Is very good!"
	
	para "You take good"
	line "care of it!"
	done

RuinsOfAlphResearchCenterFossilScientistNoRoomForFossilPokemonText:
	text "You having no"
	line "room for it!"

	para "I hold onto it so"
	line "you go make room,"
	cont "OK?"
	done

RuinsOfAlphResearchCenterPlayerReceivedOmanyteText:
	text "<PLAYER> received"
	line "OMANYTE!"
	done

RuinsOfAlphResearchCenterPlayerReceivedKabutoText:
	text "<PLAYER> received"
	line "KABUTO!"
	done

RuinsOfAlphResearchCenterPlayerReceivedAerodactylText:
	text "<PLAYER> received"
	line "AERODACTYL!"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	object_event  0,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterFossilScientistScript, -1
