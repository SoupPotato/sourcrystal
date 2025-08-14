	object_const_def
	const ROUTE_12_FISHER1
	const ROUTE_12_FISHER2
	const ROUTE_12_FISHER3
	const ROUTE_12_FISHER4
	const ROUTE_12_POKE_BALL1
	const ROUTE_12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE1, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_KYLE
	opentext
	checkflag ENGINE_KYLE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_FISHER_KYLE
	iftrue .KyleDefeated
	checkevent EVENT_KYLE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext FisherKyleAfterBattleText
	promptbutton
	setevent EVENT_KYLE_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_KYLE
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, KYLE1
	scall .RegisteredNumber
	jump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherKyleBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer FISHER, KYLE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_KYLE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, KYLE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_KYLE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, KYLE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_KYLE_READY_FOR_REMATCH
	end

.KyleDefeated:
	writetext FisherKyleAfterBattleText
	promptbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerFisherKyler:
	trainer FISHER, KYLER, EVENT_BEAT_FISHER_KYLER, FisherKylerSeenText, FisherKylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKylerAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJacob:
	trainer BIRD_KEEPER, JACOB, EVENT_BEAT_BIRD_KEEPER_JACOB, TrainerBirdKeeperJacobSeenText, TrainerBirdKeeperJacobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerBirdKeeperJacobAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperGail:
	trainer BIRD_KEEPER, GAIL, EVENT_BEAT_BIRD_KEEPER_GAIL, TrainerBirdKeeperGailSeenText, TrainerBirdKeeperGailBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerBirdKeeperGailAfterBattleText
	waitbutton
	closetext
	end

TrainerCoupleVicandTara1:
	trainer COUPLE, VICANDTARA, EVENT_BEAT_COUPLE_VICANDTARA, TrainerCoupleVicandTaraSeenText, TrainerCoupleVicandTaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerCoupleVicandTara1AfterBattleText
	waitbutton
	closetext
	end

TrainerCoupleVicandTara2:
	trainer COUPLE, VICANDTARA, EVENT_BEAT_COUPLE_VICANDTARA, TrainerCoupleVicandTaraSeenText, TrainerCoupleVicandTaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerCoupleVicandTara2AfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #MON."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "I'm too impatient"
	line "for fishing…"
	done

FisherStephenSeenText:
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done

FisherStephenBeatenText:
	text "My stupid radio"
	line "distracted me!"
	done

FisherStephenAfterBattleText:
	text "Have you checked"
	line "out KANTO's radio"

	para "programs? We get a"
	line "good variety here."
	done

FisherKyleSeenText:
	text "Do you remember?"
	done

FisherKyleBeatenText:
	text "You do remember?"
	done

FisherKyleAfterBattleText:
	text "The tug you feel"
	line "on the ROD when"

	para "you hook a #-"
	line "MON…"

	para "That's the best"
	line "feeling ever for"
	cont "an angler like me."
	done

FisherKylerSeenText:
	text "#MON battles"
	line "lure people in!"
	done

FisherKylerBeatenText:
	text "My #MON"
	line "bucket is empty!"
	done

FisherKylerAfterBattleText:
	text "Really? Rather"
	line "than always catch-"
	cont "ing new #MON,"
	cont "it's good to train"
	cont "them?"

	done

FisherBarneySeenText:
	text "What's most impor-"
	line "tant in our every-"
	cont "day lives?"
	done

FisherBarneyBeatenText:
	text "The answer is"
	line "coming up next!"
	done

FisherBarneyAfterBattleText:
	text "I think electric-"
	line "ity is the most"

	para "important thing in"
	line "our daily lives."

	para "If it weren't,"
	line "people wouldn't"

	para "have made such a"
	line "fuss when the"

	para "POWER PLANT went"
	line "out of commission."
	done

TrainerBirdKeeperJacobSeenText:
	text "Huh? The wind has"
	line "changed direction!"
	done

TrainerBirdKeeperJacobBeatenText:
	text "Phew…"
	done

TrainerBirdKeeperJacobAfterBattleText:
	text "Since the wind has"
	line "changed, I'll lay"
	cont "low…"
	done

TrainerBirdKeeperGailSeenText:
	text "BASABASABASABASA!"
	done

TrainerBirdKeeperGailBeatenText:
	text "Pyopyopyopyo…"
	done

TrainerBirdKeeperGailAfterBattleText:
	text "Chuun-Chuun?"
	line "Chunchun!"
	done

TrainerCoupleVicandTaraSeenText:
	text "VIC: All right!"
	line "I'll be able to"
	cont "show off for TARA!"

	para "TARA: I love to"
	line "look at my boy-"
	cont "friend's face in"
	cont "profile while he's"
	cont "battling!"
	done

TrainerCoupleVicandTaraBeatenText:
	text "VIC: Oh no,"
	line "my plans!"

	para "TARA: Oh no,"
	line "oh no…"
	done

TrainerCoupleVicandTara1AfterBattleText:
	text "VIC: TARA's"
	line "already seen me"
	cont "humiliated…"
	done

TrainerCoupleVicandTara2AfterBattleText:
	text "TARA: Even though"
	line "my boyfriend lost,"

	para "he's still"
	line "wonderful."
	done

Route12SignText:
	text "ROUTE 12"

	para "NORTH TO LAVENDER"
	line "TOWN"
	done

FishingSpotSignText:
	text "FISHING SPOT"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 77, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  2, 62, ROUTE_11_GATE, 3
	warp_event  2, 63, ROUTE_11_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15, 63, BGEVENT_READ, Route12Sign
	bg_event 17, 13, BGEVENT_READ, FishingSpotSign
	bg_event 18, 37, BGEVENT_ITEM, Route12HiddenElixer

	def_object_events
	object_event 18, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFisherMartin, -1
	object_event 18, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 17, 82, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherBarney, -1
	object_event 16, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event 14, 91, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherKyler, -1
	object_event 12, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperJacob, -1
	object_event 12, 77, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperGail, -1
	object_event 14, 59, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleVicandTara1, -1
	object_event 14, 58, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleVicandTara2, -1
	object_event  9, 87, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event 10, 102, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
