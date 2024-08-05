MACRO weather_map
	db GROUP_\1
	db MAP_\1
	const_skip
ENDM

SetCurrentWeather::
	; check for mandatory snow maps
	ld a, [wMapGroup]
	cp GROUP_SILVER_CAVE_CLIFF_SIDE_2F
	jr nz, .not_silver_cave_cliff_side_2f
	ld a, [wMapNumber]
	cp MAP_SILVER_CAVE_CLIFF_SIDE_2F
	jp z, .snow
.not_silver_cave_cliff_side_2f
	; check for mandatory rain maps
	ld a, [wMapGroup]
	cp GROUP_LAKE_OF_RAGE
	jr nz, .not_lake_of_rage
	ld a, [wMapNumber]
	cp MAP_LAKE_OF_RAGE
	jr z, .rain
.not_lake_of_rage
	ld a, [wMapGroup]
	cp GROUP_ROUTE_33
	jr nz, .not_route_33
	ld a, [wMapNumber]
	cp MAP_ROUTE_33
	jr z, .rain
.not_route_33
	; if we are here, then we are not in a mandatory rain map
	ld a, [wWeatherRandomDay]
	ld b, a
	ld a, [hRTCDayLo]
	cp b
	ld [wWeatherRandomDay], a
	call nz, GenerateNewRandomRainMap
	ld a, [wWeatherRandomMapGroup]
	ld b, a
	ld a, [wWeatherRandomMapNumber]
	ld c, a
	ld a, [wMapGroup]
	cp b
	jr nz, .not_raining
	ld a, [wMapNumber]
	cp c
	jr z, .rain
.not_raining
	ld a, OW_WEATHER_NONE
	jr .set_weather

.rain
	call Random
	cp 25 percent
	; a = carry ? OW_WEATHER_THUNDERSTORM : OW_WEATHER_RAIN
	sbc a
	and OW_WEATHER_THUNDERSTORM - OW_WEATHER_RAIN
	add OW_WEATHER_RAIN
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
	ld a, 32
	ld [wOverworldWeatherCooldown], a
	ret

.snow
	ld a, OW_WEATHER_SNOW
	jr .set_weather

GenerateNewRandomRainMap:
	ld a, NUM_WEATHER_MAPS
	call RandomRange
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [hli]
	ld [wWeatherRandomMapGroup], a
	ld a, [hl]
	ld [wWeatherRandomMapNumber], a
	ret

RandomRainMaps:
	const_def
	weather_map ROUTE_29
	weather_map ROUTE_30
	weather_map ROUTE_31
	weather_map ROUTE_32
	weather_map ROUTE_34
	weather_map ROUTE_35
	weather_map ROUTE_36
	weather_map ROUTE_37
	weather_map ROUTE_38
	weather_map ROUTE_39
	weather_map ROUTE_47
	weather_map ROUTE_48
	weather_map ROUTE_42
	weather_map ROUTE_43
	weather_map ROUTE_44
	db -1 ; end
	DEF NUM_WEATHER_MAPS EQU const_value

