AlfredAnswerPhoneText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good morning,"
	line "<PLAY_G>!"
	done

AlfredAnswerPhoneDayText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good afternoon,"
	line "<PLAY_G>!"
	done

AlfredAnswerPhoneNiteText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good evening,"
	line "<PLAY_G>!"
	done

AlfredGreetText:
	text "<PLAY_G>, good"
	line "morning!"

	para "This is, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

AlfredGreetDayText:
	text "<PLAY_G>, good"
	line "afternoon!"

	para "This is, @"
	text_ram wStringBuffer3
	text "."
	line "Isn't it nice out?"
	done

AlfredGreetNiteText:
	text "<PLAY_G>, good"
	line "evening!"

	para "This is, @"
	text_ram wStringBuffer3
	text "."
	line "Do you have a"
	cont "moment to spare?"
	done

AlfredReminderText:
	text "Oh, hey, good"
	line "afternoon."

	para "Is everything all"
	line "right?"

	para "Did you forget"
	line "about our appoint-"
	cont "ment?"

	para "I'm waiting at"
	line "@"
	text_from_ram wStringBuffer5
	text "."

	para "I will see you"
	line "there!"
	done

AlfredPokemonBlurbText:
	text "Just like this,"
	line "when calling a"

	para "young person such"
	line "as yourself, you"
	
	para "can trade in-"
	line "formation."

	para "Just like this,"
	line "#MON bring"

	para "people together,"
	line "don't they?"

	para "Truly, #MON"
	line "are such extra-"
	cont "ordinary beings."
	done
