	object_const_def
	const POKEMON_MANSION_B1F_BOULDER1
	const POKEMON_MANSION_B1F_BOULDER2
	const POKEMON_MANSION_B1F_BOULDER3
	const POKEMON_MANSION_B1F_MEW
	const POKEMON_MANSION_B1F_DOCUMENT
	const POKEMON_MANSION_B1F_POKE_BALL1
	const POKEMON_MANSION_B1F_POKE_BALL2

PokemonMansionB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .BouldersPokemonMansionB1F
	callback MAPCALLBACK_STONETABLE, .SetUpStoneTable


.BouldersPokemonMansionB1F:
	checkevent EVENT_POKEMON_MANSION_B1F_BOULDER_1
	iffalse .skip_boulder_1
	changeblock 26, 22, $85
	changeblock 24, 22, $6e
.skip_boulder_1
	checkevent EVENT_POKEMON_MANSION_B1F_BOULDER_2
	iffalse .skip_boulder_2
	changeblock 22, 12, $8f
.skip_boulder_2
	checkevent EVENT_POKEMON_MANSION_B1F_BOULDER_3
	iffalse .skip_boulder_3
	changeblock 4, 24, $90
	changeblock 6, 24, $67
.skip_boulder_3
	endcallback

.SetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 2, POKEMON_MANSION_B1F_BOULDER1, .Boulder1
	stonetable 3, POKEMON_MANSION_B1F_BOULDER2, .Boulder2
	stonetable 4, POKEMON_MANSION_B1F_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear POKEMON_MANSION_B1F_BOULDER1
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 26, 22, $85
	changeblock 24, 22, $6e
	opentext
	writetext PokemonMansionB1FBoulderFilled
	waitbutton
	closetext
	setevent EVENT_POKEMON_MANSION_B1F_BOULDER_1
	end

.Boulder2:
	disappear POKEMON_MANSION_B1F_BOULDER2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 22, 12, $8f
	opentext
	writetext PokemonMansionB1FBoulderFilled
	waitbutton
	closetext
	setevent EVENT_POKEMON_MANSION_B1F_BOULDER_2
	end

.Boulder3:
	disappear POKEMON_MANSION_B1F_BOULDER3
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 24, $90
	changeblock 6, 24, $67
	opentext
	writetext PokemonMansionB1FBoulderFilled
	waitbutton
	closetext
	setevent EVENT_POKEMON_MANSION_B1F_BOULDER_3
	end
	
PokemonMansionB1FBoulder:
	jumpstd StrengthBoulderScript

PokemonMansionB1FBoulderFilled:
	text "The boulder filled"
	line "the gap!"
	done

PokemonMansionB1FLabDocument:
	opentext
	writetext DocumentText
	waitbutton
	closetext
	checkevent EVENT_FOUGHT_MEW
	iftrue .do_nothing
	setval MEWTWO
	special FindPartyMonThatSpecies
	iffalse .do_nothing
	cry MEWTWO
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_BALL_WOBBLE
	pause 10
	playsound SFX_BALL_WOBBLE
	pause 10
	opentext
	writetext MmemberIsRestlessText
	waitbutton
	closetext
	playsound SFX_FLASH
	pause 10
	appear POKEMON_MANSION_B1F_MEW
	pause 10
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MEW, 60
	startbattle
	disappear POKEMON_MANSION_B1F_MEW
	setevent EVENT_FOUGHT_MEW
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .do_nothing
	setflag ENGINE_PLAYER_CAUGHT_MEW
.do_nothing
	end

DocumentText:
	text "…"
	
	para "It looks like the"
	line "remains of some"
	cont "document…"
	
	para "D--ry:-eb.-"
	
	para "ME---ve--irth-"
	
	para "-e--am-d--he-"
	line "-ew---n--E--W-…"
	
	para "The rest of the"
	line "page has been"
	cont "burned off…"
	done

MmemberIsRestlessText:
	text "One of your party"
	line "members has become"
	cont "restless…"
	done

MewText:
	text "MEW!"
	done

PokemonMansionB1FFullRestore:
	itemball FULL_RESTORE

PokemonMansionB1FRareCandy:
	itemball RARE_CANDY

PokemonMansion1FHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_POKEMON_MANSION_B1F_HIDDEN_STAR_PIECE

PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 22, POKEMON_MANSION_1F, 2
	warp_event 26, 23, POKEMON_MANSION_B1F, 1; boulder 3
	warp_event 22, 12, POKEMON_MANSION_B1F, 1; boulder 2
	warp_event  5, 24, POKEMON_MANSION_B1F, 1; boulder 1

	def_coord_events

	def_bg_events
	bg_event 10, 24, BGEVENT_ITEM, PokemonMansion1FHiddenStarPiece

	def_object_events
	object_event 22, 23, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBoulder, EVENT_POKEMON_MANSION_B1F_BOULDER_1
	object_event 25,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBoulder, EVENT_POKEMON_MANSION_B1F_BOULDER_2
	object_event 18, 25, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBoulder, EVENT_POKEMON_MANSION_B1F_BOULDER_3
	object_event  4,  4, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_POKEMON_MANSION_B1F_MEW
	object_event  4,  5, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FLabDocument, -1
	object_event 14, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FFullRestore, EVENT_POKEMON_MANSION_B1F_FULL_RESTORE
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FRareCandy, EVENT_POKEMON_MANSION_B1F_RARE_CANDY
