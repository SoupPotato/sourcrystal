MapSetupScripts:
; entries correspond to MAPSETUP_* constants (see constants/map_setup_constants.asm)
	table_width 2
	dw MapSetupScript_Warp
	dw MapSetupScript_Continue
	dw MapSetupScript_ReloadMap
	dw MapSetupScript_Teleport
	dw MapSetupScript_Door
	dw MapSetupScript_Fall
	dw MapSetupScript_Connection
	dw MapSetupScript_LinkReturn
	dw MapSetupScript_Train
	dw MapSetupScript_Submenu
	dw MapSetupScript_BadWarp
	dw MapSetupScript_Fly
	assert_table_length NUM_MAPSETUP_SCRIPTS

; valid commands are listed in MapSetupCommands (see data/maps/setup_script_pointers.asm)
MACRO mapsetup
	db (\1_MapSetupCmd - MapSetupCommands) / 3
	; `mapsetup` takes a parameter if `add_mapsetup` indicates taking one.
	if _NARG == 2
		db \2 ; param
	endc
ENDM

MapSetupScript_Teleport:
	mapsetup ResetPlayerObjectAction
MapSetupScript_Fly:
	mapsetup FadeOutToWhite
	mapsetup JumpRoamMons
MapSetupScript_Warp:
	mapsetup DisableLCD
	mapsetup DisableDynPalUpdates
	mapsetup InitSound
	mapsetup EnterMapSpawnPoint
	mapsetup LoadMapAttributes
	mapsetup HandleNewMap
	mapsetup ClearWeather
	mapsetup SetCurrentWeather
	mapsetup SpawnPlayer
	mapsetup RefreshPlayerCoords
	mapsetup GetMapScreenCoords
	mapsetup LoadBlockData
	mapsetup BufferScreen
	mapsetup LoadMapGraphics
	mapsetup LoadMapTimeOfDay
	mapsetup LoadMapObjects
	mapsetup EnableLCD
	mapsetup LoadMapPalettes
	mapsetup SpawnInFacingDown
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup RefreshMapSprites
	mapsetup PlayMapMusicBike
	mapsetup FadeInToMusic
	mapsetup FadeInFromWhite
	mapsetup ActivateMapAnims
	mapsetup LoadWildMonData
	db -1 ; end

MapSetupScript_BadWarp:
	mapsetup EnterMapSpawnPoint
	mapsetup LoadMapAttributes
	mapsetup HandleNewMap
	mapsetup ClearWeather
	mapsetup SetCurrentWeather
	mapsetup SpawnPlayer
	mapsetup RefreshPlayerCoords
	mapsetup GetMapScreenCoords
	mapsetup LoadBlockData
	mapsetup BufferScreen
	mapsetup DisableLCD
	mapsetup DisableDynPalUpdates
	mapsetup LoadMapGraphics
	mapsetup LoadMapTimeOfDay
	mapsetup FadeOutMapMusic
	mapsetup EnableLCD
	mapsetup LoadMapObjects
	mapsetup LoadMapPalettes
	mapsetup SpawnInFacingDown
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup RefreshMapSprites
	mapsetup FadeToMapMusic
	mapsetup FadeInFromWhite
	mapsetup ActivateMapAnims
	mapsetup LoadWildMonData
	db -1 ; end

MapSetupScript_Connection:
	mapsetup SuspendMapAnims
	mapsetup EnterMapConnection
	mapsetup LoadMapAttributes_Connection
	mapsetup HandleNewMap
	mapsetup SetCurrentWeather
	mapsetup RefreshPlayerCoords
	mapsetup LoadBlockData
	mapsetup LoadMapTileset
	mapsetup SaveScreen
	mapsetup LoadMapObjects_Connection
	mapsetup FadeToMapMusic
	mapsetup LoadMapPalettes
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup MapConnOWFadePalettesInit
	mapsetup InitMapNameSign
	mapsetup LoadWildMonData
	mapsetup UpdateRoamMons
	mapsetup ActivateMapAnims
	db -1 ; end

MapSetupScript_Fall:
	mapsetup ResetPlayerObjectAction
MapSetupScript_Door:
	mapsetup FadeOutToWhite
MapSetupScript_Train:
	mapsetup EnterMapWarp
	mapsetup LoadMapAttributes
	mapsetup GetWarpDestCoords
	mapsetup HandleNewMap
	mapsetup ClearWeather
	mapsetup SetCurrentWeather
	mapsetup RefreshPlayerCoords
	mapsetup LoadBlockData
	mapsetup BufferScreen
	mapsetup DisableLCD
	mapsetup DisableDynPalUpdates
	mapsetup LoadMapGraphics
	mapsetup LoadMapTimeOfDay
	mapsetup FadeOutMapMusic
	mapsetup EnableLCD
	mapsetup LoadMapObjects
	mapsetup LoadMapPalettes
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup RefreshMapSprites
	mapsetup FadeToMapMusic
	mapsetup FadeInFromWhite
	mapsetup ActivateMapAnims
	mapsetup LoadWildMonData
	mapsetup UpdateRoamMons
	db -1 ; end

MapSetupScript_ReloadMap:
	mapsetup ClearWeather
	mapsetup FadeMapMusicAndPalettes
	mapsetup ClearBGPalettes
	mapsetup DisableLCD
	mapsetup DisableDynPalUpdates
	mapsetup InitSound
	mapsetup LoadBlockData
	mapsetup LoadConnectionBlockData
	mapsetup LoadMapGraphics
	mapsetup LoadMapTimeOfDay
	mapsetup EnableLCD
	mapsetup LoadMapPalettes
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup RefreshMapSprites
	mapsetup ForceMapMusic
	mapsetup FadeInFromWhite
	mapsetup ActivateMapAnims
	mapsetup LoadWildMonData
	db -1 ; end

MapSetupScript_LinkReturn:
	mapsetup FadeMapMusicAndPalettes
	mapsetup DisableLCD
	mapsetup DisableDynPalUpdates
	mapsetup InitSound
	mapsetup HandleNewMap
	mapsetup LoadBlockData
	mapsetup BufferScreen
	mapsetup LoadMapGraphics
	mapsetup LoadMapTimeOfDay
	mapsetup EnableLCD
	mapsetup LoadMapPalettes
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup RefreshMapSprites
	mapsetup PlayMapMusicBike
	mapsetup FadeInFromWhite
	mapsetup ActivateMapAnims
	mapsetup LoadWildMonData
	mapsetup EnableTextAcceleration
	db -1 ; end

MapSetupScript_Continue:
	mapsetup DisableLCD
	mapsetup DisableDynPalUpdates
	mapsetup InitSound
	mapsetup LoadMapAttributes_SkipObjects
	mapsetup GetMapScreenCoords
	mapsetup HandleContinueMap
	mapsetup ClearWeather
	mapsetup SetCurrentWeather
	mapsetup LoadBlockData
	mapsetup LoadConnectionBlockData
	mapsetup BufferScreen
	mapsetup LoadMapGraphics
	mapsetup LoadMapTimeOfDay
	mapsetup EnableLCD
	mapsetup LoadMapPalettes
	mapsetup EnableDynPalUpdatesNoApply
	mapsetup RefreshMapSprites
	mapsetup PlayMapMusicBike
	mapsetup FadeInFromWhite
	mapsetup ActivateMapAnims
	mapsetup LoadWildMonData
	db -1 ; end

MapSetupScript_Submenu:
	mapsetup LoadBlockData
	mapsetup LoadConnectionBlockData
	db -1 ; end
