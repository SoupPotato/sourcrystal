	object_const_def
	const ROUTE3_YOUNGSTER_1
	const ROUTE3_YOUNGSTER_2
	const ROUTE3_YOUNGSTER_3
	const ROUTE3_COOLTRAINER_M
	const ROUTE3_COOLTRAINER_F
	const ROUTE3_FISHER_1
	const ROUTE3_POKEFAN_M_1
	const ROUTE3_POKEFAN_M_2
	const ROUTE3_BLACK_BELT_1
	const ROUTE3_BLACK_BELT_2
	const ROUTE3_POKEBALL

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

Route3Sign:
	jumptext Route3SignText

TrainerHikerBruce:
	trainer HIKER, BRUCE, EVENT_BEAT_HIKER_BRUCE, HikerBruceSeenText, HikerBruceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBruceAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDwight:
	trainer HIKER, DWIGHT, EVENT_BEAT_HIKER_DWIGHT, HikerDwightSeenText, HikerDwightBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDwightAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackBeltManford:
	trainer BLACKBELT_T, MANFORD, EVENT_BEAT_BLACKBELT_MANFORD, BlackBeltManfordSeenText, BlackBeltManfordBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackBeltManfordAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackBeltAnder:
	trainer BLACKBELT_T, ANDER, EVENT_BEAT_BLACKBELT_ANDER, BlackBeltAnderSeenText, BlackBeltAnderBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackBeltAnderAfterBattleText
	waitbutton
	closetext
	end

TrainerCoolDuoZacandJen1:
	trainer COOL_DUO, ZACANDJEN, EVENT_BEAT_COOL_DUO_ZAC_AND_JEN, CoolDuoZacandJenSeenText, CoolDuoZacandJenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoZacandJen1AfterBattleText
	waitbutton
	closetext
	end

TrainerCoolDuoZacandJen2:
	trainer COOL_DUO, ZACANDJEN, EVENT_BEAT_COOL_DUO_ZAC_AND_JEN, CoolDuoZacandJenSeenText, CoolDuoZacandJenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoZacandJen2AfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterRegis:
	trainer YOUNGSTER, REGIS, EVENT_BEAT_YOUNGSTER_REGIS, YoungsterRegisSeenText, YoungsterRegisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterRegisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

HikerBruceSeenText:
	text "My Bag is dig-"
	line "ging into my"
	cont "shoulders!"

	para "When that happens,"
	line "I like to take a"

	para "break and have"
	line "a battle!"
	done

HikerBruceBeatenText:
	text "Feh."
	done

HikerBruceAfterBattleText:
	text "All right,"
	line "I guess I should"

	para "carry my bag"
	line "again!"
	done

HikerDwightSeenText:
	text "Peace!"

	para "…"
	line "…Huh?"

	para "When you meet"
	line "the unknown on a"
	cont "mountain road,"

	para "all you want"
	line "is peace, right?"
	done

HikerDwightBeatenText:
	text "Peace--even"
	line "though I lost!"
	done

HikerDwightAfterBattleText:
	text "Exchanging light-"
	line "hearted greetings"

	para "with someone you"
	line "dont know…"

	para "That's the best"
	line "thing about"
	cont "mountains!"
	done

BlackBeltManfordSeenText:
	text "How about you"
	line "just slow down"

	para "and give me a"
	line "chance to defeat"
	cont "you!"
	done

BlackBeltManfordBeatenText:
	text "Looks like I've"
	line "been beaten at"
	cont "my own game…"
	done

BlackBeltManfordAfterBattleText:
	text "Even though you're"
	line "so young, you have"

	para "the spirit of"
	line "battle within."

	para "You must have"
	line "trained under a"
	cont "well-known master!"
	done

BlackBeltAnderSeenText:
	text "Wait a moment!"
	line "Come fight us!"
	done

BlackBeltAnderBeatenText:
	text "You did it…"
	done

BlackBeltAnderAfterBattleText:
	text "You came all the"
	line "way from JOHTO?"

	para "You must be very"
	line "persistent!"
	done

CoolDuoZacandJenSeenText:
	text "ZAC: Really, you"
	line "want to battle us?"

	para "You've got a"
	line "lot courage for"
	cont "someone so young."

	para "JEN: Huh? You'd"
	line "like to go up"
	cont "against us?"
	cont "Great!"
	done

CoolDuoZacandJenBeatenText:
	text "ZAC: You weren't"
	line "bluffing…"

	para "JEN: You're so"
	line "much stronger"
	cont "than I thought."
	done

CoolDuoZacandJen1AfterBattleText:
	text "ZAC: Your future"
	line "looks promising."
	done

CoolDuoZacandJen2AfterBattleText:
	text "JEN: I'm looking"
	line "foward to seeing"

	para "what kind of"
	line "Trainer you'll"
	cont "become."
	done

YoungsterRegisSeenText:
	text "Youngster?"

	para "Goodness, how"
	line "rude!"

	para "Call me Shorts"
	line "Boy!"
	done

YoungsterRegisBeatenText:
	text "That is…"
	line "Fail Boy…"
	done

YoungsterRegisAfterBattleText:
	text "Looks like I need"
	line "a bit more train-"
	cont "ing!"
	done

YoungsterWarrenSeenText:
	text "Hmmm… I don't know"
	line "what to do…"
	done

YoungsterWarrenBeatenText:
	text "I knew I'd lose…"
	done

YoungsterWarrenAfterBattleText:
	text "You looked strong."

	para "I was afraid to"
	line "take you on…"
	done

YoungsterJimmySeenText:
	text "I can run like the"
	line "wind!"
	done

YoungsterJimmyBeatenText:
	text "Blown away!"
	done

YoungsterJimmyAfterBattleText:
	text "I wear shorts the"
	line "whole year round."

	para "That's my fashion"
	line "policy."
	done

FirebreatherOtisSeenText:
	text "Ah! The weather's"
	line "as fine as ever."
	done

FirebreatherOtisBeatenText:
	text "It's sunny, but"
	line "I'm all wet…"
	done

FirebreatherOtisAfterBattleText:
	text "When it rains,"
	line "it's hard to get"
	cont "ignition…"
	done

Route3SignText:
	text "ROUTE 3"
	line "MT.MOON AHEAD"
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 59,  9, BGEVENT_READ, Route3Sign

	def_object_events
	object_event 15,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterRegis, -1
	object_event 20,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterWarren, -1
	object_event 23,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJimmy, -1
	object_event 16, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCoolDuoZacandJen1, -1
	object_event 17, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCoolDuoZacandJen2, -1
	object_event 30, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 38,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerBruce, -1
	object_event 58, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerDwight, -1
	object_event 45,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBlackBeltManford, -1
	object_event 54, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackBeltAnder, -1
