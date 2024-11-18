	object_const_def
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

GoldenrodDeptStoreRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodDeptStoreRoofCheckSaleChangeBlockCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodDeptStoreRoofCheckSaleChangeClerkCallback

GoldenrodDeptStoreRoofCheckSaleChangeBlockCallback:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	endcallback

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	endcallback

GoldenrodDeptStoreRoofCheckSaleChangeClerkCallback:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	endcallback

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	endcallback

GoldenrodDeptStoreRoofClerkScript:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

GoldenrodDeptStoreRoofPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanFText

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

GoldenrodDeptStoreRoofTwinScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTwinText

GoldenrodDeptStoreRoofSuperNerdScript:
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

GoldenrodDeptStoreRoofPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanMText

GoldenrodDeptStoreRoofTeacherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTeacherText

GoldenrodDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	opentext
	writetext PokeDollVendingMachineText
	yesorno
	iffalse PokeDollVendingMachineCancel
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 1000
	waitsfx
	playsound SFX_TRANSACTION
	closetext
	playsound SFX_SQUEAK
	pause 15
	playsound SFX_SQUEAK
	pause 15
	playsound SFX_SQUEAK
	pause 30
	playsound SFX_THROW_BALL
	pause 15
	random 18
	ifequal  0, .JigglypuffDoll
	ifequal  1, .BulbasaurDoll
	ifequal  2, .CharmanderDoll
	ifequal  3, .SquirtleDoll
	ifequal  4, .DiglettDoll
	ifequal  5, .StaryuDoll
	ifequal  6, .MagikarpDoll
	ifequal  7, .OddishDoll
	ifequal  8, .GengarDoll
	ifequal  9, .ShellderDoll
	ifequal 10, .GrimerDoll
	ifequal 11, .VoltorbDoll
	ifequal 12, .WeedleDoll
	ifequal 13, .UnownDoll
	ifequal 14, .GeodudeDoll
	ifequal 15, .MachopDoll
	ifequal 16, .TentacoolDoll
	ifequal 17, .SurfPikachuDoll
	end

.JigglypuffDoll:
	getmonname STRING_BUFFER_3, JIGGLYPUFF
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	sjump .givedoll

.BulbasaurDoll:
	getmonname STRING_BUFFER_3, BULBASAUR
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_BULBASAUR_DOLL
	sjump .givedoll

.CharmanderDoll:
	getmonname STRING_BUFFER_3, CHARMANDER
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_CHARMANDER_DOLL
	sjump .givedoll

.SquirtleDoll:
	getmonname STRING_BUFFER_3, SQUIRTLE
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_SQUIRTLE_DOLL
	sjump .givedoll

.DiglettDoll:
	getmonname STRING_BUFFER_3, DIGLETT
	checkevent EVENT_DECO_DIGLETT_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_DIGLETT_DOLL
	sjump .givedoll

.StaryuDoll:
	getmonname STRING_BUFFER_3, STARYU
	checkevent EVENT_DECO_STARYU_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_STARYU_DOLL
	sjump .givedoll

.MagikarpDoll:
	getmonname STRING_BUFFER_3, MAGIKARP
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_MAGIKARP_DOLL
	sjump .givedoll

.OddishDoll:
	getmonname STRING_BUFFER_3, ODDISH
	checkevent EVENT_DECO_ODDISH_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_ODDISH_DOLL
	sjump .givedoll

.GengarDoll:
	getmonname STRING_BUFFER_3, GENGAR
	checkevent EVENT_DECO_GENGAR_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_GENGAR_DOLL
	sjump .givedoll

.ShellderDoll:
	getmonname STRING_BUFFER_3, SHELLDER
	checkevent EVENT_DECO_SHELLDER_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_SHELLDER_DOLL
	sjump .givedoll

.GrimerDoll:
	getmonname STRING_BUFFER_3, GRIMER
	checkevent EVENT_DECO_GRIMER_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_GRIMER_DOLL
	sjump .givedoll

.VoltorbDoll:
	getmonname STRING_BUFFER_3, VOLTORB
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_VOLTORB_DOLL
	sjump .givedoll

.WeedleDoll:
	getmonname STRING_BUFFER_3, WEEDLE
	checkevent EVENT_DECO_WEEDLE_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_WEEDLE_DOLL
	sjump .givedoll

.UnownDoll:
	getmonname STRING_BUFFER_3, UNOWN
	checkevent EVENT_DECO_UNOWN_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_UNOWN_DOLL
	sjump .givedoll

