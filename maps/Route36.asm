	object_const_def
	const ROUTE_36_YOUNGSTER1
	const ROUTE_36_YOUNGSTER2
	const ROUTE_36_SUDOWOODO
	const ROUTE_36_LASS1
	const ROUTE_36_FISHER
	const ROUTE_36_BERRY
	const ROUTE_36_APRICORN
	const ROUTE_36_ARTHUR
	const ROUTE_36_FLORIA
	const ROUTE_36_SUICUNE

Route36_MapScripts:
	def_scene_scripts
	scene_script Route36Noop1Scene, SCENE_ROUTE_36_NOOP
	scene_script Route36Noop2Scene, SCENE_ROUTE_36_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36FruittreesandArthurCallback

Route36Noop1Scene:
	end

Route36Noop2Scene:
	end

Route36FruittreesandArthurCallback:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_36_BERRY
	iftrue .NoBerry
	appear ROUTE_36_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE_36_APRICORN
	iftrue .NoApricorn
	appear ROUTE_36_APRICORN
.NoApricorn:
	;fallthrough

.ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE_36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE_36_ARTHUR
	endcallback

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE_36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE_36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE_36_NOOP
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE_36_SUDOWOODO, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE_36_SUDOWOODO, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE_36_SUDOWOODO
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUDOWOODO
.nocatch
	sjump Route36FloriaFinishScript

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE_36_SUDOWOODO, WeirdTreeMovement_Flee
	disappear ROUTE_36_SUDOWOODO
	special LoadUsedSpritesGFX
	special RefreshSprites
	sjump Route36FloriaFinishScript

Route36FloriaScript:
	faceplayer
	opentext
	checkevent EVENT_MET_FLORIA
	iftrue .SecondTimeTalking
	setevent EVENT_MET_FLORIA
	writetext FloriaText1
	waitbutton
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	closetext
	turnobject ROUTE_36_FLORIA, UP
	end

.SecondTimeTalking:
	writetext FloriaText2
	waitbutton
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	closetext
	turnobject ROUTE_36_FLORIA, UP
	end

.GotSquirtbottle
	writetext FloriaText3
	waitbutton
	closetext
	turnobject ROUTE_36_FLORIA, UP
	end

Route36FloriaFinishScript:
	applymovement ROUTE_36_FLORIA, FloriaMovement1
	turnobject PLAYER, DOWN
	opentext
	writetext FloriaText4
	waitbutton
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	applymovement ROUTE_36_FLORIA, FloriaMovement2
	disappear ROUTE_36_FLORIA
	closetext
	end


Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM08_ROCK_SMASH
	writetext RockSmashGuyText3
	promptbutton
	stringtotext .pagercardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_PAGER_ROCK_SMASH
	writetext GotRockSmashPagerText
	promptbutton
.AlreadyGotRockSmash:
	writetext RockSmashGuyText4
	waitbutton
.NoRoomForTM:
	closetext
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.pagercardname
	db "ROCK SMASH PAGER@"

GotRockSmashPagerText:
	text "CUBONE SMASH was"
	line "added to the PPS!"
	done

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	opentext
	checkflag ENGINE_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .AlanDefeated
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlan1AfterBattleText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent ENGINE_ALAN_GAVE_FIRE_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

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

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

.AlanDefeated:
	writetext SchoolboyAlan1AfterBattleText
	promptbutton
	closetext
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36BerryTree:
	opentext
	getitemname STRING_BUFFER_3, RAWST_BERRY
	writetext Route36BerryTreeText
	promptbutton
	writetext Route36HeyItsBerryApricornText
	promptbutton
	giveitem RAWST_BERRY
	iffalse Route36NoRoomInBag
	disappear ROUTE_36_BERRY
	setflag ENGINE_DAILY_ROUTE_36_BERRY
	writetext Route36FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route36ApricornTree:
	opentext
	getitemname STRING_BUFFER_3, BLU_APRICORN
	writetext Route36ApricornTreeText
	promptbutton
	writetext Route36HeyItsBerryApricornText
	promptbutton
	giveitem BLU_APRICORN
	iffalse Route36NoRoomInBag
	disappear ROUTE_36_APRICORN
	setflag ENGINE_DAILY_ROUTE_36_APRICORN
	writetext Route36FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route36NoBerry:
	opentext
	writetext Route36BerryTreeText
	promptbutton
	writetext Route36NothingHereText
	waitbutton
	closetext
	end

Route36NoApricorn:
	opentext
	writetext Route36ApricornTreeText
	promptbutton
	writetext Route36NothingHereText
	waitbutton
	closetext
	end

Route36NoRoomInBag:
	writetext Route36NoRoomInBagText
	waitbutton
	closetext
	end

SudowoodoShakeMovement:
	tree_shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

FloriaMovement1:
	step UP
	step UP
	step_end

FloriaMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

UseSquirtbottleText:
	text "It's a weird tree."
	line "Use SQUIRTBOTTLE?"
	done

