WaltReminderText:
	text "Hey, <PLAY_G>!"

	para "I'm all ready, and"
	line "waiting for you on"
	cont "@"
	text_from_ram wStringBuffer5
	text ","
	cont "so hurry up!"
	done

WaltJustAHobbyText:
	text "You know, lots of"
	line "people get the"

	para "wrong idea about"
	line "me."

	para "Isn't that right,"
	line "@"
	text_ram wStringBuffer4 
	text "?"

	para "Breathing fire is"
	line "just a hobby!"
	done