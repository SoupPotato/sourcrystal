	object_const_def

Route47_MapScripts:
	def_scene_scripts

	def_callbacks

Route47Revive:
	itemball REVIVE

Route47MysticWater:
	itemball MYSTIC_WATER

Route47SilverPowder:
	itemball SILVERPOWDER

Route47OpalShard:
	itemball OPAL_SHARD

Route47HiddenPearl:
	hiddenitem PEARL, EVENT_ROUTE_47_HIDDEN_PEARL

Route47HiddenStardust:
	hiddenitem STARDUST, EVENT_ROUTE_47_HIDDEN_STARDUST

GenericTrainerHikerDevin:
	trainer HIKER, DEVIN, EVENT_BEAT_HIKER_DEVIN, HikerDevinSeenText, HikerDevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDevinAfterBattleText
	waitbutton
	closetext
	end

HikerDevinAfterBattleText:
	text "After a battle,"
	line "you should always"
	para "leave with a"
	line "parting laugh!"
	done

HikerDevinSeenText:
	text "Longing for others"
	line "is… what it is…"

	para "But battles are"
	line "battles, so let's"
	cont "go!"
	done

HikerDevinBeatenText:
	text "Wah ha ha!"
	done

GenericTrainerCamperGrant:
	trainer CAMPER, GRANT, EVENT_BEAT_CAMPER_GRANT, CamperGrantSeenText, CamperGrantBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperGrantAfterBattleText
	waitbutton
	closetext
	end

CamperGrantAfterBattleText:
	text "See ya!"
	done

CamperGrantSeenText:
	text "I'm not good with"
	line "crowds, so I'm"
	cont "camping out here"
	cont "with my #MON!"
	done

CamperGrantBeatenText:
	text "I should head"
	line "deeper into the"
	cont "mountain…"
	done

GenericTrainerCoolDuoThomandkae1:
	trainer COOL_DUO, THOMANDKAE, EVENT_BEAT_COOL_DUO_THOM_AND_KAE, CoolDuoThomandkaeSeenText, CoolDuoThomandkaeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoThomandkae1AfterBattleText
	waitbutton
	closetext
	end

CoolDuoThomandkae1AfterBattleText:
	text "THOM: Your power"
	line "is impossible to"
	cont "predict!"
	done

GenericTrainerCoolDuoThomandkae2:
	trainer COOL_DUO, THOMANDKAE, EVENT_BEAT_COOL_DUO_THOM_AND_KAE, CoolDuoThomandkaeSeenText, CoolDuoThomandkaeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoThomandkae2AfterBattleText
	waitbutton
	closetext
	end

CoolDuoThomandkae2AfterBattleText:
	text "KAE: I figured you"
	line "were an ordinary"

	para "lone trainer."
	line "Boy, was I wrong!"
	done

CoolDuoThomandkaeSeenText:
	text "THOM: One plus one"
	line "is two. But the"

	para "two of us together"
	line "is much stronger!"

	para "KAE: The two of us"
	line "aren't just some"
	cont "boring pair!"
	done

CoolDuoThomandkaeBeatenText:
	text "THOM: That wasn't"
	line "what I expected…"

	para "KAE: You're"
	line "unusual, too!"
	done

GenericTrainerCoupleDuffandeda1:
	trainer COUPLE, DUFFANDEDA, EVENT_BEAT_COUPLE_DUFF_AND_EDA, CoupleDuffandeadSeenText, CoupleDuffandeadBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoupleDuffandead1AfterBattleText
	waitbutton
	closetext
	end

CoupleDuffandead1AfterBattleText:
	text "DUFF: I was no"
	line "match for you…"
	done

GenericTrainerCoupleDuffandeda2:
	trainer COUPLE, DUFFANDEDA, EVENT_BEAT_COUPLE_DUFF_AND_EDA, CoupleDuffandeadSeenText, CoupleDuffandeadBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoupleDuffandead2AfterBattleText
	waitbutton
	closetext
	end

CoupleDuffandead2AfterBattleText:
	text "EDA: You're really"
	line "something…"
	done

CoupleDuffandeadSeenText:
	text "DUFF: Watching"
	line "over my girlfriend"

	para "makes my heart"
	line "soar!"

	para "EDA: My feelings"
	line "for my boyfriend"

	para "are as wide and"
	line "deep as the ocean."
	done

CoupleDuffandeadBeatenText:
	text "DUFF: Thank you"
	line "for the awe-"
	cont "inspiring battle!"

	para "EDA: You should"
	line "find a wonderful"
	cont "partner, too."
	done

Route47_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 67, 21, CLIFF_EDGE_GATE, 2
	warp_event 52, 17, CLIFF_CAVE, 1
	warp_event 53, 21, CLIFF_CAVE, 2
	warp_event 53, 29, CLIFF_CAVE, 3

	def_coord_events

	def_bg_events
	bg_event 34, 33, BGEVENT_ITEM, Route47HiddenPearl
	bg_event 12, 28, BGEVENT_ITEM, Route47HiddenStardust

	def_object_events
	object_event 59, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, GenericTrainerHikerDevin, -1
	object_event 40, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, GenericTrainerCamperGrant, -1
	object_event 53, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT,  0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1,GenericTrainerCoolDuoThomandkae1, -1
	object_event 53, 18, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT,  0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1,GenericTrainerCoolDuoThomandkae2, -1
	object_event 27,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, GenericTrainerCoupleDuffandeda1, -1
	object_event 28,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, GenericTrainerCoupleDuffandeda2, -1
	object_event 39, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47Revive, EVENT_ROUTE_47_REVIVE
	object_event 11, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47MysticWater, EVENT_ROUTE_47_MYSTIC_WATER
	object_event 31, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47SilverPowder, EVENT_ROUTE_47_SILVER_POWDER
	object_event 7, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47OpalShard, EVENT_ROUTE_47_OPAL_SHARD
