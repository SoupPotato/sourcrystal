	const_def 2 ; object constants
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_YOUNGSTER3
	const ROUTE3_FISHER2

Route3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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
	trainer COOL_DUO, ZACANDJEN1, EVENT_BEAT_COOL_DUO_ZAC_AND_JEN, CoolDuoZacandJenSeenText, CoolDuoZacandJenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoZacandJen1AfterBattleText
	waitbutton
	closetext
	end

TrainerCoolDuoZacandJen2:
	trainer COOL_DUO, ZACANDJEN2, EVENT_BEAT_COOL_DUO_ZAC_AND_JEN, CoolDuoZacandJenSeenText, CoolDuoZacandJenBeatenText, 0, .Script

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

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText
	
Route3MtMoonPokecenterSign:
	jumpstd pokecentersign
	

HikerBruceSeenText:
	text "My Bag is"
	line "digging into my"
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
	text "Even though"
	line "you're so young,"
	
	para "you have the"
	line "spirit of battle"
	cont "within."
	
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
	line "Goodness,"
	cont "how rude!"
	
	para "Call me"
	line "Shorts Boy!"
	done

YoungsterRegisBeatenText:
	text "That is…"
	line "Fail Boy…"
	done

YoungsterRegisAfterBattleText:
	text "Looks like I"
    line "need a bit more"
	cont "training!"
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

FirebreatherBurtSeenText:
	text "Step right up and"
	line "take a look!"
	done

FirebreatherBurtBeatenText:
	text "Yow! That's hot!"
	done

FirebreatherBurtAfterBattleText:
	text "The greatest fire-"
	line "breather in KANTO,"
	cont "that's me."

	para "But not the best"
	line "trainer…"
	done

Route3MtMoonSquareSignText:
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 64,  7, MOUNT_MOON, 1
	warp_event 57,  7, MOUNT_MOON_POKECENTER_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 55, 29, BGEVENT_READ, Route3MtMoonSquareSign
	bg_event 58,  7, BGEVENT_READ, Route3MtMoonPokecenterSign

	db 11 ; object events
	object_event 11, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterRegis, -1
	object_event 16, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterWarren, -1
	object_event 19, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJimmy, -1
	object_event 12, 32, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCoolDuoZacandJen1, -1
	object_event 13, 32, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCoolDuoZacandJen2, -1
	object_event 26, 30, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 58, 12, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 34, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerBruce, -1
	object_event 54, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerDwight, -1
	object_event 41, 29, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBlackBeltManford, -1
	object_event 50, 32, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackBeltAnder, -1
	
