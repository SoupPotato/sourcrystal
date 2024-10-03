	object_const_def
	const VIRIDIAN_FOREST_POKE_BALL1
	const VIRIDIAN_FOREST_POKE_BALL2
	const VIRIDIAN_FOREST_POKE_BALL3
	const VIRIDIAN_FOREST_BERRY
	const VIRIDIAN_FOREST_APRICORN
	const VIRIDIAN_FOREST_BUG_CATCHER1
	const VIRIDIAN_FOREST_BUG_CATCHER2
	const VIRIDIAN_FOREST_BUG_CATCHER3
	const VIRIDIAN_FOREST_BUG_CATCHER4
	const VIRIDIAN_FOREST_BUG_CATCHER5

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Fruittrees

.Fruittrees
.Berry:
	checkflag ENGINE_DAILY_VIRIDIAN_FOREST_BERRY
	iftrue .NoBerry
	appear VIRIDIAN_FOREST_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_VIRIDIAN_FOREST_APRICORN
	iftrue .NoApricorn
	appear VIRIDIAN_FOREST_APRICORN
.NoApricorn:
	endcallback

ViridianForestHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

ViridianForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

ViridianForestHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

ViridianForestBerryTree:
	opentext
	getitemname STRING_BUFFER_3, PECHA_BERRY
	writetext ViridianForestBerryTreeText
	promptbutton
	writetext ViridianForestHeyItsBerryApricornText
	promptbutton
	giveitem PECHA_BERRY
	iffalse ViridianForestNoRoomInBag
	disappear VIRIDIAN_FOREST_BERRY
	setflag ENGINE_DAILY_VIRIDIAN_FOREST_BERRY
	writetext ViridianForestFoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

ViridianForestApricornTree:
	opentext
	getitemname STRING_BUFFER_3, PNK_APRICORN
	writetext ViridianForestApricornTreeText
	promptbutton
	writetext ViridianForestHeyItsBerryApricornText
	promptbutton
	giveitem PNK_APRICORN
	iffalse ViridianForestNoRoomInBag
	disappear VIRIDIAN_FOREST_APRICORN
	setflag ENGINE_DAILY_VIRIDIAN_FOREST_APRICORN
	writetext ViridianForestFoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

ViridianForestNoBerry:
	opentext
	writetext ViridianForestBerryTreeText
	promptbutton
	writetext ViridianForestNothingHereText
	waitbutton
	closetext
	end

ViridianForestNoApricorn:
	opentext
	writetext ViridianForestApricornTreeText
	promptbutton
	writetext ViridianForestNothingHereText
	waitbutton
	closetext
	end

ViridianForestNoRoomInBag:
	writetext ViridianForestNoRoomInBagText
	waitbutton
	closetext
	end

ViridianForestMaxPotion:
	itemball MAX_POTION

ViridianForestLeafStone:
	itemball LEAF_STONE

ViridianForestMaxEther:
	itemball MAX_ETHER

ViridianForestHiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

TrainerBugCatcherAbner:
	trainer BUG_CATCHER, ABNER, EVENT_BEAT_BUG_CATCHER_ABNER, BugCatcherAbnerSeenText, BugCatcherAbnerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherAbnerAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherEllis:
	trainer BUG_CATCHER, ELLIS, EVENT_BEAT_BUG_CATCHER_ELLIS, BugCatcherEllisSeenText, BugCatcherEllisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEllisAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherStacey:
	trainer BUG_CATCHER, STACEY, EVENT_BEAT_BUG_CATCHER_STACEY, BugCatcherStaceySeenText, BugCatcherStaceyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherStaceyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDion:
	trainer BUG_CATCHER, DION, EVENT_BEAT_BUG_CATCHER_DION, BugCatcherDionSeenText, BugCatcherDionBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDionAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDane:
	trainer BUG_CATCHER, DANE, EVENT_BEAT_BUG_CATCHER_DANE, BugCatcherDaneSeenText, BugCatcherDaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDaneAfterBattleText
	waitbutton
	closetext
	end

BugCatcherAbnerSeenText:
	text "There are many"
	line "people out there"

	para "who prefer solid"
	line "Bug #MON over"
	cont "squishy Bug"
	cont "#MON."
	done

