	object_const_def
	const ROUTE_13_YOUNGSTER1
	const ROUTE_13_YOUNGSTER2
	const ROUTE_13_POKEFAN_M1
	const ROUTE_13_POKEFAN_M2
	const ROUTE_13_POKEFAN_M3
	const ROUTE_13_YOUNGSTER3
	const ROUTE_13_YOUNGSTER4
	const ROUTE_13_LASS1
	const ROUTE_13_LASS2
	const ROUTE_13_YOUNGSTER5
	const ROUTE_13_LASS3
	const ROUTE_13_BERRY

Route13_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route13Fruittree

Route13Fruittree:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_13_BERRY
	iftrue .NoBerry
	appear ROUTE_13_BERRY
.NoBerry:
	endcallback

TrainerCoupleTimandSue1:
	trainer COUPLE, TIMANDSUE1, EVENT_BEAT_COUPLE_TIMANDSUE, CoupleTimandSueSeenText, CoupleTimandSueBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COUPLE_TIM_AND_SUE
	opentext
	checkflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	iftrue TimAndSueWantsBattle
	checkcellnum PHONE_COUPLE_TIM_AND_SUE
	iftrue TimAndSue1Defeated
	checkevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
	iftrue TimAndSueAskedBefore
	writetext CoupleTimandSueAfterBattleText1
	waitbutton
	setevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
	scall TimAndSueAskNumber1
	jump TimAndSueAskForNumber

TimAndSueAskedBefore:
	scall TimAndSueAskNumber2
TimAndSueAskForNumber:
	askforphonenumber PHONE_COUPLE_TIM_AND_SUE
	ifequal PHONE_CONTACTS_FULL, TimAndSuePhoneFull
	ifequal PHONE_CONTACT_REFUSED, TimAndSueNumberDeclined
	gettrainername STRING_BUFFER_3, COUPLE, TIMANDSUE1
	scall TimAndSueRegisteredNumber
	jump TimAndSueNumberAccepted

TimAndSueWantsBattle:
	scall TimAndSueRematch
	winlosstext CoupleTimandSueBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue TimAndSueLoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue TimAndSueLoadFight1
	loadtrainer COUPLE, TIMANDSUE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	end

TrainerCoupleTimandSue2:
	trainer COUPLE, TIMANDSUE1, EVENT_BEAT_COUPLE_TIMANDSUE, CoupleTimandSueSeenText, CoupleTimandSueBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COUPLE_TIM_AND_SUE
	opentext
	checkflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	iftrue TimAndSueWantsBattle
	checkcellnum PHONE_COUPLE_TIM_AND_SUE
	iftrue TimAndSue2Defeated
	checkevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
	iftrue TimAndSueAskedBefore
	writetext CoupleTimandSueAfterBattleText2
	waitbutton
	setevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
	scall TimAndSueAskNumber1
	jump TimAndSueAskForNumber

TimAndSueLoadFight1:
	loadtrainer COUPLE, TIMANDSUE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	end

TimAndSueLoadFight2:
	loadtrainer COUPLE, TIMANDSUE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIM_AND_SUE_READY_FOR_REMATCH
	end

TimAndSue1Defeated:
	writetext CoupleTimandSueAfterBattleText1
	waitbutton
	closetext
	end

TimAndSue2Defeated:
	writetext CoupleTimandSueAfterBattleText2
	waitbutton
	closetext
	end

TimAndSueAskNumber1:
	jumpstd AskNumber1FScript
	end

TimAndSueAskNumber2:
	jumpstd AskNumber2FScript
	end

TimAndSueRegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

TimAndSueNumberAccepted:
	jumpstd NumberAcceptedFScript
	end

TimAndSueNumberDeclined:
	jumpstd NumberDeclinedFScript
	end

TimAndSuePhoneFull:
	jumpstd PhoneFullFScript
	end

TimAndSueRematch:
	jumpstd RematchFScript
	end

