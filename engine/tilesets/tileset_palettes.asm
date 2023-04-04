LoadSpecialMapPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jp z, .darkness

.not_dark
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jp z, .pokecom_2f
	cp TILESET_BATTLE_TOWER
	jp z, .battle_tower
	cp TILESET_ICE_PATH
	jp z, .ice_path
	cp TILESET_HOUSE
	jp z, .house
	cp TILESET_RADIO_TOWER
	jp z, .radio_tower
	cp TILESET_MANSION
	jp z, .mansion_mobile
	ld a, [wMapGroup]
	cp GROUP_POKEMON_MANSION_B1F
	jp nz, .not_Pokemon_Mansion_B1F
	ld a, [wMapNumber]
	cp MAP_POKEMON_MANSION_B1F
	jp z, .LavaOverRedCoalOverBrownBGPalette
.not_Pokemon_Mansion_B1F
	ld a, [wMapGroup]
	cp GROUP_SAFARI_ZONE_AREA_2
	jp nz, .not_safari_zone_area_2
	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_AREA_2
	jp z, .SandOverBrownBGPalette
.not_safari_zone_area_2
	ld a, [wMapGroup]
	cp GROUP_SAFARI_ZONE_AREA_3
	jp nz, .not_safari_zone_area_3
	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_AREA_3
	jp z, .SwampBGPalettes
.not_safari_zone_area_3
	ld a, [wMapGroup]
	cp GROUP_SAFARI_ZONE_AREA_4
	jp nz, .not_safari_zone_area_4
	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_AREA_4
	jp z, .SundriedBGPalettes
.not_safari_zone_area_4
	ld a, [wMapGroup]
	cp GROUP_PEWTER_MUSEUM_1F
	jp nz, .not_pewter_museum_1f
	ld a, [wMapNumber]
	cp MAP_PEWTER_MUSEUM_1F
	jp z, .MuseumBGPalettes
.not_pewter_museum_1f
	ld a, [wMapGroup]
	cp GROUP_PEWTER_MUSEUM_2F
	jp nz, .not_pewter_museum_2f
	ld a, [wMapNumber]
	cp MAP_PEWTER_MUSEUM_2F
	jp z, .MuseumBGPalettes
.not_pewter_museum_2f
	ld a, [wMapGroup]
	cp GROUP_BLACKTHORN_GYM_1F
	jp nz, .not_blackthorn_gym_1f
	ld a, [wMapNumber]
	cp MAP_BLACKTHORN_GYM_1F
	jp z, .BlackThornGymBGPalettes
.not_blackthorn_gym_1f
	ld a, [wMapGroup]
	cp GROUP_BLACKTHORN_GYM_2F
	jp nz, .not_blackthorn_gym_2f
	ld a, [wMapNumber]
	cp MAP_BLACKTHORN_GYM_2F
	jp z, .BlackThornGymBGPalettes
.not_blackthorn_gym_2f
	ld a, [wMapGroup]
	cp GROUP_BRUNOS_ROOM
	jp nz, .not_brunos_room
	ld a, [wMapNumber]
	cp MAP_BRUNOS_ROOM
	jp z, .BlackThornGymBGPalettes
.not_brunos_room
	ld a, [wMapGroup]
	cp GROUP_KARENS_ROOM
	jp nz, .not_karens_room
	ld a, [wMapNumber]
	cp MAP_KARENS_ROOM
	jp z, .KarensRoomBGPalettes
.not_karens_room
	ld a, [wMapGroup]
	cp GROUP_KOGAS_ROOM
	jp nz, .not_kogas_room
	ld a, [wMapNumber]
	cp MAP_KOGAS_ROOM
	jp z, .KogasRoomBGPalettes
.not_kogas_room
	ld a, [wMapGroup]
	cp GROUP_WILLS_ROOM
	jp nz, .not_wills_room
	ld a, [wMapNumber]
	cp MAP_WILLS_ROOM
	jp z, .WillsRoomBGPalettes
.not_wills_room
	jp .do_nothing

.darkness
	call LoadDarknessPalette
	scf
	ret

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
	jp z, .do_nothing
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

.MuseumBGPalettes
	call LoadMuseumPalette
	scf
	ret

