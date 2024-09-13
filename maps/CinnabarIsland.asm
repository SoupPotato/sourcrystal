	object_const_def
	const CINNABARISLAND_BLUE
	const CINNABARISLAND_ROCK1
	const CINNABARISLAND_ROCK2
	const CINNABARISLAND_ROCK3
	const CINNABARISLAND_ROCK4
	const CINNABARISLAND_SWIMMER_GIRL

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_CINNABAR_ISLAND_HIDDEN_STAR_PIECE

CinnabarIslandHiddenIron:
	hiddenitem IRON, EVENT_CINNABAR_ISLAND_HIDDEN_IRON

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "Who are you?"

	para "Well, it's plain"
	line "to see that you're"
	cont "a trainer…"

	para "My name's BLUE."

	para "I was once the"
	line "CHAMPION, although"

	para "it was for only a"
	line "short time…"

	para "That meddling RED"
	line "did me in…"

	para "Anyway, what do"
	line "you want? You want"

	para "to challenge me or"
	line "something?"

	para "…I hate to say"
	line "it, but I'm not in"

	para "the mood for a"
	line "battle now."

	para "Take a good look"
	line "around you…"

	para "A volcano erupts,"
	line "and just like"

	para "that, a whole town"
	line "disappears."

	para "We can go on win-"
	line "ning and losing in"

	para "#MON. But if"
	line "nature so much as"

	para "twitches, we can"
	line "lose in a second."

	para "…"

	para "That's the way it"
	line "is…"

	para "But, anyway, I'm"
	line "still a trainer."

	para "If I see a strong"
	line "opponent, it makes"
	cont "me want to battle."

	para "If you want to"
	line "battle me, come to"
	cont "the VIRIDIAN GYM."

	para "I'll take you on"
	line "then."
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "CINNABAR GYM has"
	line "relocated to SEA-"
	cont "FOAM ISLANDS."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "CINNABAR ISLAND"

	para "The Fiery Town of"
	line "Burning Desire"
	done

CinnabarIslandRock:
	jumpstd SmashRockScript

CinnabarIslandMansionRock:
	setevent EVENT_CINNABAR_MANSION_ROCK_SMASHED
	jumpstd SmashRockScript

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 15, CINNABAR_POKECENTER_1F, 1
	warp_event  9,  3, POKEMON_MANSION_1F, 1
	warp_event  9,  4, POKEMON_MANSION_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 15, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 15, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7, 11, BGEVENT_READ, CinnabarIslandSign
	bg_event 11,  4, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy
	bg_event 21,  4, BGEVENT_ITEM, CinnabarIslandHiddenStarPiece
	bg_event 20, 11, BGEVENT_ITEM, CinnabarIslandHiddenIron

	def_object_events
	object_event  9, 10, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
	object_event  9,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandMansionRock, EVENT_CINNABAR_MANSION_ROCK_SMASHED
	object_event 16,  1, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandRock, -1
	object_event 14,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandRock, -1
	object_event 20,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandRock, -1
	object_event 16, -2, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, ObjectEvent, -1
