	const_def 2 ; object constants
	const POKEMON_MANSION_B1F_BOULDER1
	const POKEMON_MANSION_B1F_BOULDER2
	const POKEMON_MANSION_B1F_BOULDER3
	const POKEMON_MANSION_B1F_MEW

PokemonMansionB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersPokemonMansionB1F
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.DummyScene:
	checkevent EVENT_FOUGHT_MEW
	iftrue .DoNothing
	disappear POKEMON_MANSION_B1F_MEW
.DoNothing
	end

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
	return

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

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
	jumpstd strengthboulder

PokemonMansionB1FBoulderFilled:
	text "The boulder filled"
	line "the gap!"
	done

LabDocument:
	opentext
	writetext DocumentText
	waitbutton
	closetext
	checkevent EVENT_FOUGHT_MEW
	iftrue .notinparty
	writebyte MEWTWO
	special FindPartyMonThatSpecies
	iffalse .notinparty
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
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MEW, 60
	startbattle
	disappear POKEMON_MANSION_B1F_MEW
	setevent EVENT_FOUGHT_MEW
	reloadmapafterbattle
	end
	
.notinparty
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

PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 23, 22, POKEMON_MANSION_1F, 2
	warp_event 26, 23, POKEMON_MANSION_B1F, 1; boulder 3
	warp_event 22, 12, POKEMON_MANSION_B1F, 1; boulder 2
	warp_event  5, 24, POKEMON_MANSION_B1F, 1; boulder 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  5, BGEVENT_READ, LabDocument

	db 4 ; object events
	object_event 22, 23, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBoulder, EVENT_POKEMON_MANSION_B1F_BOULDER_1
	object_event 25,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBoulder, EVENT_POKEMON_MANSION_B1F_BOULDER_2
	object_event 18, 25, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FBoulder, EVENT_POKEMON_MANSION_B1F_BOULDER_3
	object_event  4,  4, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
