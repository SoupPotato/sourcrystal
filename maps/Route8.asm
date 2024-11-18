	object_const_def
	const ROUTE_8_BIKER1
	const ROUTE_8_BIKER2
	const ROUTE_8_BIKER3
	const ROUTE_8_SUPER_NERD1
	const ROUTE_8_SUPER_NERD2
	const ROUTE_8_BERRY
	const ROUTE_8_APRICORN

Route8_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route8Fruittrees

Route8Fruittrees:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_8_BERRY
	iftrue .NoBerry
	appear ROUTE_8_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE_8_APRICORN
	iftrue .NoApricorn
	appear ROUTE_8_APRICORN
.NoApricorn:
	endcallback

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTomAfterBattleText
	waitbutton
	closetext
	end

TrainerCoupleMoeandLulu1:
	trainer COUPLE, MOEANDLULU, EVENT_BEAT_TWINS_MOEANDLULU, TrainerCoupleMoeandLuluSeenText, TrainerCoupleMoeandLuluBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerCoupleMoeandLulu1AfterBattleText
	waitbutton
	closetext
	end

TrainerCoupleMoeandLulu2:
	trainer COUPLE, MOEANDLULU, EVENT_BEAT_TWINS_MOEANDLULU, TrainerCoupleMoeandLuluSeenText, TrainerCoupleMoeandLuluBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerCoupleMoeandLulu2AfterBattleText
	waitbutton
	closetext
	end

GentlemanMilton:
	trainer GENTLEMAN, MILTON, EVENT_BEAT_GENTLEMAN_MILTON, GentlemanMiltonSeenText, GentlemanMiltonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanMiltonAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8BerryTree:
	opentext
	getitemname STRING_BUFFER_3, CHERI_BERRY
	writetext Route8BerryTreeText
	promptbutton
	writetext Route8HeyItsBerryApricornText
	promptbutton
	giveitem CHERI_BERRY
	iffalse Route8NoRoomInBag
	disappear ROUTE_8_BERRY
	setflag ENGINE_DAILY_ROUTE_8_BERRY
	writetext Route8FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route8ApricornTree:
	opentext
	getitemname STRING_BUFFER_3, YLW_APRICORN
	writetext Route8ApricornTreeText
	promptbutton
	writetext Route8HeyItsBerryApricornText
	promptbutton
	giveitem YLW_APRICORN
	iffalse Route8NoRoomInBag
	disappear ROUTE_8_APRICORN
	setflag ENGINE_DAILY_ROUTE_8_APRICORN
	writetext Route8FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route8NoBerry:
	opentext
	writetext Route8BerryTreeText
	promptbutton
	writetext Route8NothingHereText
	waitbutton
	closetext
	end

Route8NoApricorn:
	opentext
	writetext Route8ApricornTreeText
	promptbutton
	writetext Route8NothingHereText
	waitbutton
	closetext
	end

Route8NoRoomInBag:
	writetext Route8NoRoomInBagText
	waitbutton
	closetext
	end

BikerDwayneSeenText:
	text "We're the KANTO"
	line "#MON FEDERATION"
	cont "trainer group."

	para "We'll drive you"
	line "under our wheels!"
	done

BikerDwayneBeatenText:
	text "S-sorry!"
	done

BikerDwayneAfterBattleText:
	text "The KANTO #MON"
	line "FEDERATION will"
	cont "never fall!"
	done

BikerHarrisSeenText:
	text "The cops shut down"
	line "our UNDERGROUND"
	cont "PATH!"

	para "That really fries"
	line "me!"
	done

BikerHarrisBeatenText:
	text "F-forgive me!"
	done

BikerHarrisAfterBattleText:
	text "Wiped out by some"
	line "punk from JOHTO…"
	done

BikerZekeSeenText:
	text "We're the KANTO"
	line "#MON FEDERA-"
	cont "TION!"
	cont "Right on!"
	done

BikerZekeBeatenText:
	text "Yikes! Sorry!"
	done

BikerZekeAfterBattleText:
	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done

SupernerdSamSeenText:
	text "How does the MAG-"
	line "NET TRAIN work?"
	done

SupernerdSamBeatenText:
	text "I just want to see"
	line "the MAGNET TRAIN…"
	done

SupernerdSamAfterBattleText:
	text "The power of mag-"
	line "nets is awesome!"
	done

SupernerdTomSeenText:
	text "Hm… You've got"
	line "many GYM BADGES."
	done

SupernerdTomBeatenText:
	text "Just as I thought…"
	line "You're tough!"
	done

SupernerdTomAfterBattleText:
	text "GYM BADGES give"
	line "you advantages in"
	cont "battles."
	done

TrainerCoupleMoeandLuluSeenText:
	text "MOE: Do I look"
	line "weak?"

	para "Don't make me"
	line "laugh!"

	para "When I'm with"
	line "LULU, I've got a"
	cont "hundred times more"
	cont "courage!"

	para "LULU: MOE and I"
	line "make a great pair!"

	para "You should prepare"
	line "yourself!"
	done

TrainerCoupleMoeandLuluBeatenText:
	text "MOE: Uwaaaahhh…"

	para "LULU: Eeek!"
	done

TrainerCoupleMoeandLulu1AfterBattleText:
	text "MOE: In short,"
	line "you're just too"
	cont "strong…"
	done

TrainerCoupleMoeandLulu2AfterBattleText:
	text "LULU: Don't mis-"
	line "understand this!"

	para "It's not that"
	line "MOE's weak,"

	para "it's that you're"
	line "too strong!"
	done

GentlemanMiltonSeenText:
	text "I am but a"
	line "GENTLEMAN stopped"
	cont "on the road."

	para "Would you care to"
	line "join me in a"
	cont "quick contest?"
	done

GentlemanMiltonBeatenText:
	text "You were very"
	line "skillful."
	done

GentlemanMiltonAfterBattleText:
	text "Stopping in the"
	line "road for a battle"
	cont "isn't rude."

	para "No matter what,"
	line "I am a GENTLEMAN"
	cont "first!"
	done

Route8LockedDoorText:
	text "It's locked…"
	done

Route8UndergroundPathSignText:
	text "The flyer's torn."

	para "It's impossible to"
	line "read…"
	done

Route8BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route8ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route8NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route8HeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route8FoundItemText:
	text_far _FoundItemText
	text_end

Route8NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 10, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4, 11, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11,  5, BGEVENT_READ, Route8UndergroundPathSign
	bg_event  9,  3, BGEVENT_READ, Route8LockedDoor
	bg_event  5, 14, BGEVENT_READ, Route8NoBerry
	bg_event 49,  6, BGEVENT_READ, Route8NoApricorn

	def_object_events
	object_event 12, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerBikerDwayne, -1
	object_event 12, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBikerHarris, -1
	object_event 12, 13, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBikerZeke, -1
	object_event 21, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 39,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdTom, -1
	object_event  5, 14, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route8BerryTree, EVENT_ROUTE_8_BERRY
	object_event 49,  6, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route8ApricornTree, EVENT_ROUTE_8_APRICORN
	object_event 30,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleMoeandLulu1, -1
	object_event 31,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleMoeandLulu2, -1
	object_event 45, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, GentlemanMilton, -1
