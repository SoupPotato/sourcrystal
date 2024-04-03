	object_const_def
	const MOVEDELETERSHOUSE_SUPER_NERD
	const MOVEDELETERSHOUSE_FISHER

MoveDeletersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

MoveReminder:
	faceplayer
	opentext
	writetext MoveDeletersHouse_MoveReminderIntroText
	yesorno
	iffalse .refused
	checkitem BIG_MUSHROOM
	iftrue .have_a_big_mushroom
	checkitem TINYMUSHROOM, 2
	iftrue .have_a_tiny_mushroom
	writetext MoveDeletersHouse_MoveReminderLowOnMushroomsText
	waitbutton
	closetext
	end

.have_a_big_mushroom:
	checkitem TINYMUSHROOM, 2
	iftrue .have_both_mushrooms
	writetext MoveDeletersHouse_WhichMushroomText
	loadmenu BigMushroomMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .BigMushroomChoice
	jump .refused


.have_a_tiny_mushroom
	writetext MoveDeletersHouse_WhichMushroomText
	loadmenu TinyMushroomsMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .TinyMushroomChoice
	jump .refused

.have_both_mushrooms:
	writetext MoveDeletersHouse_WhichMushroomText
	loadmenu BothMushroomsMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .TinyMushroomChoice
	ifequal $2, .BigMushroomChoice
	jump .refused


.TinyMushroomChoice:
	callasm LoadTinyMushroom
	sjump .relearn_move

.BigMushroomChoice:
	callasm LoadBigMushroom
;fallthrough

.relearn_move:
	special MoveReminder
	waitbutton
	closetext
	end

.refused:
	writetext MoveDeletersHouse_MoveReminderCancelText
	waitbutton
	closetext
	end

LoadTinyMushroom:
	ld a, TINYMUSHROOM
	ld [wMoveReminderItem], a
	ret

LoadBigMushroom:
	ld a, BIG_MUSHROOM
	ld [wMoveReminderItem], a
	ret

BigMushroomMenuDataHeader:
	db $40 ; flags
	db 05, 00 ; start coords
	db 11, 18 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 2 ; items
	db "1× BIG MUSHROOM@"
	db "CANCEL@"

TinyMushroomsMenuDataHeader:
	db $40 ; flags
	db 05, 00 ; start coords
	db 11, 18 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 2 ; items
	db "2× TINYMUSHROOMs@"
	db "CANCEL@"

BothMushroomsMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 18 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 3 ; items
	db "2× TINYMUSHROOMs@"
	db "1× BIG MUSHROOM@"
	db "CANCEL@"

MoveDeletersHouse_MoveReminderIntroText:
	text "Hi, I'm the"
	line "MOVE REMINDER!"

	para "I also love"
	line "mushrooms."
	
	para "If you bring me"
	line "a BIG MUSHROOM,"
	
	para "or perhaps two"
	line "TINYMUSHROOMs,"

	para "I can make your"
	line "#MON remember"
	cont "its moves."

	para "Are you"
	line "interested?"
	done

MoveDeletersHouse_MoveReminderCancelText:
	text "Come visit me"
	line "again."
	done

MoveDeletersHouse_MoveReminderLowOnMushroomsText:
	text "You're low on"
	line "mushrooms!"
	
	para "Bring me mushrooms"
	line "then we can talk."
	done

MoveDeletersHouse_WhichMushroomText:
	text "What are you going"
	line "to give me?"
	done

MoveDeletersHouseBookshelf:
	jumpstd DifficultBookshelfScript

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 6
	warp_event  3,  7, BLACKTHORN_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MoveDeletersHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  5,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveReminder, -1
