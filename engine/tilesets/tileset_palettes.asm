LoadSpecialMapPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr z, .darkness

.not_dark
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	jr .lookup_specifics

.darkness
	call LoadDarknessPalette
	scf
	ret

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower_inside
	call LoadBattleTowerInsidePalette
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

.lookup_specifics
	ld hl, MapSpecificPalettes
; fallthru
SearchPaletteRoutine:
.keep_looking
	ld a, [hl]
	cp -1
	jr z, .do_nothing
	ld b, a
	ld a, [wMapGroup]
	cp b
	jr nz, .group_not_matching
	inc hl
	ld b, [hl]
	ld a, [wMapNumber]
	cp b
	jr nz, .map_not_matching
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.group_not_matching
	inc hl
.map_not_matching
	inc hl
	inc hl
	inc hl
	jr .keep_looking
.do_nothing
	and a
	ret

MACRO _use_palette_routine_for_map
	db GROUP_\1, MAP_\1
	dw \2
ENDM

MapSpecificPalettes:
	_use_palette_routine_for_map POKEMON_MANSION_B1F, .LavaOverRedCoalOverBrownBGPalette
	_use_palette_routine_for_map SAFARI_ZONE_AREA_2, .SandOverBrownBGPalette
	_use_palette_routine_for_map SAFARI_ZONE_AREA_3, .SwampBGPalettes
	_use_palette_routine_for_map SAFARI_ZONE_AREA_4, .SundriedBGPalettes
	_use_palette_routine_for_map PEWTER_MUSEUM_1F, .MuseumBGPalettes
	_use_palette_routine_for_map PEWTER_MUSEUM_2F, .MuseumBGPalettes
	_use_palette_routine_for_map BLACKTHORN_GYM_1F, .BlackThornGymBGPalettes
	_use_palette_routine_for_map BLACKTHORN_GYM_2F, .BlackThornGymBGPalettes
	_use_palette_routine_for_map BRUNOS_ROOM, .BlackThornGymBGPalettes
	_use_palette_routine_for_map KARENS_ROOM, .KarensRoomBGPalettes
	_use_palette_routine_for_map KOGAS_ROOM, .KogasRoomBGPalettes
	_use_palette_routine_for_map WILLS_ROOM, .WillsRoomBGPalettes
	_use_palette_routine_for_map VIRIDIAN_GYM, .ViridianGymBGPalettes
	_use_palette_routine_for_map SILVER_CAVE_UPPER_MOUNTAINSIDE, .MountainSideSnowBGPalettes
	db -1 ; terminator

.LavaOverRedCoalOverBrownBGPalette:
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
.MountainSideSnowBGPalettes:
	ld hl, MountainSideSnowPals
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
.BlackThornGymBGPalettes:
	ld hl, BlackThornGymPals
	jp .next
.KarensRoomBGPalettes:
	ld hl, KarensRoomPals
	jp .next
.KogasRoomBGPalettes:
	ld hl, KogasRoomPals
	jp .next
.WillsRoomBGPalettes:
	ld hl, WillsRoomPals
	jp .next
.MuseumBGPalettes
	call LoadMuseumPalette
	scf
	ret
.ViridianGymBGPalettes:
	ld hl, ViridianGymPals
.next
	ld bc, 8 palettes
.next_TimeOfDay
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

LoadMuseumPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MuseumPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

MuseumPalette:
INCLUDE "gfx/tilesets/museum.pal"

LoadDarknessPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, DarknessPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

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

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

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
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

INCLUDE "gfx/tilesets/bg_tiles_special_pals.pal"
