	const_def 2 ; object constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route21HiddenStarDust1:
	hiddenitem STARDUST, EVENT_ROUTE21_HIDDEN_STARDUST1
	
Route21HiddenStarDust2:
	hiddenitem STARDUST, EVENT_ROUTE21_HIDDEN_STARDUST2
	
Route21HiddenStarDust3:
	hiddenitem STARDUST, EVENT_ROUTE21_HIDDEN_STARDUST3

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermEsteban:
	trainer SWIMMERM, ESTEBAN, EVENT_BEAT_SWIMMERM_ESTEBAN, SwimmermEstebanSeenText, SwimmermEstebanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermEstebanAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermDuane:
	trainer SWIMMERM, DUANE, EVENT_BEAT_SWIMMERM_DUANE, SwimmermDuaneSeenText, SwimmermDuaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermDuaneAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmerfChelan:
	trainer SWIMMERF, CHELAN, EVENT_BEAT_SWIMMERF_CHELAN, SwimmerfChelanSeenText, SwimmerfChelanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfChelanAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKaidyn:
	trainer SWIMMERF, KAIDYN, EVENT_BEAT_SWIMMERF_KAIDYN, SwimmerfKaidynSeenText, SwimmerfKaidynBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaidynAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherMurphy:
	trainer FISHER, MURPHY, EVENT_BEAT_FISHER_MURPHY, FisherMurphySeenText, FisherMurphyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMurphyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherLiam:
	trainer FISHER, LIAM, EVENT_BEAT_FISHER_LIAM, FisherLiamSeenText, FisherLiamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherLiamAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherGideon:
	trainer FISHER, GIDEON, EVENT_BEAT_FISHER_GIDEON, FisherGideonSeenText, FisherGideonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherGideonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBirdkeeperKinsley:
	trainer BIRD_KEEPER, KINSLEY, EVENT_BEAT_BIRD_KEEPER_KINSLEY, BirdkeeperKinsleySeenText, BirdkeeperKinsleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperKinsleyAfterBattleText
	waitbutton
	closetext
	end	
	
TrainerBirdkeeperEaston:
	trainer BIRD_KEEPER, EASTON, EVENT_BEAT_BIRD_KEEPER_EASTON, BirdkeeperEastonSeenText, BirdkeeperEastonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperEastonAfterBattleText
	waitbutton
	closetext
	end	

SwimmermSethSeenText:
	text "Land ho! Gotta"
	line "keep going!"
	done

SwimmermSethBeatenText:
	text "Glug…"
	done

SwimmermSethAfterBattleText:
	text "This arrogant guy"
	line "was at CINNABAR's"
	cont "volcano."
	done
	
SwimmermEstebanSeenText:
	text "The teacher from"
	line "swimming class"
	
	para "where I learned"
	line "to swim had a"
	
	para "face just like"
	line "a POLIWHIRL."
	done

SwimmermEstebanBeatenText:
	text "I'm sorry,"
	line "Teacher…"
	done

SwimmermEstebanAfterBattleText:
	text "Due to the incre-"
	line "dible resemblance,"
	
	para "we called"
	line "our teacher "
	cont "PROF. POLIWHIRL!"
	done
	
SwimmermDuaneSeenText:
	text "Swimming is"
	line "a full-body"
	cont "exercise,"
	
	para "so it's really"
	line "good for building"
	cont "strength!"
	done

SwimmermDuaneBeatenText:
	text "My #MON"
	line "and I have no"
	cont "body strength…"
	done

SwimmermDuaneAfterBattleText:
	text "To win more,"
	line "I need to work"
	cont "on my stamina!"
	done

SwimmerfNikkiSeenText:
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "sunburn…"
	done

SwimmerfNikkiAfterBattleText:
	text "I have to watch"
	line "out for blemishes"
	cont "caused by the sun."
	done
	
SwimmerfChelanSeenText:
	text "I love bikinis!"
	
	para "If I had an"
	line "electric bikini,"
	
	para "I could wear it"
	line "even in winter!"
	done

SwimmerfChelanBeatenText:
	text "Awww…"
	done

