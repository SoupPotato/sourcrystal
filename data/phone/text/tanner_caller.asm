TannerPreferCampingWithText:
	text "I always prefer to"
	line "camping with my"
	cont "@"
	text_ram wStringBuffer4 
	text "!"
	
	para "That's why it's so"
	line "strong!"
	done

TannerLostAMonText:
	text "That reminds me,"
	line "the other day we"

	para "had a wild"
	line "@"
	text_ram wStringBuffer4
	text " get"
	cont "away from us."

	para "It stings, but I"
	line "shouldn't let it"
	cont "get to me."
	done

TannerDefeatedMonText:
	text "That reminds me,"
	line "the other day we"

	para "knocked out a wild"
	line "@"
	text_ram wStringBuffer4
	text "!"

	para "You should've seen"
	line "it…"
	done

TannerBattleRematchText:
	text "Would you like to"
	line "battle again?"

	para "I'm on @"
	text_from_ram wStringBuffer5
	text ""
	line "so bring your best"
	cont "#MON!"
	done
