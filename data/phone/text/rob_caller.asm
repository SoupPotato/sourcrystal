RobDidYouCatchText:
	text "Did you catch any"
	line "PIDGEOTTO?"
	
	para "You can always"
	line "find them around"
	cont "here."
	done

RobMyMonWontLoseText:
	text "My @"
	text_ram wStringBuffer4 
	text " is"
	line "always training!"

	para "It won't lose to"
	line "any wild #MON"
	cont "around here!"
	done

RobLostAMonText:
	text "And listen!"

	para "This @"
	text_ram wStringBuffer4
	text " I"
	line "ran into earlier "
	cont "just ran away!"

	para "I really wanted to"
	line "catch it, too!"
	done

RobDefeatedMonText:
	text "And listen!"

	para "We took out a wild"
	line "@"
	text_ram wStringBuffer4
	text " the"
	cont "other day!"

	para "My BUG #MON are"
	line "really getting"
	cont "strong."
	done

RobBattleRematchText:
	text "Will you battle us"
	line "again?"

	para "We're on @"
	text_from_ram wStringBuffer5 
	text ","
	line "so give me a shout"

	para "when you're in the"
	line "area!"
	done
