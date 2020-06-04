LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER
	jr z, .battle_tower
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower
	call LoadBattleTowerPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadBattleTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerPalette:
INCLUDE "gfx/tilesets/battle_tower.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 + 6 palettes
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 + 8 palettes
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadSpecialMapOBPalette:
	ld a, [wMapNumber]
	cp MAP_ROUTE_30
	jr z, .GetMapNumber
	cp MAP_VIOLET_CITY
	jr z, .GetMapNumber
	cp MAP_AZALEA_TOWN
	jr z, .GetMapNumber
	cp MAP_ROUTE_38
	jr z, .GetMapNumber
	cp MAP_ROUTE_42
	jr z, .GetMapNumber
	cp MAP_ROUTE_44
	jr z, .GetMapNumber
	cp MAP_ROUTE_46
	jr z, .GetMapNumber
	cp MAP_PEWTER_CITY
	jr z, .GetMapNumber
	cp MAP_ROUTE_8
	jr z, .GetMapNumber
	cp MAP_OLIVINE_LIGHTHOUSE_6F
	jr z, .GetMapNumber
	cp MAP_VIRIDIAN_NICKNAME_SPEECH_HOUSE
	jr z, .GetMapNumber
	cp MAP_INDIGO_PLATEAU_POKECENTER_1F
	jr z, .GetMapNumber
	cp MAP_VERMILION_CITY
	jr z, .GetMapNumber
	cp MAP_GOLDENROD_DEPT_STORE_B1F
	jr z, .GetMapNumber
	cp MAP_DANCE_THEATRE
	jr z, .GetMapNumber
	jr .do_nothing


.GetMapNumber
	ld a, [wMapGroup]
	cp GROUP_ROUTE_30
	jr z, .PurpleOverRockOBPalette
	cp GROUP_VIOLET_CITY
	jr z, .YellowOverRockOBPalette
	cp GROUP_AZALEA_TOWN
	jr z, .WhiteOverRockOBPalette
	cp GROUP_ROUTE_38
	jr z, .WhiteOverRockOBPalette
	cp GROUP_ROUTE_42
	jr z, .YellowOverRockOBPalette
	cp GROUP_ROUTE_44
	jr z, .YellowOverRockOBPalette
	cp GROUP_ROUTE_46
	jr z, .YellowOverRockOBPalette
	cp GROUP_PEWTER_CITY
	jr z, .WhiteOverRockOBPalette
	cp GROUP_ROUTE_8
	jr z, .PurpleOverRockYellowOverPinkOBPalette
	cp GROUP_FUCHSIA_CITY
	jr z, .YellowOverRockOBPalette
	cp GROUP_OLIVINE_LIGHTHOUSE_6F
	jr z, .YellowOverRockOBPalette
	cp GROUP_VIRIDIAN_NICKNAME_SPEECH_HOUSE
	jr z, .PurpleOverRockOBPalette
	cp GROUP_INDIGO_PLATEAU_POKECENTER_1F
	jr z, .YellowOverRockOBPalette
	cp GROUP_VERMILION_CITY
	jr z, .GrayOverRockOBPalette
	cp GROUP_GOLDENROD_DEPT_STORE_B1F
	jr z, .GrayOverRockOBPalette
	cp GROUP_DANCE_THEATRE
	jr z, .GrayOverRockOBPalette
	

.do_nothing
    and a
    ret

.PurpleOverRockOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, PurpleOverRock
	jr .finish
    
.YellowOverRockOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, YellowOverRock
    jr .finish
	
.WhiteOverRockOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, WhiteOverRock
    jr .finish	
	
.PurpleOverRockYellowOverPinkOBPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, PurpleOverRockYellowOverPink
	jr .finish
	
.GrayOverRockOBPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, GrayOverRock
	jr .finish
	
.finish
	call AddNTimes
    ld de, wOBPals1
    ld bc, 8 palettes
	ld a, BANK(wOBPals1)
    call FarCopyWRAM
    scf
    ret

; Special Overworld Pals
INCLUDE "gfx/overworld/npc_sprites_special.pal"