	const_def 2 ; object constants
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2
	const ROUTE10_ZAPDOS

Route10South_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppear
	checkcode VAR_BADGES
	ifequal NUM_BADGES, .Appear
	jump .NoAppear

.Appear:
	appear ROUTE10_ZAPDOS
	return

.NoAppear:
	disappear ROUTE10_ZAPDOS
	return

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end

Route10Zapdos:
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ZAPDOS, 50
	startbattle
	disappear ROUTE10_ZAPDOS
	setevent EVENT_FOUGHT_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Gyaoo!"
	done

Route10Sign:
	jumptext Route10SignText

PowerPlantSign:
	jumptext PowerPlantSignText

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hachoo!"
	done

HikerJimAfterBattleText:
	text "Hay fever is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done

PokefanmRobertSeenText:
	text "You like #MON,"
	line "don't you?"

	para "Me too!"
	done

PokefanmRobertBeatenText:
	text "I'd have to say"
	line "that's my loss."
	done

PokefanmRobertAfterBattleText:
	text "Look what you did"
	line "to my #MON…"

	para "I won't forget"
	line "this…"
	done

Route10SignText:
	text "ROUTE 10"

	para "CERULEAN CITY -"
	line "LAVENDER TOWN"
	done

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  9, POWER_PLANT, 1
	warp_event  8, 23, ROCK_TUNNEL_1F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 11, BGEVENT_READ, PowerPlantSign
	bg_event  9, 25, BGEVENT_READ, Route10Sign

	db 3 ; object events
	object_event 17, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 10, 34, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event  3, 10, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0,  Route10Zapdos, EVENT_ZAPDOS_APPEAR
