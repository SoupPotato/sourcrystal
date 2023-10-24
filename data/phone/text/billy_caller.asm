BillyResearchText:
	text "If I need to"
	line "battle you again"
	cont "for research,"

	para "I'll be sure to"
	line "call you!"
	done

BillyReminderText:
	text "Is that all"
	cont "right?"

	para "We're going to"
	line "battle again on"
	cont "@"
	text_from_ram wStringBuffer5
	text "!"

	para "Hurry up already!"
	done