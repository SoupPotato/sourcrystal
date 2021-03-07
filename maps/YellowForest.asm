	const_def 2 ; object constants
	const YELLOWFOREST_POKE_BALL1
	const YELLOWFOREST_POKE_BALL2
	const YELLOWFOREST_POKE_BALL3
	const YELLOWFOREST_POKE_BALL4
	const YELLOWFOREST_POKE_BALL5

YellowForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint
	
.Flypoint:
	setflag ENGINE_FLYPOINT_ROUTE_48
	return

YellowForestThunderStone:
	itemball THUNDERSTONE

YellowForestMiracleSeed:
	itemball MIRACLE_SEED

YellowForestUltraBall:
	itemball ULTRA_BALL

YellowForestLemonade:
	itemball LEMONADE

YellowForestSurfPikachuDoll:
	disappear YELLOWFOREST_POKE_BALL5
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	opentext
	writetext YellowForestSurfPikachuDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext YellowForestSurfPikachuDollSentText
	waitbutton
	closetext
	end

YellowForestHiddenBigMushroom1:
	hiddenitem BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM_1

YellowForestHiddenBigMushroom2:
	hiddenitem BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM_2

YellowForestHiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF

YellowForestHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_YELLOW_FOREST_HIDDEN_SILVER_LEAF

YellowForestSurfPikachuDollText:
	text "<PLAYER> found"
	line "SURF PIKACHU DOLL."
	done

YellowForestSurfPikachuDollSentText:
	text "SURF PIKACHU DOLL"
	line "was sent home."
	done

YellowForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 28, 45, YELLOW_FOREST_GATE, 1
	warp_event 29, 45, YELLOW_FOREST_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 39, 12, BGEVENT_ITEM, YellowForestHiddenBigMushroom1
	bg_event 34, 36, BGEVENT_ITEM, YellowForestHiddenBigMushroom2
	bg_event 32,  9, BGEVENT_ITEM, YellowForestHiddenGoldLeaf
	bg_event  9, 38, BGEVENT_ITEM, YellowForestHiddenSilverLeaf

	db 10 ; object events
	object_event 25, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestThunderStone, EVENT_YELLOW_FOREST_THUNDERSTONE
	object_event 32, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestMiracleSeed, EVENT_YELLOW_FOREST_MIRACLE_SEED
	object_event 11, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestUltraBall, EVENT_YELLOW_FOREST_ULTRA_BALL
	object_event 49, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, YellowForestLemonade, EVENT_YELLOW_FOREST_LEMONADE
	object_event 47,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YellowForestSurfPikachuDoll, EVENT_DECO_SURFING_PIKACHU_DOLL
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, YellowForestcooltrainerMScript, -1
	object_event 19, 39, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, GenericTrainerLassSarah, -1
	object_event 13, 31, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, GenericTrainerLassIsabel, -1
	object_event  4, 38, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, GenericTrainerTeacherKathryn, -1
	object_event 45, 37, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericTrainerCooltrainerSophie, -1

	
GenericTrainerLassSarah:
	trainer LASS, SARAH, EVENT_BEAT_LASS_SARAH, LassSarahSeenText, LassSarahBeatenText, 0, .Script	
	
.Script:
	endifjustbattled
	opentext
	writetext LassSarahAfterBattleText
	waitbutton
	closetext
	end
	
LassSarahAfterBattleText:
	text "If we were at my"
	line "school, I'd have"
	cont "beaten you!"
	done
	
LassSarahSeenText:
	text "Ooh, a trainer!"
	line "I want to battle!"
	done

LassSarahBeatenText:
	text "Sniff…"
	line "You made me lose!"
	done

GenericTrainerLassIsabel:
	trainer LASS, ISABEL, EVENT_BEAT_LASS_ISABEL, LassIsabelSeenText, LassIsabelBeatenText, 0, .Script	
	
.Script:
	endifjustbattled
	opentext
	writetext LassIsabelAfterBattleText
	waitbutton
	closetext
	end

LassIsabelAfterBattleText:
	text "We're learning"
	line "about how #MON"

	para "thrive together"
	line "in the wild."
	done
	
LassIsabelSeenText:
	text "Do you have cute"
	line "#MON like the"
	cont "ones here?"
	done
	
LassIsabelBeatenText:
	text "You have really"
	line "strong #MON!"
	done

GenericTrainerTeacherKathryn:
	trainer TEACHER, KATHRYN, EVENT_BEAT_TEACHER_KATHRYN, TeacherKathrynSeenText, TeacherKathrynBeatenText, 0, .Script	
	
.Script:
	endifjustbattled
	opentext
	writetext TeacherKathrynAfterBattleText
	waitbutton
	closetext
	end

TeacherKathrynAfterBattleText:
	text "Keeping an eye on"
	line "everyone during a"

	para "field trip is"
	line "hard work."
	done
	
TeacherKathrynSeenText:
	text "You there!"
	line "You're a trainer?"

	para "You had better not"
	line "make my students"
	cont "cry!"
	done
	
TeacherKathrynBeatenText:
	text "I won't let this"
	line "make me cry…"
	done

GenericTrainerCooltrainerSophie:
	trainer COOLTRAINERF, SOPHIE, EVENT_BEAT_COOLTRAINER_SOPHIE, CooltrainerSophieSeenText, CooltrainerSophieBeatenText, 0, .Script	
	
.Script:
	endifjustbattled
	opentext
	writetext CooltrainerSophieAfterBattleText
	waitbutton
	closetext
	end

CooltrainerSophieAfterBattleText:
	text "Sometimes PIKACHU"
	line "use their electric"

	para "shocks to revive"
	line "fainted ones."

	para "That's just the"
	line "cutest!"
	done
	
CooltrainerSophieSeenText:
	text "Did you know that"
	line "PIKACHU is an"
	cont "evolved #MON?"
	done

CooltrainerSophieBeatenText:
	text "I thought so!"
	done

YellowForestcooltrainerMScript:
	jumptextfaceplayer YellowForestcooltrainerMText
	
YellowForestcooltrainerMText:
	text "There's a protein"
	line "in your body"
	cont "called Pikachurin."

	para "What inspired that"
	line "name?"

	para "PIKACHU, of"
	line "course!"
	done