.LavaOverRedCoalOverBrownBGPalette
	ld hl, LavaOverRedCoalOverBrown
	jp .next

.SandOverBrownBGPalette:
	ld hl, SandOverRock
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	jp .next_TimeOfDay

.SwampBGPalettes:
	ld hl, SwampPals
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	jp .next_TimeOfDay

.SundriedBGPalettes:
	ld hl, SundriedPals
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.BlackThornGymBGPalettes
	ld hl, BlackThornGymPals
	jp .next

.KarensRoomBGPalettes
	ld hl, KarensRoomPals
	jp .next

.KogasRoomBGPalettes
	ld hl, KogasRoomPals
	jp .next

.WillsRoomBGPalettes
	ld hl, WillsRoomPals
.next
	ld bc, 8 palettes
.next_TimeOfDay
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.do_nothing
	and a
	ret

LoadDarknessPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, DarknessPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

DarknessPalette:
INCLUDE "gfx/tilesets/darkness.pal"

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

LoadMuseumPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MuseumPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

MuseumPalette:
INCLUDE "gfx/tilesets/museum.pal"

LoadSpecialMapOBPalette:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_30
	jp nz, .not_route30
	ld a, [wMapNumber]
	cp MAP_ROUTE_30
	jp z, .PurpleOverRockOBPalette

.not_route30
	ld a, [wMapGroup]
	cp GROUP_VIOLET_CITY
	jp nz, .not_violet
	ld a, [wMapNumber]
	cp MAP_VIOLET_CITY
	jp z, .YellowOverRockOBPalette

.not_violet
	ld a, [wMapGroup]
	cp GROUP_AZALEA_TOWN
	jr nz, .not_azalea
	ld a, [wMapNumber]
	cp MAP_AZALEA_TOWN
	jp z, .WhiteOverRockOBPalette

.not_azalea
	ld a, [wMapGroup]
	cp GROUP_ROUTE_38
	jr nz, .not_route38
	ld a, [wMapNumber]
	cp MAP_ROUTE_38
	jp z, .WhiteOverRockOBPalette

.not_route38
	ld a, [wMapGroup]
	cp GROUP_ROUTE_42
	jr nz, .not_route42
	ld a, [wMapNumber]
	cp MAP_ROUTE_42
	jp z, .YellowOverRockOBPalette

.not_route42
	ld a, [wMapGroup]
	cp GROUP_ROUTE_44
	jr nz, .not_route44
	ld a, [wMapNumber]
	cp MAP_ROUTE_44
	jp z, .YellowOverRockOBPalette

.not_route44
	ld a, [wMapGroup]
	cp GROUP_ROUTE_46
	jr nz, .not_route46
	ld a, [wMapNumber]
	cp MAP_ROUTE_46
	jp z, .YellowOverRockOBPalette

.not_route46
	ld a, [wMapGroup]
	cp GROUP_PEWTER_CITY
	jr nz, .not_pewter
	ld a, [wMapNumber]
	cp MAP_PEWTER_CITY
	jp z, .WhiteOverRockOBPalette

.not_pewter
	ld a, [wMapGroup]
	cp GROUP_PEWTER_NIDORAN_SPEECH_HOUSE
	jr nz, .not_pewter_nidoran_speech_house
	ld a, [wMapNumber]
	cp MAP_PEWTER_NIDORAN_SPEECH_HOUSE
	jp z, .PurpleOverRockOBPalette

.not_pewter_nidoran_speech_house
	ld a, [wMapGroup]
	cp GROUP_ROUTE_8
	jr nz, .not_route8
	ld a, [wMapNumber]
	cp MAP_ROUTE_8
	jp z, .PurpleOverRockYellowOverPinkOBPalette


.not_route8
	ld a, [wMapGroup]
	cp GROUP_FUCHSIA_CITY
	jr nz, .not_fuchsia
	ld a, [wMapNumber]
	cp MAP_FUCHSIA_CITY
	jp z, .YellowOverRockOBPalette

.not_fuchsia
	ld a, [wMapGroup]
	cp GROUP_OLIVINE_LIGHTHOUSE_6F
	jr nz, .not_lighthouse6F
	ld a, [wMapNumber]
	cp MAP_OLIVINE_LIGHTHOUSE_6F
	jp z, .YellowOverRockOBPalette

