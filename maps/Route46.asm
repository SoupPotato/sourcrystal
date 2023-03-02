	const_def 2 ; object constants
	const ROUTE46_POKEFAN_M
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_BERRY
	const ROUTE46_BERRY2
	const ROUTE46_APRICORN
	const ROUTE46_APRICORN2
	const ROUTE46_POKE_BALL

Route46_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Fruittrees

.Fruittrees
.Berry:
	checkflag ENGINE_DAILY_ROUTE46_BERRY
	iftrue .NoBerry
	appear ROUTE46_BERRY
.NoBerry:
	;return

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE46_APRICORN
	iftrue .NoApricorn
	appear ROUTE46_APRICORN
.NoApricorn:
	;return

.Berry2:
	checkflag ENGINE_DAILY_ROUTE46_BERRY2
	iftrue .NoBerry2
	appear ROUTE46_BERRY2
.NoBerry2:
	;return

.Apricorn2:
	checkflag ENGINE_DAILY_ROUTE46_APRICORN2
	iftrue .NoApricorn2
	appear ROUTE46_APRICORN2
.NoApricorn2:
	return

TrainerCamperTed:
	trainer CAMPER, TED, EVENT_BEAT_CAMPER_TED, CamperTedSeenText, CamperTedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTedAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerErin1:
	trainer PICNICKER, ERIN1, EVENT_BEAT_PICNICKER_ERIN, PicnickerErin1SeenText, PicnickerErin1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_ERIN
	opentext
	checkflag ENGINE_ERIN
	iftrue .WantsBattle
	checkcellnum PHONE_PICNICKER_ERIN
	iftrue .ErinDefeated
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerErinAfterBattleText
	buttonsound
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall Route46AskNumber1F
	jump .AskForNumber

.AskedAlready:
	scall Route46AskNumber2F
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_ERIN
	ifequal PHONE_CONTACTS_FULL, Route46PhoneFullF
	ifequal PHONE_CONTACT_REFUSED, Route46NumberDeclinedF
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	scall Route46RegisteredNumberF
	jump Route46NumberAcceptedF

.WantsBattle:
	scall Route46RematchF
	winlosstext PicnickerErin1BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN
	checkevent EVENT_ERIN_CALCIUM
	iftrue .HasCalcium
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue .GotCalciumAlready
	scall Route46RematchGiftF
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	jump Route46NumberAcceptedF

.GotCalciumAlready:
	end

.HasCalcium:
	opentext
	writetext PicnickerErin2BeatenText
	waitbutton
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	jump Route46NumberAcceptedF

.ErinDefeated:
	writetext PicnickerErinAfterBattleText
	buttonsound
	closetext
	end

Route46AskNumber1F:
	jumpstd asknumber1f
	end

Route46AskNumber2F:
	jumpstd asknumber2f
	end

Route46RegisteredNumberF:
	jumpstd registerednumberf
	end

Route46NumberAcceptedF:
	jumpstd numberacceptedf
	end

Route46NumberDeclinedF:
	jumpstd numberdeclinedf
	end

Route46PhoneFullF:
	jumpstd phonefullf
	end

Route46RematchF:
	jumpstd rematchf
	end

ErinNoRoomForCalcium:
	setevent EVENT_ERIN_CALCIUM
	jumpstd packfullf
	end

Route46RematchGiftF:
	jumpstd rematchgiftf
	end

TrainerHikerBailey:
	trainer HIKER, BAILEY, EVENT_BEAT_HIKER_BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBaileyAfterBattleText
	waitbutton
	closetext
	end

Route46Sign:
	jumptext Route46SignText

Route46XSpeed:
	itemball X_SPEED

Route46BerryTree:
	opentext
	writetext Route46BerryTreeText
	buttonsound
	writetext Route46HeyItsBerryText
	buttonsound
	verbosegiveitem CHERI_BERRY
	iffalse .NoRoomInBag
	disappear ROUTE46_BERRY
	setflag ENGINE_DAILY_ROUTE46_BERRY
.NoRoomInBag
	closetext
	end

