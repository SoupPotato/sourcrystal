MACRO weather_map
	db GROUP_\1
	db MAP_\1
	const_skip
ENDM

SetCurrentWeather::
; check for mandatory snow maps
	ld a, [wMapGroup]
	cp GROUP_SILVER_CAVE_UPPER_MOUNTAINSIDE
	jr nz, .check_ragelake_rain
	ld a, [wMapNumber]
	cp MAP_SILVER_CAVE_UPPER_MOUNTAINSIDE
	jp z, .snow

.check_ragelake_rain
	ld a, [wMapGroup]
	cp GROUP_LAKE_OF_RAGE
	jr nz, .check_r33_rain
	ld a, [wMapNumber]
	cp MAP_LAKE_OF_RAGE
	jr z, .rain

.check_r33_rain
	ld a, [wMapGroup]
	cp GROUP_ROUTE_33
	jr nz, .general_weather
	ld a, [wMapNumber]
	cp MAP_ROUTE_33
	jr z, .rain

.general_weather
	ld a, [wWeatherRandomDay]
	ld b, a
	ld a, [hRTCDayLo]
	cp b
	ld [wWeatherRandomDay], a
	call nz, GenerateNewRandomWeatherMap

; assumes the following layout:
;    [map group][map number]...
	assert wWeatherRandomMapKanto == wWeatherRandomMapJohto + (NUM_WEATHER_MAPS_PER_DAY * 2)
	ld hl, wWeatherRandomMapJohto
REPT NUM_WEATHER_MAPS_PER_DAY * 2
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	call .IsMapEqual
	jr c, .any_weather
ENDR

	ld a, OW_WEATHER_NONE
	jr .set_weather

.rain
; for rain specifically there's two possible intensities
	call Random
	cp 25 percent
	; a = carry ? OW_WEATHER_THUNDERSTORM : OW_WEATHER_RAIN
	sbc a
	and OW_WEATHER_THUNDERSTORM - OW_WEATHER_RAIN
	add OW_WEATHER_RAIN
	jr .set_weather

.any_weather
; rains half the time while it is currently DAY
	call Random
	cp 50 percent
	jr c, .rain

; otherwise, rain anyway
	ld a, [wTimeOfDay]
	cp DAY_F
	jr nz, .rain

	ld a, OW_WEATHER_SUNLIGHT
.set_weather
	ld b, a
	ld a, [wWeatherFlags]
	bit OW_WEATHER_DO_FLY_F, a
	jr nz, .skip_cooldown
	; if there was weather running then no cooldown
	ld a, [wCurWeather]
	and a
	jr z, .skip_cooldown
	; No cooldown if switching from rain to thunderstorm or vice versa
	ld c, a
	cp OW_WEATHER_RAIN
	jr nz, .not_rain
	ld a, b
	cp OW_WEATHER_THUNDERSTORM
	jr z, .skip_cooldown
.not_rain
	ld a, c
	cp OW_WEATHER_THUNDERSTORM
	jr nz, .compare_cur_and_prev_weather
	ld a, b
	cp OW_WEATHER_RAIN
	jr z, .skip_cooldown
	ld a, c
.compare_cur_and_prev_weather
	; if weather is different from previous weather then do cooldown
	cp b
	jr nz, .do_cooldown
.skip_cooldown
	ld a, b
	ld [wCurWeather], a
	farcall LoadWeatherPal
	call LoadWeatherGraphics
	xor a
	ld [wOverworldWeatherCooldown], a
	ret

.do_cooldown
	ld [wPrevWeather], a
	ld a, b
	ld [wCurWeather], a
	ld a, 64
	ld [wOverworldWeatherCooldown], a
	ret

.snow
	ld a, OW_WEATHER_SNOW
	jr .set_weather

; Set carry if b/c == wMapGroup/wMapNumber
.IsMapEqual:
	ld a, [wMapGroup]
	cp b
	jr nz, .neq
	ld a, [wMapNumber]
	cp c
	jr nz, .neq
	and a
	scf
	ret
.neq
	and a
	ret

GenerateNewRandomWeatherMap:
	ld de, wWeatherRandomMapJohto
REPT NUM_WEATHER_MAPS_PER_DAY
	ld a, NUM_JOHTO_WEATHER_MAPS
	call RandomRange
	ld h, 0
	ld l, a
	add hl, hl
	push de
		ld de, RandomRainMapsJohto
		add hl, de
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
ENDR

	ld de, wWeatherRandomMapKanto
REPT NUM_WEATHER_MAPS_PER_DAY
	ld a, NUM_KANTO_WEATHER_MAPS
	call RandomRange
	ld h, 0
	ld l, a
	add hl, hl
	push de
		ld de, RandomRainMapsKanto
		add hl, de
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
ENDR
	ret

RandomRainMapsJohto:
	const_def
	weather_map ROUTE_29
	weather_map ROUTE_30
	weather_map ROUTE_31
	weather_map ROUTE_32
	weather_map ROUTE_34
	weather_map ROUTE_35
	weather_map ROUTE_37
	weather_map ROUTE_38
	weather_map ROUTE_39
	weather_map ROUTE_40
	weather_map ROUTE_41
	weather_map ROUTE_42
	weather_map ROUTE_43
	weather_map ROUTE_44
	weather_map ROUTE_47
	weather_map ROUTE_48
	db -1 ; end
	DEF NUM_JOHTO_WEATHER_MAPS EQU const_value

RandomRainMapsKanto:
	const_def
	weather_map ROUTE_1
	weather_map ROUTE_2_NORTH
	weather_map ROUTE_2_SOUTH
	weather_map ROUTE_3
	weather_map ROUTE_4
	weather_map ROUTE_5
	weather_map ROUTE_6
	weather_map ROUTE_7
	weather_map ROUTE_8
	weather_map ROUTE_9
	weather_map ROUTE_10_NORTH
	weather_map ROUTE_11
	weather_map ROUTE_12
	weather_map ROUTE_13
	weather_map ROUTE_14
	weather_map ROUTE_15
	weather_map ROUTE_19
	weather_map ROUTE_20
	weather_map ROUTE_21
	weather_map ROUTE_22
	weather_map ROUTE_24
	weather_map ROUTE_25
	weather_map ROUTE_26
	weather_map ROUTE_27
	db -1 ; end
	DEF NUM_KANTO_WEATHER_MAPS EQU const_value
