	const_def 2 ; object constants
	const GOLDENRODSWARMSPEECHHOUSE_GRAMPS

GoldenrodSwarmSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodSwarmSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

GoldenrodSwarmSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

GoldenrodSwarmSpeechHouseRadio:
	jumpstd radio2

GoldenrodSwarmSpeechSwarmGrampsScript:
	faceplayer
	opentext
	checkflag ENGINE_SWARM
	iftrue .skiprandomswarm
	writetext GoldenrodSwarmSpeechSwarmNewsText
	waitbutton
	random 3
	ifequal 0, .dunsparce
	ifequal 1, .yanma
	ifequal 2, .qwilfish

.dunsparce
	setflag ENGINE_SWARM
	swarm DARK_CAVE_VIOLET_ENTRANCE
	writetext GoldenrodSwarmSpeechSwarmDunsparceText
	waitbutton
	closetext
	end

.yanma
	setflag ENGINE_SWARM
	swarm ROUTE_35
	writetext GoldenrodSwarmSpeechSwarmYanmaText
	waitbutton
	closetext
	end

.qwilfish
	setflag ENGINE_SWARM
	swarm ROUTE_32
	writetext GoldenrodSwarmSpeechSwarmQwilfishText
	waitbutton
	closetext
	end

.skiprandomswarm
	writetext GoldenrodSwarmSpeechSkipSwarmText
	waitbutton
	closetext
	end

GoldenrodSwarmSpeechSwarmNewsText:
	text "Let me see…"
	line "What did the news"
	cont "say?"
	done

GoldenrodSwarmSpeechSwarmDunsparceText:
	text "Oh yes! There's a"
	line "swarm of DUNSPARCE"
	cont "at DARK CAVE."
	done
	
GoldenrodSwarmSpeechSwarmYanmaText:
	text "Oh yes! There's a"
	line "swarm of YANMA"
	cont "on ROUTE 35."
	done
	
GoldenrodSwarmSpeechSwarmQwilfishText:
	text "Oh yes! There's a"
	line "swarm of QWILFISH"
	cont "on ROUTE 32."
	done

GoldenrodSwarmSpeechSkipSwarmText:
	text "Often #MON"
	line "of unusual colors"

	para "are reported in"
	line "swarms."
	done

GoldenrodSwarmSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 16
	warp_event  3,  7, GOLDENROD_CITY, 16

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, GoldenrodSwarmSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, GoldenrodSwarmSpeechHouseBookshelf2
	bg_event  7,  1, BGEVENT_READ, GoldenrodSwarmSpeechHouseRadio

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodSwarmSpeechSwarmGrampsScript, -1