.not_lighthouse6F
	ld a, [wMapGroup]
	cp GROUP_VIRIDIAN_NICKNAME_SPEECH_HOUSE
	jr nz, .not_viridianhouse
	ld a, [wMapNumber]
	cp MAP_VIRIDIAN_NICKNAME_SPEECH_HOUSE
	jp z, .PurpleOverRockOBPalette

.not_viridianhouse
	ld a, [wMapGroup]
	cp GROUP_INDIGO_PLATEAU_POKECENTER_1F
	jr nz, .not_indigo
	ld a, [wMapNumber]
	cp MAP_INDIGO_PLATEAU_POKECENTER_1F
	jp z, .YellowOverRockOBPalette

.not_indigo
	ld a, [wMapGroup]
	cp GROUP_VERMILION_CITY
	jr nz, .not_vermillion
	ld a, [wMapNumber]
	cp MAP_VERMILION_CITY
	jp z, .GrayOverRockOBPalette

.not_vermillion
	ld a, [wMapGroup]
	cp GROUP_GOLDENROD_DEPT_STORE_B1F
	jr nz, .not_goldenrodstoreB1F
	ld a, [wMapNumber]
	cp MAP_GOLDENROD_DEPT_STORE_B1F
	jp z, .GrayOverRockOBPalette

.not_goldenrodstoreB1F
	ld a, [wMapGroup]
	cp GROUP_DANCE_THEATRE
	jr nz, .not_dancetheater
	ld a, [wMapNumber]
	cp MAP_DANCE_THEATRE
	jp z, .GrayOverRockOBPalette

.not_dancetheater
	ld a, [wMapGroup]
	cp GROUP_ROUTE_10_SOUTH
	jr nz, .not_route10S
	ld a, [wMapNumber]
	cp MAP_ROUTE_10_SOUTH
	jr z, .YellowOverRockOBPalette

.not_route10S
	ld a, [wMapGroup]
	cp GROUP_CERULEAN_CAVE_B1F
	jr nz, .not_ceruleancave
	ld a, [wMapNumber]
	cp MAP_CERULEAN_CAVE_B1F
	jp z, .PurpleOverPinkOBPalette

.not_ceruleancave
	ld a, [wMapGroup]
	cp GROUP_MR_FUJIS_HOUSE
	jr nz, .not_fujis_house
	ld a, [wMapNumber]
	cp MAP_MR_FUJIS_HOUSE
	jp z, .PurpleOverRockYellowOverPinkOBPalette

.not_fujis_house
	ld a, [wMapGroup]
	cp GROUP_SAFARI_ZONE_AREA_2
	jr nz, .not_safari_zone_area_2
	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_AREA_2
	jp z, .SandOverTreeOBPalette

.not_safari_zone_area_2
	ld a, [wMapGroup]
	cp GROUP_SAFARI_ZONE_AREA_3
	jr nz, .not_safari_zone_area_3
	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_AREA_3
	jp z, .SwampOverTreeOBPalette

.not_safari_zone_area_3
	ld a, [wMapGroup]
	cp GROUP_PEWTER_MUSEUM_1F
	jr nz, .not_pewter_museum_1f
	ld a, [wMapNumber]
	cp MAP_PEWTER_MUSEUM_1F
	jp z, .YellowOverRockOBPalette

.not_pewter_museum_1f
	ld a, [wMapGroup]
	cp GROUP_PEWTER_MUSEUM_2F
	jr nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_PEWTER_MUSEUM_2F
	jp z, .YellowOverRockOBPalette

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

.PurpleOverPinkOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, PurpleOverPink
	jr .finish

.SandOverTreeOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, SandOverTree
	jr .finish

.SwampOverTreeOBPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, SwampOverTree
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

INCLUDE "gfx/tilesets/bg_tiles_special_pals.pal"

LoadSpecialNPCPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr z, .darkness

.not_dark
	jr .do_nothing

.darkness
	call LoadNPCDarknessPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadNPCDarknessPalette:
	ld a, BANK(wOBPals1)
	ld de, wOBPals1
	ld hl, NPCDarknessPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

NPCDarknessPalette:
INCLUDE "gfx/overworld/npc_sprites_darkness.pal"