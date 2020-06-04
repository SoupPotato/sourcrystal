    const_def 2 ; object constants
	const ROUTE10_ZAPDOS


Route10North_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppear
	checkcode VAR_BADGES
	ifequal NUM_BADGES, .Appear
	jump .NoAppear

.Appear:
	appear ROUTE10_ZAPDOS
	return

.NoAppear:
	disappear ROUTE10_ZAPDOS
	return

Route10Zapdos:
    opentext
    writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ZAPDOS, 50
	startbattle
	disappear ROUTE10_ZAPDOS
	setevent EVENT_FOUGHT_ZAPDOS
	reloadmapafterbattle
	end

Route10test:
	setevent EVENT_BEAT_FALKNER
	setevent EVENT_BEAT_BUGSY
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_CHUCK
	setevent EVENT_BEAT_JASMINE
	setevent EVENT_BEAT_PRYCE
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_BLUE
    setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
	end
	
ZapdosText:
    text "Gyaoo!"
	done

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd pokecentersign

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  6, 21, POWER_PLANT, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 23, BGEVENT_READ, PowerPlantSign
	bg_event 12,  1, BGEVENT_READ, Route10PokecenterSign

	db 1 ; object events
    object_event 3, 22, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0,  Route10Zapdos, EVENT_ZAPDOS_APPEAR