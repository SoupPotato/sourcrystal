	const_def 2 ; object constants
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_BERRY
	const ROUTE33_APRICORN
	const ROUTE33_APRICORN2

Route33_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Fruittrees

.Fruittrees:
.Berry:
	checkflag ENGINE_DAILY_ROUTE33_BERRY
	iftrue .NoBerry
	appear ROUTE33_BERRY
.NoBerry:
	;return

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE33_APRICORN
	iftrue .NoApricorn
	appear ROUTE33_APRICORN
.NoApricorn:
	;return

.Apricorn2:
	checkflag ENGINE_DAILY_ROUTE33_APRICORN2
	iftrue .NoApricorn2
	appear ROUTE33_APRICORN2
.NoApricorn2:
	return

Route33LassScript:
	jumptextfaceplayer Route33LassText

TrainerHikerAnthony:
	trainer HIKER, ANTHONY2, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_HIKER_ANTHONY
	opentext
	checkflag ENGINE_ANTHONY
	iftrue .Rematch
	checkcellnum PHONE_HIKER_ANTHONY
	iftrue .NumberAccepted
	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext HikerAnthony2AfterText
	buttonsound
	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForPhoneNumber

.AskAgain:
	scall .AskNumber2
.AskForPhoneNumber:
	askforphonenumber PHONE_HIKER_ANTHONY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext HikerAnthony2BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
	loadtrainer HIKER, ANTHONY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.LoadFight1:
	loadtrainer HIKER, ANTHONY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.LoadFight3:
	loadtrainer HIKER, ANTHONY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.LoadFight4:
	loadtrainer HIKER, ANTHONY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

Route33Sign:
	jumptext Route33SignText

Route33BerryTree:
	opentext
	writetext Route33BerryTreeText
	buttonsound
	writetext Route33HeyItsBerryText
	buttonsound
	verbosegiveitem PECHA_BERRY
	iffalse .NoRoomInBag
	disappear ROUTE33_BERRY
	setflag ENGINE_DAILY_ROUTE33_BERRY
.NoRoomInBag
	closetext
	end

Route33ApricornTree:
	opentext
	writetext Route33ApricornTreeText
	buttonsound
	writetext Route33HeyItsApricornText
	buttonsound
	verbosegiveitem BLK_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE33_APRICORN
	setflag ENGINE_DAILY_ROUTE33_APRICORN
.NoRoomInBag
	closetext
	end

Route33ApricornTree2:
	opentext
	writetext Route33ApricornTreeText
	buttonsound
	writetext Route33HeyItsApricorn2Text
	buttonsound
	verbosegiveitem PNK_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE33_APRICORN2
	setflag ENGINE_DAILY_ROUTE33_APRICORN2
.NoRoomInBag
	closetext
	end

Route33NoBerry:
	opentext
	writetext Route33BerryTreeText
	buttonsound
	writetext Route33NothingHereText
	waitbutton
	closetext
	end

Route33NoApricorn:
	opentext
	writetext Route33ApricornTreeText
	buttonsound
	writetext Route33NothingHereText
	waitbutton
	closetext
	end

HikerAnthony2SeenText:
	text "I came through the"
	line "tunnel, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthony2BeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

HikerAnthony2AfterText:
	text "We HIKERS are at"
	line "our best in the"
	cont "mountains."
	done

Route33LassText:
	text "Pant, pant…"

	para "I finally got"
	line "through that cave."

	para "It was much bigger"
	line "than I'd expected."

	para "I got too tired to"
	line "explore the whole"

	para "thing, so I came"
	line "outside."
	done

Route33SignText:
	text "ROUTE 33"
	done

Route33BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route33HeyItsBerryText:
	text "Hey! It's"
	line "PECHA BERRY!"
	done

Route33ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route33HeyItsApricornText:
	text "Hey! It's"
	line "BLK APRICORN!"
	done

Route33HeyItsApricorn2Text:
	text "Hey! It's"
	line "PNK APRICORN!"
	done

Route33NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route33_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  9, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11, 11, BGEVENT_READ, Route33Sign
	bg_event  6, 11, BGEVENT_READ, Route33NoBerry
	bg_event 13, 16, BGEVENT_READ, Route33NoApricorn
	bg_event 14, 16, BGEVENT_READ, Route33NoApricorn

	db 5 ; object events
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 12, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route33LassScript, -1
	object_event  6, 11, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route33BerryTree, EVENT_ROUTE33_BERRY
	object_event 14, 16, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, Route33ApricornTree, EVENT_ROUTE33_APRICORN
	object_event 13, 16, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route33ApricornTree2, EVENT_ROUTE33_APRICORN2
