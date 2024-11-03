	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RED
	iftrue .rematch
.skip_rematch
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_COOL_DUO_ELAN_AND_IDA
	setevent EVENT_BEAT_COOLTRAINERM_ARWIN
	setevent EVENT_BEAT_COOLTRAINERM_BONITA
	setevent EVENT_BEAT_COOLTRAINERF_SALMA
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

.rematch:
	checkflag ENGINE_DAILY_BLUE_REMATCH
	iftrue .skip_rematch
	writetext BlueRematchIntroText
	waitbutton
	closetext
	winlosstext BlueRematchWinLossText, 0
	loadtrainer BLUE, BLUE2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_BLUE_REMATCH
	opentext
	writetext BlueRematchAfterBattleText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

TrainerCoolDuoElanandIda1:
	trainer COOL_DUO, ELANANDIDA, EVENT_BEAT_COOL_DUO_ELAN_AND_IDA, CoolDuoElanandIdaSeenText, CoolDuoElanandIdaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoElanandIda1AfterBattleText
	waitbutton
	closetext
	end

TrainerCoolDuoElanandIda2:
	trainer COOL_DUO, ELANANDIDA, EVENT_BEAT_COOL_DUO_ELAN_AND_IDA, CoolDuoElanandIdaSeenText, CoolDuoElanandIdaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CoolDuoElanandIda2AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermArwin:
	trainer COOLTRAINERM, ARWIN, EVENT_BEAT_COOLTRAINERM_ARWIN, CooltrainermArwinSeenText, CooltrainermArwinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermArwinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBonita:
	trainer COOLTRAINERM, BONITA, EVENT_BEAT_COOLTRAINERM_BONITA, CooltrainermBonitaSeenText, CooltrainermBonitaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBonitaAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfSalma:
	trainer COOLTRAINERF, SALMA, EVENT_BEAT_COOLTRAINERF_SALMA, CooltrainerfSalmaSeenText, CooltrainerfSalmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfSalmaAfterBattleText
	waitbutton
	closetext
	end

LeaderBlueBeforeText:
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO"
	line "CHAMP?"
	done

LeaderBlueWinText:
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "EARTHBADGE."
	done

LeaderBlueAfterText:
	text "BLUE: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBlueEpilogueText:
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

ViridianGymGuideText:
	text "Yo, CHAMP in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The GYM LEADER is"
	line "a guy who battled"

	para "the CHAMPION three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuideWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

CoolDuoElanandIdaSeenText:
	text "IDA: I'm IDA!"
	line "Next to me"
	cont "is ELAN!"

	para "Together, we're"
	line "a COOLDUO!"

	para "ELAN: All right,"
	line "let's get this"
	cont "fight started!"
	cont "Come on!"
	done

CoolDuoElanandIdaBeatenText:
	text "IDA: Wow."
	line "You're really"
	cont "something."

	para "ELAN: Well, this"
	line "is surprising."
	done

CoolDuoElanandIda1AfterBattleText:
	text "ELAN: You're"
	line "stronger than we"
	cont "anticipated!"
	done

CoolDuoElanandIda2AfterBattleText:
	text "IDA: If the only"
	line "thing GYM trainers"
	cont "have is strength,"
	cont "they won't do"
	cont "well."

	para "Bringing out"
	line "your opponent's"
	cont "strength is also"
	cont "very important!"
	done

CooltrainermArwinSeenText:
	text "Anyway, fight me"
	line "and see!"
	done

CooltrainermArwinBeatenText:
	text "I was deceived!"
	done

CooltrainermArwinAfterBattleText:
	text "Me, I should be"
	line "a pretty good"
	cont "practice part-"
	cont "ner…"

	para "I shouldn't say"
	line "that about myself!"
	done

CooltrainermBonitaSeenText:
	text "Looking around the"
	line "room like that,"

	para "doesn't it make"
	line "you a little"
	cont "dizzy?"
	done

CooltrainermBonitaBeatenText:
	text "All of my"
	line "#MON…"

	para "All dizzy and"
	line "fainting…"
	done

CooltrainermBonitaAfterBattleText:
	text "Looks like you've"
	line "still got some"
	cont "energy left."
	done

CooltrainerfSalmaSeenText:
	text "What do you think?"

	para "You've never seen"
	line "such a wonderful"
	cont "GYM before,"
	cont "have you?"
	done

CooltrainerfSalmaBeatenText:
	text "Whatever!"
	done

CooltrainerfSalmaAfterBattleText:
	text "There are many "
	line "kinds of GYMs in"
	cont "the world,"

	para "but I really like"
	line "this one!"
	done

BlueRematchIntroText:
	text "BLUE: Good!"

	para "Thanks for coming"
	line "to lose to me!"
	done 
	
BlueRematchWinLossText:
	text "Just as I expect-"
	line "ed!"

	para "No wonder you be-"
	line "came CHAMPION…"
	done 

BlueRematchAfterBattleText:
	text "BLUE: Hahaha!"

	para "My scare tactics"
	line "don't scare you!"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 39, VIRIDIAN_CITY, 1
	warp_event  5, 39, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 35, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 35, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 36, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  4,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCoolDuoElanandIda1, EVENT_VIRIDIAN_GYM_BLUE
	object_event  5,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCoolDuoElanandIda2, EVENT_VIRIDIAN_GYM_BLUE
	object_event  5, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermArwin, EVENT_VIRIDIAN_GYM_BLUE
	object_event  2, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfSalma, EVENT_VIRIDIAN_GYM_BLUE
	object_event  2, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermBonita, EVENT_VIRIDIAN_GYM_BLUE
