    const_def 2 ; object constants
	const ROUTE10_ZAPDOS


Route10North_MapScripts:
	db 1 ; scene scripts
    scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .DoNothing
	checkcode VAR_BADGES
	ifequal NUM_BADGES, .ZapdosAppear
.DoNothing
    end
	
.ZapdosAppear
    setevent EVENT_ZAPDOS_APPEAR
	end

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
    object_event 3, 22, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0,  Route10Zapdos, EVENT_ZAPDOS_APPEAR