Route46BerryTree2:
	opentext
	writetext Route46BerryTreeText
	buttonsound
	writetext Route46HeyItsBerry2Text
	buttonsound
	verbosegiveitem ORAN_BERRY
	iffalse .NoRoomInBag
	disappear ROUTE46_BERRY2
	setflag ENGINE_DAILY_ROUTE46_BERRY2
.NoRoomInBag
	closetext
	end

Route46ApricornTree:
	opentext
	writetext Route46ApricornTreeText
	buttonsound
	writetext Route46HeyItsApricornText
	buttonsound
	verbosegiveitem GRN_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE46_APRICORN
	setflag ENGINE_DAILY_ROUTE46_APRICORN
.NoRoomInBag
	closetext
	end

Route46ApricornTree2:
	opentext
	writetext Route46ApricornTreeText
	buttonsound
	writetext Route46HeyItsApricorn2Text
	buttonsound
	verbosegiveitem YLW_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE46_APRICORN2
	setflag ENGINE_DAILY_ROUTE46_APRICORN2
.NoRoomInBag
	closetext
	end

Route46NoBerry:
	opentext
	writetext Route46BerryTreeText
	buttonsound
	writetext Route46NothingHereText
	waitbutton
	closetext
	end

Route46NoApricorn:
	opentext
	writetext Route46ApricornTreeText
	buttonsound
	writetext Route46NothingHereText
	waitbutton
	closetext
	end

HikerBaileySeenText:
	text "Awright! I'll show"
	line "you the power of"
	cont "mountain #MON!"
	done

HikerBaileyBeatenText:
	text "Mercy! You showed"
	line "me your power!"
	done

HikerBaileyAfterBattleText:
	text "It's over. I don't"
	line "mind. We HIKERS"
	cont "are like that."
	done

CamperTedSeenText:
	text "I'm raising #-"
	line "MON too!"

	para "Will you battle"
	line "with me?"
	done

CamperTedBeatenText:
	text "Wha…?"
	done

CamperTedAfterBattleText:
	text "I did my best but"
	line "came up short."

	para "No excuses--I"
	line "admit I lost."
	done

PicnickerErin1SeenText:
	text "I raise #MON"
	line "too!"

	para "Will you battle"
	line "with me?"
	done

PicnickerErin1BeatenText:
	text "Oh, rats!"
	done

PicnickerErinAfterBattleText:
	text "I've been to many"
	line "GYMS, but the GYM"

	para "in GOLDENROD is my"
	line "favorite."

	para "It's filled with"
	line "pretty flowers!"
	done

PicnickerErin2BeatenText:
	text "Aww… I keep losing"
	line "all the time!"

	para "I'll just have to"
	line "try harder!"

	para "Anyway, thanks for"
	line "battling me again"

	para "and again. Here's"
	line "that present from"
	cont "the other time."
	done

Route46SignText:
	text "ROUTE 46"
	line "MOUNTAIN RD. AHEAD"
	done

Route46BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route46HeyItsBerryText:
	text "Hey! It's"
	line "CHERI BERRY!"
	done

Route46HeyItsBerry2Text:
	text "Hey! It's"
	line "ORAN BERRY!"
	done

Route46ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route46HeyItsApricornText:
	text "Hey! It's"
	line "GRN APRICORN!"
	done

Route46HeyItsApricorn2Text:
	text "Hey! It's"
	line "YLW APRICORN!"
	done

Route46NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route46_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	db 0 ; coord events

	db 5 ; bg events
	bg_event  9, 27, BGEVENT_READ, Route46Sign
	bg_event  9,  5, BGEVENT_READ, Route46NoBerry
	bg_event  6,  6, BGEVENT_READ, Route46NoBerry
	bg_event  8,  7, BGEVENT_READ, Route46NoApricorn
	bg_event  7,  4, BGEVENT_READ, Route46NoApricorn

	db 8 ; object events
	object_event 12, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBailey, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTed, -1
	object_event  2, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  9,  5, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route46BerryTree, EVENT_ROUTE46_BERRY
	object_event  6,  6, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route46BerryTree2, EVENT_ROUTE46_BERRY2
	object_event  8,  7, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route46ApricornTree, EVENT_ROUTE46_APRICORN
	object_event  7,  4, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, Route46ApricornTree2, EVENT_ROUTE46_APRICORN2
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
