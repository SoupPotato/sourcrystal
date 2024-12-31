	object_const_def
	const ROUTE24_ROCKET
	const ROUTE24_SUPER_NERD
	const ROUTE24_BUENA1

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInFromBlack
	playmapmusic
	end

CoupleMaleScript:
	faceplayer
	opentext
	writetext CoupleMaleText
	waitbutton
	closetext
	turnobject ROUTE24_SUPER_NERD, LEFT
	end

CoupleFemaleScript:
	faceplayer
	opentext
	writetext CoupleFemaleText
	waitbutton
	closetext
	turnobject ROUTE24_BUENA1, LEFT
	end

CoupleMaleText:
	text "Can you leave"
	line "us alone?"

	para "I am building a"
	line "chemistry between"
	cont "us, and it's"
	cont "finally working."
	done

CoupleFemaleText:
	text "Just keep on"
	line "going. Thank you."

	para "No need to spoil"
	line "this chemistry."
	done

Route24RocketSeenText:
	text "Hey, kid! Me am a"
	line "TEAM ROCKET member"
	cont "kind of guy!"

	para "Come from another"
	line "country, a trainer"
	cont "number one, me!"

	para "Think I did, if"
	line "stop the energy,"

	para "be big panic for"
	line "here people!"

	para "Secret it is my"
	line "mission, so tell"
	cont "you I not!"

	para "But! If win you do"
	line "versus me, a man I"

	para "be and mine secret"
	line "to you I tell."

	para "Hey, kid! Battle"
	line "begin we do!"
	done

Route24RocketBeatenText:
	text "Ayieeeh! No, no,"
	line "no, believe it I"
	cont "can't!"

	para "Strong very much"
	line "be you! Match I am"
	cont "not to you!"
	done

Route24RocketAfterBattleText:
	text "OK. Tell you mine"
	line "secret will I."

	para "MACHINE PART steal"
	line "by me, hide it I"

	para "did in GYM of the"
	line "CERULEAN."

	para "Inside water put"
	line "it I did. Look for"

	para "in water center of"
	line "GYM at."

	para "But you forget me"
	line "not!"

	para "Beat you for sure"
	line "will TEAM ROCKET."

	para "Come from JOHTO"
	line "will they, mine"

	para "friends, yes. Will"
	line "revenge they are."
	done

Route24RocketDisappearsText:
	text "…"

	para "You say what? TEAM"
	line "ROCKET bye-bye a"

	para "go-go? Broken it"
	line "is says you?"

	para "Oh, no! Should I"
	line "do what now on"
	cont "from, me?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
	object_event 10,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CoupleMaleScript, -1
	object_event 10,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_NPC_BLUE,OBJECTTYPE_SCRIPT, 0, CoupleFemaleScript, -1