BugCatcherAbnerBeatenText:
	text "Thanks for your"
	line "hard work, my"
	cont "lovley #MON…"
	done

BugCatcherAbnerAfterBattleText:
	text "Doesn't matter what"
	line "kind of #MON--"

	para "as long as you"
	line "like them, they"
	cont "all look cute."
	done

BugCatcherEllisSeenText:
	text "I'm sure that"
	line "there's nothing"

	para "more efficient"
	line "and beautiful in"

	para "this world than a"
	line "Bug-type #MON."

	done

BugCatcherEllisBeatenText:
	text "I lost"
	line "beautifully!"
	done

BugCatcherEllisAfterBattleText:
	text "If this is it,"
	line "then I don't mind"
	cont "losing!"
	done

BugCatcherStaceySeenText:
	text "Wow, that's a"
	line "HUGE #MON!"

	para "…"
	line "…What kind of"
	cont "Trainer?!"
	done

BugCatcherStaceyBeatenText:
	text "I couldn't catch"
	line "it!"
	done

BugCatcherStaceyAfterBattleText:
	text "Has anyone ever"
	line "told you that from"
	cont "behind, you look"
	cont "like a VENONAT?"
	done

BugCatcherDionSeenText:
	text "Shh! Be quiet!"

	para "The Bug #MON"
	line "will run away!"

	done

BugCatcherDionBeatenText:
	text "Phew…"
	done

BugCatcherDionAfterBattleText:
	text "From Bug-type"
	line "#MON come the"

	para "sounds of munching"
	line "on grass,"

	para "walking on crunchy"
	line "leaves,"

	para "swimming in "
	line "puddles…"

	para "For Bug #MON"
	line "fans, knowing how"

	para "to distinguish"
	line "these sounds"
	cont "is key!"
	done

BugCatcherDaneSeenText:
	text "Welcome to "
	line "VIRIDAN FOREST."

	para "Enjoy my Bug-"
	line "type #MON!"
	done

BugCatcherDaneBeatenText:
	text "That's wonderful…"
	done

BugCatcherDaneAfterBattleText:
	text "Pretty impressive!"

	para "I'm sure you can"
	line "go anywhere with"
	cont "that skill!"
	done

ViridianForestBerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

ViridianForestApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

ViridianForestNothingHereText:
	text "There's nothing"
	line "here…"
	done

ViridianForestHeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ViridianForestFoundItemText:
	text_far _FoundItemText
	text_end

ViridianForestNoRoomInBagText:
	text_far _CantCarryItemText
	text_end

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  3, VIRIDIAN_FOREST_GATE_N, 3
	warp_event 16, 51, VIRIDIAN_FOREST_GATE_S, 1
	warp_event 17, 51, VIRIDIAN_FOREST_GATE_S, 2

	def_coord_events

	def_bg_events
	bg_event 17, 22, BGEVENT_ITEM, ViridianForestHiddenMaxEther
	bg_event 13,  6, BGEVENT_ITEM, ViridianForestHiddenFullHeal
	bg_event 10, 38, BGEVENT_ITEM, ViridianForestHiddenFullRestore
	bg_event 31, 46, BGEVENT_ITEM, ViridianForestHiddenRevive
	bg_event 17,  6, BGEVENT_READ, ViridianForestNoBerry
	bg_event 31,  6, BGEVENT_READ, ViridianForestNoApricorn

	def_object_events
	object_event 11, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestMaxPotion, EVENT_VIRIDIAN_FOREST_MAX_POTION
	object_event 25, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestMaxEther, EVENT_VIRIDIAN_FOREST_MAX_ETHER
	object_event  2, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestLeafStone, EVENT_VIRIDIAN_FOREST_LEAF_STONE
	object_event 17,  6, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ViridianForestBerryTree, EVENT_VIRIDIAN_FOREST_BERRY
	object_event 31,  6, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ViridianForestApricornTree, EVENT_VIRIDIAN_FOREST_APRICORN
	object_event  4, 26, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherAbner, -1
	object_event 25,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherEllis, -1
	object_event 28, 22, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherStacey, -1
	object_event 28, 37, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDion, -1
	object_event 19, 46, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherDane, -1