.GeodudeDoll:
	getmonname STRING_BUFFER_3, GEODUDE
	checkevent EVENT_DECO_GEODUDE_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_GEODUDE_DOLL
	sjump .givedoll

.MachopDoll:
	getmonname STRING_BUFFER_3, MACHOP
	checkevent EVENT_DECO_MACHOP_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_MACHOP_DOLL
	sjump .givedoll

.TentacoolDoll:
	getmonname STRING_BUFFER_3, TENTACOOL
	checkevent EVENT_DECO_TENTACOOL_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_TENTACOOL_DOLL
	sjump .givedoll

.SurfPikachuDoll:
	getstring STRING_BUFFER_3, .SurfPikachuString
	checkevent EVENT_DECO_SURFING_PIKACHU_DOLL
	iftrue .alreadyOwned
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
;fallthrough
.givedoll:
	opentext
	writetext PokeDollVendingMachineHeyItsText
	promptbutton
	writetext PokeDollVendingMachineGotDollText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	writetext PokeDollVendingMachineDollWasSentToPCText
	waitbutton
	closetext
	end

.alreadyOwned:
	opentext
	writetext PokeDollVendingMachineHeyItsText
	promptbutton
	writetext PokeDollVendingMachineAlreadyOwnedText
	playsound SFX_WRONG
	waitsfx
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext PokeDollVendingMachineEnoughMoneyText
	waitbutton
	closetext
	end

.SurfPikachuString:
	db "SURF PIKACHU@"

PokeDollVendingMachineCancel:
	writetext PokeDollVendingMachineBetterToSaveText
	waitbutton
	closetext
	end

GoldenrodDeptStoreRoofPokefanFText:
	text "Whew, I'm tired."

	para "I sometimes come"
	line "up to the rooftop"

	para "to take a break"
	line "from shopping."
	done

GoldenrodDeptStoreRoofFisherText:
	text "Pardon? Who says"
	line "an adult can't get"
	cont "into this?"

	para "I'm going to be"
	line "back every day to"

	para "collect all the"
	line "dolls!"
	done

GoldenrodDeptStoreRoofTwinText:
	text "They have bargain"
	line "sales here every"
	cont "so often."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "Oh, wow!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "Will you quit"
	line "bothering me?"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "There's something"
	line "I really want, but"

	para "I don't have the"
	line "necessary cash…"

	para "Maybe I'll sell"
	line "off the BERRIES"
	cont "I've collected…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "Oh, everything is"
	line "so cheap!"

	para "I bought so much,"
	line "my PACK's crammed!"
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "My #MON always"
	line "get paralyzed or"

	para "poisoned when the"
	line "chips are down…"

	para "So I came to buy"
	line "some FULL HEAL."

	para "I wonder if"
	line "there's any left?"
	done

Binoculars1Text:
	text "These binoculars"
	line "let me see far"

	para "away. Maybe I can"
	line "see my own house."

	para "Is it the one with"
	line "the green roof?"
	done

Binoculars2Text:
	text "Hey! Some trainers"
	line "are battling on"
	cont "the road!"

	para "A #MON fired a"
	line "flurry of leaves!"

	para "That makes me feel"
	line "like battling"
	cont "right now!"
	done

Binoculars3Text:
	text "A FISHER caught a"
	line "lot of MAGIKARP…"

	para "They're SPLASHing"
	line "at the same time!"

	para "Look at the water"
	line "going everywhere!"
	done

PokeDollVendingMachineText:
	text "A vending machine"
	line "for #MON dolls?"

	para "Pay ¥1000, then"
	line "turn the crank…"

	para "Would you like to"
	line "try it?"
	done

PokeDollVendingMachineBetterToSaveText:
	text "Better to save"
	line "your money…"
	done

PokeDollVendingMachineEnoughMoneyText:
	text "You don't have"
	line "enough money…"
	done

PokeDollVendingMachineHeyItsText:
	text "Hey! It's a"
	line "@"
	text_ram wStringBuffer3
	text " DOLL!"
	done

PokeDollVendingMachineGotDollText:
	text "<PLAYER> obtained"
	line "@"
	text_ram wStringBuffer3
	text " DOLL!"
	done

PokeDollVendingMachineAlreadyOwnedText:
	text "But you already"
	line "own this…"
	done

PokeDollVendingMachineDollWasSentToPCText:
	text "@"
	text_ram wStringBuffer3
	text " DOLL"

	line "was sent to your"
	cont "home PC."
	done

GoldenrodDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	def_coord_events

	def_bg_events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	def_object_events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