SwimmerfChelanAfterBattleText:
	text "I suppose if you"
	line "tried to swim"
	
	para "in an electric"
	line "bikini, you'd"
	cont "get a shock!"
	done
	
SwimmerfKaidynSeenText:
	text "Hey, Trainer!"
	line "How about you put"
	
	para "on a swimsuit,"
	line "too!"
	done

SwimmerfKaidynBeatenText:
	text "I didn't want to"
	line "lose…"
	done

SwimmerfKaidynAfterBattleText:
	text "I wonder if"
	line "there's a place"
	
	para "that sells swim-"
	line "suits that suit"
	cont "my #MON?"
	done

FisherArnoldSeenText:
	text "I'm bored by fish-"
	line "ing. Let's battle!"
	done

FisherArnoldBeatenText:
	text "Utter failure…"
	done

FisherArnoldAfterBattleText:
	text "I'll just go back"
	line "to fishing…"
	done
	
FisherMurphySeenText:
	text "Huh? I've caught"
	line "a Trainer instead"
	cont "of a #MON!"
	done

FisherMurphyBeatenText:
	text "My fishing line"
	line "got cut!"
	done

FisherMurphyAfterBattleText:
	text "It's said that the"
	line "#MON that"
	cont "escaped were huge."
	
	para "It's the truth!"
	done
	
FisherLiamSeenText:
	text "Whoa! A nibble!"
	
	para "…Huh?"
	line "A battle?"
	
	para "OK, let's go!"
	done

FisherLiamBeatenText:
	text "If you try to"
	line "chase two #MON,"
	
	para "you won't catch"
	line "either one!"
	done

FisherLiamAfterBattleText:
	text "I should've asked"
	line "you to wait until"
	
	para "I reeled that"
	line "#MON in…"
	done
	
FisherGideonSeenText:
	text "Question is…"
	line "did I become a"
	
	para "fisherman because"
	line "I'm patient,"
	
	para "or did I get more"
	line "patient because"
	cont "I'm a fisherman?"
	done

FisherGideonBeatenText:
	text "Ummm… Hmmm…"
	done

FisherGideonAfterBattleText:
	text "What's the reason"
	line "you became a"
	cont "#MON Trainer?"
	done
	
BirdkeeperKinsleySeenText:
	text "Surrounding your-"
	line "self with bird"
	
	para "#MON gives you"
	line "the feeling that"
	
	para "someday you might"
	line "be able to fly,"
	cont "too!"
	done

BirdkeeperKinsleyBeatenText:
	text "I couldn't fly…"
	done

BirdkeeperKinsleyAfterBattleText:
	text "I guess I just"
	line "need to practice"
	
	para "flapping my wings"
	line "more!"
	done
	
BirdkeeperEastonSeenText:
	text "Bird Keepers are"
	line "so wonderful with"
	
	para "their bird"
	line "#MON!"
	done

BirdkeeperEastonBeatenText:
	text "I couldn't handle"
	line "it…"
	done

BirdkeeperEastonAfterBattleText:
	text "We Bird Keepers"
	line "think we're using"
	cont "bird #MON."
	
	para "But somewhere"
	line "along the line,"
	
	para "bird #MON"
	line "started using"
	cont "us…"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 3 ; bg events
	bg_event 12, 19, BGEVENT_ITEM, Route21HiddenStarDust1
	bg_event 15, 34, BGEVENT_ITEM, Route21HiddenStarDust2
	bg_event  8, 36, BGEVENT_ITEM, Route21HiddenStarDust3

	db 12 ; object events
	object_event  8, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  6, 31, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfChelan, -1
	object_event 16, 58, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfKaidyn, -1
	object_event 12, 40, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 10, 50, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermEsteban, -1
	object_event 16, 49, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermDuane, -1
	object_event 13, 20, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
	object_event  5, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMurphy, -1
	object_event  6, 40, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherLiam, -1
	object_event  8, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherGideon, -1
	object_event  6, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdkeeperKinsley, -1
	object_event  4, 54, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdkeeperEaston, -1
