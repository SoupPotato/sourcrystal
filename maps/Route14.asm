	object_const_def
	const ROUTE_14_POKEFAN_M1
	const ROUTE_14_YOUNGSTER
	const ROUTE_14_POKEFAN_M2

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJamie:
	trainer BIRD_KEEPER, JAMIE1, EVENT_BEAT_BIRD_KEEPER_JAMIE, BirdKeeperJamieSeenText, BirdKeeperJamieBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_JAMIE
	opentext
	checkflag ENGINE_JAMIE_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkflag ENGINE_JAMIE_HAS_MOON_STONE
	iftrue .GiveMoonStone
	checkcellnum PHONE_BIRDKEEPER_JAMIE
	iftrue .JamieDefeated
	checkevent EVENT_JAMIE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext BirdKeeperJamieAfterBattleText
	waitbutton
	setevent EVENT_JAMIE_ASKED_FOR_PHONE_NUMBER
	scall Route14AskNumber1
	jump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall Route14AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_BIRDKEEPER_JAMIE
	ifequal PHONE_CONTACTS_FULL, Route14PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route14NumberDeclined
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JAMIE1
	scall Route14RegisteredNumber
	jump Route14NumberAccepted

.ChooseRematch:
	scall Route14Rematch
	winlosstext BirdKeeperJamieBeatenText, 0
	checkflag EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer BIRD_KEEPER, JAMIE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JAMIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, JAMIE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JAMIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, JAMIE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JAMIE_READY_FOR_REMATCH
	end

.GiveMoonStone:
	scall .Gift
	verbosegiveitem MOON_STONE
	iffalse .BagFull
	clearflag ENGINE_JAMIE_HAS_MOON_STONE
	setevent ENGINE_JAMIE_GAVE_MOON_STONE
	jump Route14NumberAccepted

.BagFull:
	jump .PackFull

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

.JamieDefeated:
	writetext BirdKeeperJamieAfterBattleText
	waitbutton
	closetext
	end

Route14AskNumber1:
	jumpstd AskNumber1MScript
	end

Route14AskNumber2:
	jumpstd AskNumber2MScript
	end

Route14RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

Route14NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

Route14NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

Route14PhoneFull:
	jumpstd PhoneFullMScript
	end

Route14Rematch:
	jumpstd RematchMScript
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherClarice:
	trainer TEACHER, CLARICE, EVENT_BEAT_TEACHER_CLARICE, TeacherClariceSeenText, TeacherClariceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherClariceAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyConnor:
	trainer SCHOOLBOY, CONNOR, EVENT_BEAT_SCHOOLBOY_CONNOR, SchoolboyConnorSeenText, SchoolboyConnorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyConnorAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTorin:
	trainer SCHOOLBOY, TORIN1, EVENT_BEAT_SCHOOLBOY_TORIN, SchoolboyTorinSeenText, SchoolboyTorinBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_TORIN
	opentext
	checkflag ENGINE_TORIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_SCHOOLBOY_TORIN
	iftrue .TorinDefeated
	checkevent EVENT_TORIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext SchoolboyTorinAfterBattleText
	waitbutton
	setevent EVENT_TORIN_ASKED_FOR_PHONE_NUMBER
	scall Route14AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route14AskNumber2
.AskForNumber:
	askforphonenumber PHONE_SCHOOLBOY_TORIN
	ifequal PHONE_CONTACTS_FULL, Route14PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route14NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, TORIN1
	scall Route14RegisteredNumber
	jump Route14NumberAccepted

.WantsBattle:
	scall Route14Rematch
	winlosstext SchoolboyTorinBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, TORIN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TORIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, TORIN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TORIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, TORIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TORIN_READY_FOR_REMATCH
	end

.TorinDefeated:
	writetext SchoolboyTorinAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTravis:
	trainer SCHOOLBOY, TRAVIS, EVENT_BEAT_SCHOOLBOY_TRAVIS, SchoolboyTravisSeenText, SchoolboyTravisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTravisAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "Let me tell you,"
	line "I had a hard time"

	para "catching my prized"
	line "#MON."
	done

PokefanmCarterBeatenText:
	text "Awaaah!"
	done

PokefanmCarterAfterBattleText:
	text "SQUIRTLE, CHARMAN-"
	line "DER and BULBASAUR…"

	para "I think that's a"
	line "well-balanced mix."
	done

BirdKeeperRoySeenText:
	text "My dream is to fly"
	line "with my beloved"
	cont "bird #MON."
	done

BirdKeeperRoyBeatenText:
	text "I can dream, but I"
	line "can't ever fly…"
	done

BirdKeeperRoyAfterBattleText:
	text "You have #MON"
	line "that know the HM"

	para "move FLY, don't"
	line "you? I envy you."
	done

BirdKeeperJamieSeenText:
	text "My weight puts me"
	line "in the feather-"
	cont "weight class!"

	para "…Huh? What do"
	line "mean that doesn't"
	cont "sound very strong?"
	done

BirdKeeperJamieBeatenText:
	text "I lost as lightly"
	line "as a feather"
	cont "floats!"
	done

BirdKeeperJamieAfterBattleText:
	text "Maybe I should"
	line "lie and say I'm"
	cont "in the heavyweight"
	cont "class…"
	done

TeacherClariceSeenText:
	text "All right, let's"
	line "get this #MON"
	cont "battle started!"
	done

TeacherClariceBeatenText:
	text "All right!"
	line "That concludes"
	cont "today's battle."
	done

TeacherClariceAfterBattleText:
	text "Don't relax just"
	line "'cause you won."

	para "Once you get home,"
	line "you should do a"
	cont "full review!"
	done

SchoolboyConnorSeenText:
	text "I can't wait to go"
	line "home and drop off"
	cont "my BAG!"
	done

SchoolboyConnorBeatenText:
	text "I was in too much"
	line "of a hurry."
	done

SchoolboyConnorAfterBattleText:
	text "Don't rush, and"
	line "take the road one"
	cont "step at a time."

	para "Great advice!"
	done

SchoolboyTorinSeenText:
	text "It's good to put"
	line "what you learn to"
	cont "use immediately!"
	done

SchoolboyTorinBeatenText:
	text "I see. I see."
	done

SchoolboyTorinAfterBattleText:
	text "All right!"
	line "Next time, I won't"
	cont "make any mistakes!"
	done

SchoolboyTravisSeenText:
	text "Do you have after-"
	line "school study"
	cont "sessions?"
	done

SchoolboyTravisBeatenText:
	text "So strong…"
	done

SchoolboyTravisAfterBattleText:
	text "Maybe I should"
	line "join your study"
	cont "sessions!"
	done

PokefanmTrevorSeenText:
	text "Hi. Did you know…?"

	para "#MON get more"
	line "friendly if you"

	para "train them in a"
	line "place that they"
	cont "remember."
	done

PokefanmTrevorBeatenText:
	text "Where did I meet"
	line "this PSYDUCK?"
	done

PokefanmTrevorAfterBattleText:
	text "If only there were"
	line "an easy way to"

	para "identify where I"
	line "got my #MON…"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event 15, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJamie, -1
	object_event  4, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyConnor, -1
	object_event  4, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyTorin, -1
	object_event  4, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyTravis, -1
	object_event  9, 13, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherClarice, -1
