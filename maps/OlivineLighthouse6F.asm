	const_def 2 ; object constants
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_AMPHY_SICK
	const OLIVINELIGHTHOUSE6F_POKE_BALL
	const OLIVINELIGHTHOUSE6F_AMPHY_CURED

OlivineLighthouse6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


OlivineLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue .ExplainedSickness
	writetext JasmineCianwoodPharmacyText
	buttonsound
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
.ExplainedSickness:
	writetext JasmineGetSomeMedicineText
	waitbutton
	closetext
	end

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .no
	writetext PlayerHandedSecretpotionText
	buttonsound
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	buttonsound
	closetext
	appear OLIVINELIGHTHOUSE6F_AMPHY_CURED
	disappear OLIVINELIGHTHOUSE6F_AMPHY_SICK
	closetext ; extra command to smoothen the sprite swap by refreshing the screen
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	special FadeInPalettes
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	pause 10
	faceplayer
	opentext
	writetext JasmineThankYouText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	clearevent EVENT_OLIVINE_LIGHTHOUSE_AMPHY_SICK
	checkcode VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, MovementData_0x60c68
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingDown:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, MovementData_0x60c70
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, MovementData_0x60c79
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.no:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	opentext
	writetext JasmineAmphyHangOnText
	waitbutton
	closetext
	end

OlivineLighthouseUnusedDummyScript:
; unused
	end

OlivineLighthouseAmphy:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	writetext AmphyPalPalooText
	writebyte AMPHAROS
	special PlaySlowCry
	buttonsound
	writetext AmphyBreathingLaboredText
	waitbutton
	closetext
	end

.HealthyNow:
	writetext AmphyPaluPaluluText
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

MovementData_0x60c68:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

MovementData_0x60c70:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x60c79:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

JasmineCianwoodPharmacyText:
	text "JASMINE: … This"
	line "#MON always"

	para "kept the sea lit"
	line "at night."

	para "…But it suddenly"
	line "got sick… It's"
	cont "gasping for air…"

	para "…I understand"
	line "that there is a"

	para "wonderful PHARMACY"
	line "in CIANWOOD…"

	para "But that's across"
	line "the sea…"

	para "And I can't leave"
	line "AMPHY unattended…"
	done

JasmineGetSomeMedicineText:
	text "…May I ask you to"
	line "get some medicine"
	cont "for me? Please?"
	done

JasmineCureAmphyText:
	text "JASMINE: …Will"
	line "that medicine cure"
	cont "AMPHY?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> handed the"
	line "SECRETPOTION to"
	cont "JASMINE."
	done

JasmineDontBeOffendedText:
	text "JASMINE: …Um,"
	line "please don't be"
	cont "offended…"

	para "…AMPHY will not"
	line "take anything from"
	cont "anyone but me…"
	done

JasmineAmphyHowAreYouFeelingText:
	text "JASMINE: …"

	para "AMPHY, how are you"
	line "feeling?"
	done

JasmineThankYouText:
	text "JASMINE: …Oh, I'm"
	line "so relieved…"

	para "This is just so"
	line "wonderful…"

	para "Thank you so very,"
	line "very much."

	para "…I will return to"
	line "the GYM…"
	done

JasmineISeeText:
	text "JASMINE: …I see…"
	done

JasmineAmphyHangOnText:
	text "…AMPHY, hang on!"
	done

AmphyPalPalooText:
	text "AMPHY: …"
	line "…Pa… paloo…"
	done

AmphyBreathingLaboredText:
	text "Its breathing is"
	line "terribly labored…"
	done

AmphyPaluPaluluText:
	text "AMPHY: Palu!"
	line "Palulu!"
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_5F, 6
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_5F, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseJasmine, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_AMPHY_SICK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 1, OlivineLighthouseAmphy, EVENT_JASMINE_RETURNED_TO_GYM
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
	object_event 9,  8, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 1, OlivineLighthouseAmphy, EVENT_OLIVINE_LIGHTHOUSE_AMPHY_SICK
