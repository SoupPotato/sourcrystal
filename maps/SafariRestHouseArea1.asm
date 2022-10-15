	const_def 2 ; object constants
	const SAFARIZONERESTHOUSEAREA1_LASS
	const SAFARIZONERESTHOUSEAREA1_SUPER_NERD

SafariRestHouseArea1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariRestHouseArea1LassScript:
	faceplayer
	opentext
	writetext SafariRestHouseArea1LassScript_Text
	waitbutton
	closetext
	end

SafariRestHouseArea1SuperNerdScript:
	faceplayer
	opentext
	writetext SafariRestHouseArea1SuperNerdScript_Text
	waitbutton
	closetext
	end

SafariRestHouseArea1LassScript_Text:
	text "There are so many"
	line "#MON here that"
	cont "can't be found"
	cont "anywhere else in"
	cont "JOHTO."
	
	para "I want them all!"
	done

SafariRestHouseArea1SuperNerdScript_Text:
	text "I'm running out of"
	line "SAFARI BALLS."
	
	para "I had better be"
	line "careful from now"
	cont "on or my Safari"
	cont "game is over!"
	done

SafariRestHouseArea1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_1, 9
	warp_event  3,  7, SAFARI_ZONE_AREA_1, 9

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariRestHouseArea1LassScript, 0
	object_event  2,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariRestHouseArea1SuperNerdScript, 0
