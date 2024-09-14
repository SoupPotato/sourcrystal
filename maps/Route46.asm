	object_const_def
	const ROUTE_46_POKEFAN_M
	const ROUTE_46_YOUNGSTER
	const ROUTE_46_LASS
	const ROUTE_46_BERRY
	const ROUTE_46_BERRY_2
	const ROUTE_46_APRICORN
	const ROUTE_46_APRICORN_2
	const ROUTE_46_POKE_BALL

Route46_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route46Fruittrees

Route46Fruittrees:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_46_BERRY
	iftrue .NoBerry
	appear ROUTE_46_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE_46_APRICORN
	iftrue .NoApricorn
	appear ROUTE_46_APRICORN
.NoApricorn:
	;fallthrough

.BERRY_2:
	checkflag ENGINE_DAILY_ROUTE_46_BERRY_2
	iftrue .NoBERRY_2
	appear ROUTE_46_BERRY_2
.NoBERRY_2:
	;fallthrough

.APRICORN_2:
	checkflag ENGINE_DAILY_ROUTE_46_APRICORN_2
	iftrue .NoAPRICORN_2
	appear ROUTE_46_APRICORN_2
.NoAPRICORN_2:
	endcallback

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
	loadvar VAR_CALLERID, PHONE_PICNICKER_ERIN
	opentext
	checkflag ENGINE_ERIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_PICNICKER_ERIN
	iftrue .ErinDefeated
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerErinAfterBattleText
	promptbutton
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall Route46AskNumber1F
	sjump .AskForNumber

.AskedAlready:
	scall Route46AskNumber2F
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_ERIN
	ifequal PHONE_CONTACTS_FULL, Route46PhoneFullF
	ifequal PHONE_CONTACT_REFUSED, Route46NumberDeclinedF
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall Route46RegisteredNumberF
	sjump Route46NumberAcceptedF

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
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	checkevent EVENT_ERIN_CALCIUM
	iftrue .HasCalcium
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue .GotCalciumAlready
	scall Route46RematchGiftF
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route46NumberAcceptedF

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
	sjump Route46NumberAcceptedF

.ErinDefeated:
	writetext PicnickerErinAfterBattleText
	promptbutton
	closetext
	end

Route46AskNumber1F:
	jumpstd AskNumber1FScript
	end

Route46AskNumber2F:
	jumpstd AskNumber2FScript
	end

Route46RegisteredNumberF:
	jumpstd RegisteredNumberFScript
	end

Route46NumberAcceptedF:
	jumpstd NumberAcceptedFScript
	end

Route46NumberDeclinedF:
	jumpstd NumberDeclinedFScript
	end

Route46PhoneFullF:
	jumpstd PhoneFullFScript
	end

Route46RematchF:
	jumpstd RematchFScript
	end

ErinNoRoomForCalcium:
	setevent EVENT_ERIN_CALCIUM
	jumpstd PackFullFScript
	end

Route46RematchGiftF:
	jumpstd RematchGiftFScript
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
	getitemname STRING_BUFFER_3, CHERI_BERRY
	writetext Route46BerryTreeText
	promptbutton
	writetext Route46HeyItsBerryApricornText
	promptbutton
	giveitem CHERI_BERRY
	iffalse Route46NoRoomInBag
	disappear ROUTE_46_BERRY
	setflag ENGINE_DAILY_ROUTE_46_BERRY
	writetext Route46FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route46BerryTree2:
	opentext
	getitemname STRING_BUFFER_3, ORAN_BERRY
	writetext Route46BerryTreeText
	promptbutton
	writetext Route46HeyItsBerryApricornText
	promptbutton
	giveitem ORAN_BERRY
	iffalse Route46NoRoomInBag
	disappear ROUTE_46_BERRY_2
	setflag ENGINE_DAILY_ROUTE_46_BERRY_2
	writetext Route46FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route46ApricornTree:
	opentext
	getitemname STRING_BUFFER_3, GRN_APRICORN
	writetext Route46ApricornTreeText
	promptbutton
	writetext Route46HeyItsBerryApricornText
	promptbutton
	giveitem GRN_APRICORN
	iffalse Route46NoRoomInBag
	disappear ROUTE_46_APRICORN
	setflag ENGINE_DAILY_ROUTE_46_APRICORN
	writetext Route46FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route46ApricornTree2:
	opentext
	getitemname STRING_BUFFER_3, YLW_APRICORN
	writetext Route46ApricornTreeText
	promptbutton
	writetext Route46HeyItsBerryApricornText
	promptbutton
	giveitem YLW_APRICORN
	iffalse Route46NoRoomInBag
	disappear ROUTE_46_APRICORN_2
	setflag ENGINE_DAILY_ROUTE_46_APRICORN_2
	writetext Route46FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route46NoBerry:
	opentext
	writetext Route46BerryTreeText
	promptbutton
	writetext Route46NothingHereText
	waitbutton
	closetext
	end

Route46NoApricorn:
	opentext
	writetext Route46ApricornTreeText
	promptbutton
	writetext Route46NothingHereText
	waitbutton
	closetext
	end

Route46NoRoomInBag:
	writetext Route46NoRoomInBagText
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

Route46HeyItsBERRY_2Text:
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

Route46HeyItsAPRICORN_2Text:
	text "Hey! It's"
	line "YLW APRICORN!"
	done

Route46NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route46HeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route46FoundItemText:
	text_far _FoundItemText
	text_end

Route46NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route46_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route46Sign
	bg_event  9,  5, BGEVENT_READ, Route46NoBerry
	bg_event  6,  6, BGEVENT_READ, Route46NoBerry
	bg_event  8,  7, BGEVENT_READ, Route46NoApricorn
	bg_event  7,  4, BGEVENT_READ, Route46NoApricorn

	def_object_events
	object_event 12, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBailey, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTed, -1
	object_event  2, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  9,  5, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route46BerryTree, EVENT_ROUTE_46_BERRY
	object_event  6,  6, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route46BerryTree2, EVENT_ROUTE_46_BERRY_2
	object_event  8,  7, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route46ApricornTree, EVENT_ROUTE_46_APRICORN
	object_event  7,  4, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route46ApricornTree2, EVENT_ROUTE_46_APRICORN_2
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
