	const_def 2 ; object constants
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_BERRY
	const ROUTE39_APRICORN
	const ROUTE39_POKEFAN_F2
	const ROUTE39_GENTLEMAN_BOBOA

Route39_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE_39_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE_39_BOBOA_GONE


	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Fruittrees

.DummyScene0:
	end

.DummyScene1:
	end

.Fruittrees
.Berry:
	checkflag ENGINE_DAILY_ROUTE39_BERRY
	iftrue .NoBerry
	appear ROUTE39_BERRY
.NoBerry:
	;return

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE39_APRICORN
	iftrue .NoApricorn
	appear ROUTE39_APRICORN
.NoApricorn:
	return

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_POKEFANM_DEREK
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	buttonsound
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext POKEFANM, DEREK, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	jump .NumberAccepted

.NoRoom:
	jump .PackFull

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39BerryTree:
	opentext
	writetext Route39BerryTreeText
	buttonsound
	writetext Route39HeyItsBerryText
	buttonsound
	verbosegiveitem CHESTO_BERRY
	iffalse .NoRoomInBag
	disappear ROUTE39_BERRY
	setflag ENGINE_DAILY_ROUTE39_BERRY
.NoRoomInBag
	closetext
	end

Route39ApricornTree:
	opentext
	writetext Route39ApricornTreeText
	buttonsound
	writetext Route39HeyItsApricornText
	buttonsound
	verbosegiveitem GRN_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE39_APRICORN
	setflag ENGINE_DAILY_ROUTE39_APRICORN
.NoRoomInBag
	closetext
	end

Route39NoBerry:
	opentext
	writetext Route39BerryTreeText
	buttonsound
	writetext Route39NothingHereText
	waitbutton
	closetext
	end

Route39NoApricorn:
	opentext
	writetext Route39ApricornTreeText
	buttonsound
	writetext Route39NothingHereText
	waitbutton
	closetext
	end

Route39Baoba1:
	turnobject ROUTE39_GENTLEMAN_BOBOA, RIGHT
	showemote EMOTE_SHOCK, ROUTE39_GENTLEMAN_BOBOA, 15
	applymovement ROUTE39_GENTLEMAN_BOBOA, MovementData_Route39_Baoba_Approach1
	jump Route39BaobaScript

Route39Baoba2:
	turnobject ROUTE39_GENTLEMAN_BOBOA, RIGHT
	showemote EMOTE_SHOCK, ROUTE39_GENTLEMAN_BOBOA, 15
	applymovement ROUTE39_GENTLEMAN_BOBOA, MovementData_Route39_Baoba_Approach2
	jump Route39BaobaScript

Route39Baoba3:
	turnobject ROUTE39_GENTLEMAN_BOBOA, RIGHT
	showemote EMOTE_SHOCK, ROUTE39_GENTLEMAN_BOBOA, 15
	applymovement ROUTE39_GENTLEMAN_BOBOA, MovementData_Route39_Baoba_Approach3
	jump Route39BaobaScript

Route39Baoba4:
	turnobject ROUTE39_GENTLEMAN_BOBOA, RIGHT
	showemote EMOTE_SHOCK, ROUTE39_GENTLEMAN_BOBOA, 15
	applymovement ROUTE39_GENTLEMAN_BOBOA, MovementData_Route39_Baoba_Approach4
	jump Route39BaobaScript

Route39BaobaScript:
	opentext
	writetext Route39BaobaIntroText
	waitbutton
	verbosegiveitem EXP_SHARE
	writetext Route39BaobaLeavingText
	waitbutton
	closetext
	setevent EVENT_ROUTE39_BAOBA_GAVE_EXP_SHARE
	setscene SCENE_ROUTE_39_BAOBA_GONE
	applymovement ROUTE39_GENTLEMAN_BOBOA, MovementData_Route39_Baoba_Leaves
	disappear ROUTE39_GENTLEMAN_BOBOA
	end

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Mooo!"
	done

SailorEugeneSeenText:
	text "I just got back to"
	line "OLIVINE."

	para "So how about a"
	line "#MON battle?"
	done

SailorEugeneBeatenText:
	text "Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "My #MON were"
	line "caught and raised"
	cont "overseas."

	para "They're my compan-"
	line "ions on those long"
	cont "voyages."
	done