TrainerPicnickerPiper:
	trainer PICNICKER, PIPER, EVENT_BEAT_PICNICKER_PIPER, PicnickerPiperSeenText, PicnickerPiperBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerPiperAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerGinger:
	trainer PICNICKER, GINGER, EVENT_BEAT_PICNICKER_GINGER, PicnickerGingerSeenText, PicnickerGingerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerGingerAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperTanner:
	trainer CAMPER, TANNER1, EVENT_BEAT_CAMPER_TANNER, CamperTannerSeenText, CamperTannerBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_CAMPER_TANNER
	opentext
	checkflag ENGINE_TANNER_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkflag ENGINE_TANNER_HAS_SUN_STONE
	iftrue .GiveSunStone
	checkcellnum PHONE_CAMPER_TANNER
	iftrue .TannerDefeated
	checkevent EVENT_TANNER_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext CamperTannerAfterBattleText
	waitbutton
	setevent EVENT_TANNER_ASKED_FOR_PHONE_NUMBER
	scall Route13AskNumber1
	jump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall Route13AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_CAMPER_TANNER
	ifequal PHONE_CONTACTS_FULL, Route13PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route13NumberDeclined
	gettrainername STRING_BUFFER_3, CAMPER, TANNER1
	scall Route13RegisteredNumber
	jump Route13NumberAccepted

.ChooseRematch:
	scall Route13Rematch
	winlosstext CamperTannerBeatenText, 0
	checkflag EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer CAMPER, TANNER1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TANNER_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer CAMPER, TANNER2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TANNER_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer CAMPER, TANNER3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TANNER_READY_FOR_REMATCH
	end

.GiveSunStone:
	scall .Gift
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearflag ENGINE_TANNER_HAS_SUN_STONE
	setevent ENGINE_TANNER_GAVE_SUN_STONE
	jump Route13NumberAccepted

.BagFull:
	jump .PackFull

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

.TannerDefeated:
	writetext CamperTannerAfterBattleText
	waitbutton
	closetext
	end

Route13AskNumber1:
	jumpstd AskNumber1MScript
	end

Route13AskNumber2:
	jumpstd AskNumber2MScript
	end

Route13RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

Route13NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

Route13NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

Route13PhoneFull:
	jumpstd PhoneFullMScript
	end

Route13Rematch:
	jumpstd RematchMScript
	end

TrainerCamperClark:
	trainer CAMPER, CLARK, EVENT_BEAT_CAMPER_CLARK, CamperClarkSeenText, CamperClarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperClarkAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY1, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_KENNY
	opentext
	checkflag ENGINE_KENNY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_HIKER_KENNY
	iftrue .KennyDefeated
	checkevent EVENT_KENNY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext HikerKennyAfterBattleText
	waitbutton
	setevent EVENT_KENNY_ASKED_FOR_PHONE_NUMBER
	scall Route13AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route13AskNumber2
.AskForNumber:
	askforphonenumber PHONE_HIKER_KENNY
	ifequal PHONE_CONTACTS_FULL, Route13PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route13NumberDeclined
	gettrainername STRING_BUFFER_3, HIKER, KENNY1
	scall Route13RegisteredNumber
	jump Route13NumberAccepted

.WantsBattle:
	scall Route13Rematch
	winlosstext HikerKennyBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer HIKER, KENNY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_KENNY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, KENNY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_KENNY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, KENNY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_KENNY_READY_FOR_REMATCH
	end

.KennyDefeated:
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

Route13BerryTree:
	opentext
	getitemname STRING_BUFFER_3, SITRUS_BERRY
	writetext Route13BerryTreeText
	promptbutton
	writetext Route13HeyItsBerryText
	promptbutton
	giveitem SITRUS_BERRY
	iffalse Route13NoRoomInBag
	disappear ROUTE_13_BERRY
	setflag ENGINE_DAILY_ROUTE_13_BERRY
	writetext Route13FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route13NoBerry:
	opentext
	writetext Route13BerryTreeText
	promptbutton
	writetext Route13NothingHereText
	waitbutton
	closetext
	end

Route13NoRoomInBag:
	writetext Route13NoRoomInBagText
	waitbutton
	closetext
	end

PicnickerPiperSeenText:
	text "Hey, hey, how"
	line "about we bring out"

	para "your #MON and"
	line "mine for a battle?"
	done

PicnickerPiperBeatenText:
	text "Oh, that's"
	line "too bad…"
	done

PicnickerPiperAfterBattleText:
	text "The way you were"
	line "walking with your"

	para "#MON made me"
	line "think that I could"
	cont "win."
	done

PicnickerGingerSeenText:
	text "Why is it I always"
	line "get the urge to"

	para "whistle when"
	line "walking through"
	cont "nature?"
	done

PicnickerGingerBeatenText:
	text "Tweeee!"
	done

