	object_const_def
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED1, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_GENTLEMAN_ALFRED
	opentext
	checkflag ENGINE_ALFRED_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_GENTLEMAN_ALFRED
	iftrue .AlfredDefeated
	checkevent EVENT_ALFRED_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext GentlemanAlfredAfterBattleText
	promptbutton
	setevent EVENT_ALFRED_ASKED_FOR_PHONE_NUMBER
	scall OlivineLighthouse2FAskNumber1
	sjump .AskForNumber

.AskedBefore:
	scall OlivineLighthouse2FAskNumber2
.AskForNumber:
	askforphonenumber PHONE_GENTLEMAN_ALFRED
	ifequal PHONE_CONTACTS_FULL, OlivineLighthouse2FPhoneFull
	ifequal PHONE_CONTACT_REFUSED, OlivineLighthouse2FNumberDeclined
	gettrainername STRING_BUFFER_3, GENTLEMAN, ALFRED1
	scall OlivineLighthouse2FRegisteredNumber
	sjump OlivineLighthouse2FNumberAccepted

.WantsBattle:
	scall OlivineLighthouse2FRematch
	winlosstext GentlemanAlfredBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
	loadtrainer GENTLEMAN, ALFRED1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALFRED_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer GENTLEMAN, ALFRED2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALFRED_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer GENTLEMAN, ALFRED3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALFRED_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer GENTLEMAN, ALFRED4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALFRED_READY_FOR_REMATCH
	end

.AlfredDefeated:
	writetext GentlemanAlfredAfterBattleText
	promptbutton
	closetext
	end

TrainerSailorHuey:
	trainer SAILOR, HUEY1, EVENT_BEAT_SAILOR_HUEY, SailorHueySeenText, SailorHueyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SAILOR_HUEY
	opentext
	checkflag ENGINE_HUEY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_SAILOR_HUEY
	iftrue .HueyDefeated
	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext SailorHueyAfterBattleText
	promptbutton
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	scall OlivineLighthouse2FAskNumber1
	sjump .AskForNumber

.AskedBefore:
	scall OlivineLighthouse2FAskNumber2
.AskForNumber:
	askforphonenumber PHONE_SAILOR_HUEY
	ifequal PHONE_CONTACTS_FULL, OlivineLighthouse2FPhoneFull
	ifequal PHONE_CONTACT_REFUSED, OlivineLighthouse2FNumberDeclined
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall OlivineLighthouse2FRegisteredNumber
	sjump OlivineLighthouse2FNumberAccepted

.WantsBattle:
	scall OlivineLighthouse2FRematch
	winlosstext SailorHueyBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
	loadtrainer SAILOR, HUEY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SAILOR, HUEY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SAILOR, HUEY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SAILOR, HUEY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY_READY_FOR_REMATCH
	checkevent EVENT_HUEY_PROTEIN
	iftrue .HasProtein
	checkevent EVENT_GOT_PROTEIN_FROM_HUEY
	iftrue .SkipGift
	scall .RematchGift
	verbosegiveitem PROTEIN
	iffalse .PackFull
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	sjump OlivineLighthouse2FNumberAccepted

.SkipGift:
	end

.HasProtein:
	opentext
	writetext SailorHueyGiveProteinText
	waitbutton
	verbosegiveitem PROTEIN
	iffalse .PackFull
	clearevent EVENT_HUEY_PROTEIN
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	sjump OlivineLighthouse2FNumberAccepted


.PackFull:
	setevent EVENT_HUEY_PROTEIN
	jumpstd PackFullMScript
	end

.RematchGift:
	jumpstd RematchGiftMScript
	end

.HueyDefeated:
	writetext SailorHueyAfterBattleText
	promptbutton
	closetext
	end

OlivineLighthouse2FAskNumber1:
	jumpstd AskNumber1MScript
	end

OlivineLighthouse2FAskNumber2:
	jumpstd AskNumber2MScript
	end

OlivineLighthouse2FRegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

OlivineLighthouse2FNumberAccepted:
	jumpstd NumberAcceptedMScript
	end

OlivineLighthouse2FNumberDeclined:
	jumpstd NumberDeclinedMScript
	end

OlivineLighthouse2FPhoneFull:
	jumpstd PhoneFullMScript
	end

OlivineLighthouse2FRematch:
	jumpstd RematchMScript
	end

SailorHueySeenText:
	text "Men of the sea are"
	line "always spoiling"
	cont "for a good fight!"
	done

SailorHueyBeatenText:
	text "Urf!"
	line "I lose!"
	done

SailorHueyAfterBattleText:
	text "What power!"
	line "How would you like"

	para "to sail the seas"
	line "with me?"
	done

GentlemanAlfredSeenText:
	text "Hm? This is no"
	line "place for playing."
	done

GentlemanAlfredBeatenText:
	text "Ah! I can see that"
	line "you're serious."
	done

GentlemanAlfredAfterBattleText:
	text "Up top is a #-"
	line "MON that keeps the"
	cont "LIGHTHOUSE lit."

	para "But I hear that"
	line "it's sick now and"

	para "can't be cured by"
	line "ordinary medicine."
	done

SailorHueyGiveProteinText:
	text "Man! You're as"
	line "tough as ever!"

	para "Anyway, here's"
	line "that medicine from"
	cont "before."
	done

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 2
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_1F, 4
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_1F, 5
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_3F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey, -1
	object_event 17,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