PokefanmDerekSeenText:
	text "This is a good"
	line "time to brag about"
	cont "my PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "I had no time to"
	line "show off PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "I'm not listening"
	line "to your bragging!"

	para "We # FANS have"
	line "a policy of not"

	para "listening to other"
	line "people brag!"
	done

PokefanfRuthSeenText:
	text "Such darling"
	line "#MON."

	para "Let's show our"
	line "#MON together"
	cont "at the same time."
	done

PokefanfRuthBeatenText:
	text "I don't mind"
	line "losing."
	done

PokefanfRuthAfterBattleText:
	text "Do you know about"
	line "baby #MON?"

	para "I bet they're just"
	line "adorable!"
	done

PsychicNormanSeenText:
	text "Let me see what"
	line "your #MON are"
	cont "capable of."
	done

PsychicNormanBeatenText:
	text "Ooh, your #MON"
	line "have potential."
	done

PsychicNormanAfterBattleText:
	text "You know how #-"
	line "MON have different"
	cont "abilities?"

	para "People are like"
	line "that too. Every-"
	cont "one has different"
	cont "potential."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufufufu… I hope it"
	line "gets dark soon."
	done

PokefanfJaimeSeenText:
	text "You came at just"
	line "the right time."

	para "Let's battle."
	done

PokefanfJaimeBeatenText:
	text "Oh, how disap-"
	line "pointing…"
	done

PokefanfJaimeAfterBattleText:
	text "I met my MEOWTH at"
	line "night, right here"
	cont "on ROUTE 39."

	para "I'm not sure why,"
	line "but it seems to"

	para "like it when I"
	line "train here."

	para "It seems to become"
	line "friendlier by"

	para "training here than"
	line "anywhere else."
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

MoomooFarmSignText:
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "TRAINER TIPS"

	para "Use HEADBUTT on"
	line "trees to shake"
	cont "#MON out."

	para "Different kinds of"
	line "#MON drop out"
	cont "of trees."

	para "Use HEADBUTT on"
	line "any tree you see!"
	done

Route39BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route39HeyItsBerryText:
	text "Hey! It's"
	line "CHESTO BERRY!"
	done

Route39ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route39HeyItsApricornText:
	text "Hey! It's"
	line "GRN APRICORN!"
	done

Route39NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route39BaobaIntroText:
	text "BAOBA: …Ohh!"

	para "Is that a #DEX?"

	para "I haven't seen one"
	line "of those in ages."

	para "My name is BAOBA!"

	para "I run a SAFARI"
	line "ZONE just beyond"
	cont "CIANWOOD CITY."

	para "I'm sure a young"
	line "trainer such as"

	para "yourself would be"
	line "quite interested"

	para "in the rare and"
	line "exotic #MON"
	cont "found there."

	para "I certainly hope"
	line "you will consider"
	cont "taking a look."
	
	para "Anyway, I had"
	line "better get back."

	para "Please take this"
	line "as a token of our"
	cont "meeting…"
	done

Route39BaobaLeavingText:
	text "Remember, the"
	line "SAFARI ZONE is"

	para "west beyond"
	line "CIANWOOD CITY."

	para "Best of luck to"
	line "you!"
	done

MovementData_Route39_Baoba_Approach1:
	step_up
MovementData_Route39_Baoba_Approach2:
	step_right
	step_right
	step_end

MovementData_Route39_Baoba_Approach4:
	step_down
MovementData_Route39_Baoba_Approach3:
	step_down
	step_right
	step_right
	step_end

MovementData_Route39_Baoba_Leaves:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route39_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	db 4 ; coord events
	coord_event 16,  8, SCENE_DEFAULT, Route39Baoba1
	coord_event 16,  9, SCENE_DEFAULT, Route39Baoba2
	coord_event 16, 10, SCENE_DEFAULT, Route39Baoba3
	coord_event 16, 11, SCENE_DEFAULT, Route39Baoba4

	db 6 ; bg events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget
	bg_event  6, 13, BGEVENT_READ, Route39NoBerry
	bg_event  9,  3, BGEVENT_READ, Route39NoApricorn

	db 12 ; object events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 14, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  6, 13, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route39BerryTree, EVENT_ROUTE39_BERRY
	object_event  9,  3, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39ApricornTree, EVENT_ROUTE39_APRICORN
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event 13,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE39_BAOBA_GAVE_EXP_SHARE