PicnickerGingerAfterBattleText:
	text "Instead of comm-"
	line "unicating with"
	cont "#MON with"
	cont "words,"

	para "you can comm-"
	line "unicate with them"
	cont "through whistling!"
	done

CoupleTimandSueSeenText:
	text "TIM: I'll give you"
	line "a little hint."

	para "Don't you think my"
	line "girlfriend's much"

	para "stronger than"
	line "I am?"

	para "SUE: Women who"
	line "don't take love"

	para "seriously and who"
	line "are reckless might"
	cont "get hurt."
	done

CoupleTimandSueBeatenText:
	text "TIM: You're the"
	line "strongest!"

	para "SUE: Wa ha…"
	done

CoupleTimandSueAfterBattleText1:
	text "TIM: If you've"
	line "beaten her, you"
	cont "must be strong!"
	done

CoupleTimandSueAfterBattleText2:
	text "SUE: That strength"
	line "of yours…"

	para "I've got it!"
	line "Are you in love?"
	done

CamperTannerSeenText:
	text "I can fit in a"
	line "quick battle while"

	para "I'm in the midst"
	line "of preparing a"
	cont "meal!"
	done

CamperTannerBeatenText:
	text "Oh, I'm hungry…"
	done

CamperTannerAfterBattleText:
	text "I figured it would"
	line "be easy to knock"
	cont "you out…"
	done

CamperClarkSeenText:
	text "Collect water!"
	line "Don't let the fire"
	cont "go out!"

	para "Look out for wild"
	line "#MON!"

	para "Let's go,"
	line "Campfire!"
	done

CamperClarkBeatenText:
	text "Pfuuuuhh…"
	done

CamperClarkAfterBattleText:
	text "It doesn't matter"
	line "what kind of prep-"
	cont "aration you've"
	cont "done."

	para "If you lose,"
	line "you lose."
	done

PokefanmAlexSeenText:
	text "Bow down before my"
	line "regal #MON!"
	done

PokefanmAlexBeatenText:
	text "How… How dare you"
	line "mock royalty!"
	done

PokefanmAlexAfterBattleText:
	text "Doesn't everyone"
	line "wish to someday be"
	cont "a king?"
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Would you"
	line "like to battle my"
	cont "PIKACHU gang?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "You look like you"
	line "have many #MON,"

	para "but PIKACHU is"
	line "still the best."
	done

BirdKeeperPerrySeenText:
	text "Agility is the key"
	line "attribute of bird"
	cont "#MON."
	done

BirdKeeperPerryBeatenText:
	text "You beat me with"
	line "your speed…"
	done

BirdKeeperPerryAfterBattleText:
	text "Your #MON are"
	line "remarkably well-"
	cont "trained."
	done

BirdKeeperBretSeenText:
	text "Check out my #-"
	line "MON. Just look at"

	para "their coloring and"
	line "their plumage."
	done

BirdKeeperBretBeatenText:
	text "Shoot!"
	line "Not good enough!"
	done

BirdKeeperBretAfterBattleText:
	text "If you groom them,"
	line "#MON get happy."
	done

HikerKennySeenText:
	text "I should go to"
	line "ROCK TUNNEL to get"
	cont "myself an ONIX."
	done

HikerKennyBeatenText:
	text "I lost…"
	done

HikerKennyAfterBattleText:
	text "Geological fea-"
	line "tures don't appear"
	cont "to change."

	para "But they actually"
	line "change, little by"
	cont "little."
	done

Route13TrainerTipsText:
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13SignText:
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done

Route13DirectionsSignText:
	text "NORTH TO LAVENDER"
	line "TOWN"

	para "WEST TO FUCHSIA"
	line "CITY"
	done

Route13BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route13NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route13HeyItsBerryText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route13FoundItemText:
	text_far _FoundItemText
	text_end

Route13NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 51, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 36, 13, BGEVENT_ITEM, Route13HiddenCalcium
	bg_event 63,  3, BGEVENT_READ, Route13NoBerry

	def_object_events
	object_event 63, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPerry, -1
	object_event 70,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 47,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmJoshua, -1
	object_event  6, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 35,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmAlex, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTanner, -1
	object_event  5,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperClark, -1
	object_event 69, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerPiper, -1
	object_event 16,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerGinger, -1
	object_event 52,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleTimandSue1, -1
	object_event 53,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleTimandSue2, -1
	object_event 63,  3, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, Route13BerryTree, EVENT_ROUTE_13_BERRY
