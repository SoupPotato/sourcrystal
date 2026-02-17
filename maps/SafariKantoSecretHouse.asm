	object_const_def
	const SAFARI_ZONE_KANTO_SECRET_HOUSE_PRIZE_GUY

SafariKantoSecretHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SafariKantoSecretHousePrizeGuyScript:
	faceplayer
	opentext
	checkevent EVENT_SAFARI_ZONE_KANTO_SECRET_HOUSE_GOT_PRIZE
	iftrue .got_prize
	writetext SafariKantoSecretHousePrizeGuyPrize_Text
	pause 15
	playsound SFX_WRONG
	pause 15
	writetext SafariKantoSecretHousePrizeGuyPrizeWait_Text
	waitbutton
	verbosegiveitem RARE_CANDY
	iffalse .NoRoomForitem
	setevent EVENT_SAFARI_ZONE_KANTO_SECRET_HOUSE_GOT_PRIZE

.got_prize
	writetext SafariKantoSecretHousePrizeGuyAfterPrize_Text
	waitbutton
.NoRoomForitem
	closetext
	end

SafariKantoSecretHousePrizeGuyPrize_Text:
	text "Ah! Finally!"

	para "You're the first"
	line "person to reach"
	cont "the SECRET HOUSE"
	cont "in a while!"

	para "I was getting"
	line "worried no one"
	cont "else would win our"
	cont "campaign prize!"

	para "Congratulations!"
	line "You have won!"

	para "<PLAY_G> received"
	line "HM03 SURF!"
	done

SafariKantoSecretHousePrizeGuyPrizeWait_Text:
	text "Wait…"

	para "You already have"
	line "that HM!?"

	para "<……> <……> <……>"

	para "<……> <……> <……>"

	para "<……> <……> <……>"

	para "Umm… Ok… Ok…"
	line "then uhh…"
	cont "how about this?"
	done

SafariKantoSecretHousePrizeGuyAfterPrize_Text:
	text "HM03 is SURF!"

	para "But you probably"
	line "already know that…"

	para "Well, hope you"
	line "enjoy that candy"
	cont "at least!"

	para "<……> <……> <……>"

	para "(I camped out here"
	line "for three days…)"
	done


SafariKantoSecretHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_KANTO_AREA_4, 8
	warp_event  3,  7, SAFARI_ZONE_KANTO_AREA_4, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariKantoSecretHousePrizeGuyScript, 0