UsedSquirtbottleText:
	text "<PLAYER> used the"
	line "SQUIRTBOTTLE."
	done

SudowoodoAttackedText:
	text "The weird tree"
	line "doesn't like the"
	cont "SQUIRTBOTTLE!"

	para "The weird tree"
	line "attacked!"
	done

FloriaText1:
	text "I'm the FLOWER"
	line "SHOP's FLORIA!"

	para "Listen, listen!"

	para "When I sprinkled"
	line "water on that"

	para "wiggly tree, it"
	line "jumped right up!"

	para "It just has to be"
	line "a #MON."

	para "I bet it would be"
	line "shocked out of its"

	para "disguise if you"
	line "soaked it!"
	done

FloriaText2:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she said"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

FloriaText3:
	text "Oh, that's a"
	line "SQUIRTBOTTLE!"

	para "Soak the tree for"
	line "me!"

	para "I want to see what"
	line "happens!"
	done

FloriaText4:
	text "That was fun!"

	para "Well, I have to go"
	line "back to GOLDENROD."

	para "If you're heading"
	line "for ECRUTEAK CITY,"

	para "then just take the"
	line "left path."

	para "See you around!"
	done

RockSmashGuyText1:
	text "Wa-hey!"

	para "I was going to"
	line "snap that tree"

	para "with my straight-"
	line "arm punch."

	para "But I couldn't!"
	line "I'm a failure!"
	done

RockSmashGuyText2:
	text "Did you clear that"
	line "wretched tree?"

	para "I'm impressed!"
	line "I want you to"
	cont "have this."
	done

RockSmashGuyText3:
	text "That happens to be"
	line "ROCK SMASH."

	para "You can have this"
	line "too!"
	done

RockSmashGuyText4:
	text "That's a PAGER for"
	line "using ROCK SMASH."

	para "With ROCK SMASH"
	line "you can shatter"

	para "rocks with just a"
	line "single well-aimed"
	cont "smack."

	para "If any rocks are"
	line "in your way, just"
	cont "smash 'em up!"
	done

UnknownText_0x1945b8:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "I wanted to go see"
	line "the huge #MON"

	para "CENTER they just"
	line "opened…"
	done

Route36LassText:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "It's preventing"
	line "me from shopping."

	para "Something should"
	line "be done about it."
	done

Route36LassText_ClearedSudowoodo:
	text "That odd tree dis-"
	line "appeared without a"
	cont "trace."

	para "Oh! That tree was"
	line "really a #MON?"
	done

PsychicMarkSeenText:
	text "I'm going to read"
	line "your thoughts!"
	done

PsychicMarkBeatenText:
	text "I misread you!"
	done

PsychicMarkAfterBattleText:
	text "I'd be strong if"
	line "only I could tell"

	para "what my opponent"
	line "was thinking."
	done

SchoolboyAlan1SeenText:
	text "Thanks to my stud-"
	line "ies, I'm ready for"
	cont "any #MON!"
	done

SchoolboyAlan1BeatenText:
	text "Oops! Computation"
	line "error?"
	done

SchoolboyAlan1AfterBattleText:
	text "Darn. I study five"
	line "hours a day too."

	para "There's more to"
	line "learning than just"
	cont "reading books."
	done

MeetArthurText:
	text "ARTHUR: Who are"
	line "you?"

	para "I'm ARTHUR of"
	line "Thursday."
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "ARTHUR: A #MON"
	line "that uses rock-"

	para "type moves should"
	line "hold on to that."

	para "It pumps up rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "ARTHUR: I'm ARTHUR"
	line "of Thursday. I'm"

	para "the second son out"
	line "of seven children."
	done

ArthurNotThursdayText:
	text "ARTHUR: Today's"
	line "not Thursday. How"
	cont "disappointing."
	done

Route36SignText:
	text "ROUTE 36"
	done

RuinsOfAlphNorthSignText:
	text "RUINS OF ALPH"
	line "NORTH ENTRANCE"
	done

Route36TrainerTips1Text:
	text "TRAINER TIPS"

	para "#MON stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#MON grow."
	done

Route36TrainerTips2Text:
	text "TRAINER TIPS"

	para "Use DIG to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done

Route36BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route36ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route36NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route36HeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route36FoundItemText:
	text_far _FoundItemText
	text_end

Route36NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route36_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	def_coord_events
	coord_event 20,  7, SCENE_ROUTE_36_SUICUNE, Route36SuicuneScript
	coord_event 22,  7, SCENE_ROUTE_36_SUICUNE, Route36SuicuneScript

	def_bg_events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1
	bg_event 21,  5, BGEVENT_READ, Route36NoBerry
	bg_event 21,  4, BGEVENT_READ, Route36NoApricorn

	def_object_events
	object_event 20, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_SUDOWOODO, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  5, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36BerryTree, EVENT_ROUTE_36_BERRY
	object_event 21,  4, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36ApricornTree, EVENT_ROUTE_36_APRICORN
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 35, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	object_event 21,  6, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
