	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20ClearRocksCallback

Route20ClearRocksCallback:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMina:
	trainer SWIMMERF, MINA, EVENT_BEAT_SWIMMERF_MINA, SwimmerfMinaSeenText, SwimmerfMinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMinaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLeona:
	trainer SWIMMERF, LEONA, EVENT_BEAT_SWIMMERF_LEONA, SwimmerfLeonaSeenText, SwimmerfLeonaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLeonaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdkeeperBert:
	trainer BIRD_KEEPER, BERT, EVENT_BEAT_BIRD_KEEPER_BERT, BirdkeeperBertSeenText, BirdkeeperBertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperBertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdkeeperErnie:
	trainer BIRD_KEEPER, ERNIE, EVENT_BEAT_BIRD_KEEPER_ERNIE, BirdkeeperErnieSeenText, BirdkeeperErnieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperErnieAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerChel:
	trainer PICNICKER, CHEL, EVENT_BEAT_PICNICKER_CHEL, PicnickerChelSeenText, PicnickerChelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerChelAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerAdrian:
	trainer PICNICKER, ADRIAN, EVENT_BEAT_PICNICKER_ADRIAN, PicnickerAdrianSeenText, PicnickerAdrianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerAdrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperPedro:
	trainer CAMPER, PEDRO, EVENT_BEAT_CAMPER_PEDRO, CamperPedroSeenText, CamperPedroBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperPedroAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermLuis:
	trainer SWIMMERM, LUIS, EVENT_BEAT_SWIMMERM_LUIS, SwimmermLuisSeenText, SwimmermLuisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermLuisAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermElmo:
	trainer SWIMMERM, ELMO, EVENT_BEAT_SWIMMERM_ELMO, SwimmermElmoSeenText, SwimmermElmoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermElmoAfterBattleText
	waitbutton
	closetext
	end

SeafoamIslandsSign:
	jumptext SeafoamIslandsSignText

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmerfMinaSeenText:
	text "Mmph? Mmmph mmphh?"
	line "Mmmmph mmmppphh!!!"
	done

SwimmerfMinaBeatenText:
	text "Pwah!"
	done

SwimmerfMinaAfterBattleText:
	text "I was trying to"
	line "see how long I"
	cont "could hold my"
	cont "breath!"
	done

SwimmerfLeonaSeenText:
	text "Look! It's my very"
	line "best swimsuit and"

	para "my very best"
	line "#MON!"
	done

SwimmerfLeonaBeatenText:
	text "Ohhh!"
	done

SwimmerfLeonaAfterBattleText:
	text "Your #MON--"
	line "are you following"
	cont "the lastest trend"
	cont "in teams?"
	done

SwimmermLuisSeenText:
	text "Phew!"

	para "I've worn my best"
	line "swim trunks today!"
	done

SwimmermLuisBeatenText:
	text "Even if you're"
	line "wearing your best"
	cont "pants,"

	para "if you don't win-"
	line "you just don't"
	cont "win."
	done

SwimmermLuisAfterBattleText:
	text "All right!"
	line "Next time I'll"

	para "wear party swim"
	line "trunks!"
	done

SwimmermElmoSeenText:
	text "I used to be a"
	line "fisherman a while"
	cont "back."

	para "I've grown to love"
	line "swimming so much,"

	para "I'm always in my"
	line "swim trunks!"
	done

SwimmermElmoBeatenText:
	text "Ulp…"
	done

SwimmermElmoAfterBattleText:
	text "Maybe I should go"
	line "back to fishing…"
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done

PicnickerChelSeenText:
	text "When I was a kid,"
	line "I only played"
	cont "inside the house."

	para "Now I love playing"
	line "outside with"
	cont "#MON!"
	done

PicnickerChelBeatenText:
	text "Argh!"
	done

PicnickerChelAfterBattleText:
	text "If I'm with"
	line "#MON,"

	para "I don't mind"
	line "losing so much!"
	done

PicnickerAdrianSeenText:
	text "Are you in"
	line "a hurry?"

	para "How about a quick"
	line "battle break?"
	done

PicnickerAdrianBeatenText:
	text "Aaah…that's it."
	done

PicnickerAdrianAfterBattleText:
	text "Even though I"
	line "lost, I had fun!"
	done

CamperPedroSeenText:
	text "Have you ever gone"
	line "camping with"
	cont "#MON?"
	done

CamperPedroBeatenText:
	text "You're strong!"
	done

CamperPedroAfterBattleText:
	text "If you forget your"
	line "blanket when you"
	cont "go camping,"

	para "you can snuggle up"
	line "to a #MON and"
	cont "it will be just as"
	cont "warm!"
	done

BirdkeeperBertSeenText:
	text "Found it!"
	line "A trainer that"

	para "I can enjoy"
	line "fighting!"
	done

BirdkeeperBertBeatenText:
	text "I lost with all"
	line "my strength!"
	done

BirdkeeperBertAfterBattleText:
	text "That was an"
	line "incredible battle!"

	para "I've got goose"
	line "bumps!"
	done

BirdkeeperErnieSeenText:
	text "Hey, hey."
	para "Will you battle"
	line "me?"
	done

BirdkeeperErnieBeatenText:
	text "That was pretty"
	line "incredible."
	done

BirdkeeperErnieAfterBattleText:
	text "You're something"
	line "special!"
	done

CinnabarGymSignText:
	text "SEAFOAM ISLANDS"

	para "…Somebody put a"
	line "notice under the"
	cont "sign!"

	para "The CINNABAR GYM"
	line "has moved here."

	para "LEADER: BLAINE"
	done

SeafoamIslandsSignText:
	text "SEAFOAM ISLANDS"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 54,  9, SEAFOAM_ISLANDS, 1
	warp_event 44,  5, SEAFOAM_ISLANDS, 3

	def_coord_events

	def_bg_events
	bg_event 53, 11, BGEVENT_READ, CinnabarGymSign
	bg_event 47,  7, BGEVENT_READ, SeafoamIslandsSign

	def_object_events
	object_event 84,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 75, 11, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 56, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerAdrian, -1
	object_event 49,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperPedro, -1
	object_event  6,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
	object_event 24, 12, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerChel, -1
	object_event 63,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermElmo, -1
	object_event 42,  1, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermLuis, -1
	object_event 45, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfLeona, -1
	object_event 21,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMina, -1
	object_event 18, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdkeeperBert, -1
	object_event 30, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdkeeperErnie, -1
