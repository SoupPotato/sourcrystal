DummyPredef35:
DummyPredef36:
	ret

UpdateTimeOfDayPal::
	call UpdateTime
	ld a, [wTimeOfDay]
	ld [wCurTimeOfDay], a
	call GetTimePalette
	ld [wTimeOfDayPal], a
	ret


_TimeOfDayPals::
; return carry if pals are changed

; forced pals?
	ld hl, wTimeOfDayPalFlags
	bit 7, [hl]
	jr nz, .dontchange

; do we need to bother updating?
	ld a, [wTimeOfDay]
	ld hl, wCurTimeOfDay
	cp [hl]
	jr z, .dontchange

; if so, the time of day has changed
	ld a, [wTimeOfDay]
	ld [wCurTimeOfDay], a

; get palette id
	call GetTimePalette

; same palette as before?
	ld hl, wTimeOfDayPal
	cp [hl]
	jr z, .dontchange

; update palette id
	ld [wTimeOfDayPal], a

; save bg palette 7
	ld hl, wBGPals1 palette PAL_BG_TEXT

; save wram bank
	ld a, [rSVBK]
	ld b, a

	ld a, BANK(wBGPals1)
	ld [rSVBK], a

; push palette
	ld c, NUM_PAL_COLORS
.push
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push de
	dec c
	jr nz, .push

; restore wram bank
	ld a, b
	ld [rSVBK], a


; update sgb pals
	ld b, SCGB_MAPPALS
	call GetSGBLayout


; restore bg palette 7
	ld hl, wOBPals1 - 1 ; last byte in wBGPals1

; save wram bank
	ld a, [rSVBK]
	ld d, a

	ld a, BANK(wOBPals1)
	ld [rSVBK], a

; pop palette
	ld e, NUM_PAL_COLORS
.pop
	pop bc
	ld [hl], c
	dec hl
	ld [hl], b
	dec hl
	dec e
	jr nz, .pop

; restore wram bank
	ld a, d
	ld [rSVBK], a

; update palettes
	call _UpdateTimePals
	call DelayFrame

; successful change
	scf
	ret

.dontchange
; no change occurred
	and a
	ret


_UpdateTimePals::
	ld c, $9 ; normal
	call GetTimePalFade
	call DmgToCgbTimePals
	ret

FadeInPalettes::
	ld c, $12
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsDecHL
	ret

FadeOutPalettes::
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsIncHL
	ret

BattleTowerFade:
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
.asm_8c09c
	call DmgToCgbTimePals
	inc hl
	inc hl
	inc hl
	ld c, $7
	call DelayFrames
	dec b
	jr nz, .asm_8c09c
	ret

FadeInQuickly:
	ld c, $0
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsIncHL
	ret

FadeBlackQuickly:
	ld c, $9
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsDecHL
	ret


FillWhiteBGColor:
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ld [rSVBK], a

	ld hl, wBGPals1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, wBGPals1 + 1 palettes
	ld c, 6
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 6
	inc hl
endr
	dec c
	jr nz, .loop

	pop af
	ld [rSVBK], a
	ret

ReplaceTimeOfDayPals:
	ld a, [wMapTimeOfDay]
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .not_dark
	ld a, DARKNESS_PALSET
	jr .done

.not_dark:
	ld hl, .BrightnessLevels
	maskbits NUM_MAP_PALETTES
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
.done:
	ld [wTimeOfDayPalset], a
	ret

.BrightnessLevels:
; actual palettes used when time is
; EVE_F, NITE_F, DAY_F, MORN_F
	dc EVE_F,      NITE_F,     DAY_F,      MORN_F     ; PALETTE_AUTO
	dc DAY_F,      DAY_F,      DAY_F,      DAY_F      ; PALETTE_DAY
	dc NITE_F,     NITE_F,     NITE_F,     NITE_F     ; PALETTE_NITE
	dc MORN_F,     MORN_F,     MORN_F,     MORN_F     ; PALETTE_MORN
	dc EVE_F,      EVE_F,      EVE_F,      EVE_F      ; PALETTE_EVE

GetTimePalette:
	jumptable .TimePalettes, wTimeOfDay

.TimePalettes:
	dw .MorningPalette  ; MORN_F
	dw .DayPalette      ; DAY_F
	dw .NitePalette     ; NITE_F
	dw .EveningPalette  ; EVE_F

.MorningPalette:
	ld a, [wTimeOfDayPalset]
	and %00000011
	ret

.DayPalette:
	ld a, [wTimeOfDayPalset]
	and %00001100
	srl a
	srl a
	ret

.NitePalette:
	ld a, [wTimeOfDayPalset]
	and %00110000
	swap a
	ret

.EveningPalette:
	ld a, [wTimeOfDayPalset]
	and %11000000
	rlca
	rlca
	ret


DmgToCgbTimePals:
	push hl
	push de
	ld a, [hli]
	call DmgToCgbBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call DmgToCgbObjPals
	pop de
	pop hl
	ret

ConvertTimePalsIncHL:
.loop
	call DmgToCgbTimePals
	inc hl
	inc hl
	inc hl
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret

ConvertTimePalsDecHL:
.loop
	call DmgToCgbTimePals
	dec hl
	dec hl
	dec hl
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret


GetTimePalFade:
; check cgb
	ld a, [hCGB]
	and a
	jr nz, .cgb

; else: dmg

; index
	ld a, [wTimeOfDayPal]
	and %11

; get fade table
	push bc
	ld c, a
	ld b, $0
	ld hl, .dmgfades
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

; get place in fade table
	ld b, $0
	add hl, bc
	ret

.cgb
	ld hl, .cgbfade
	ld b, $0
	add hl, bc
	ret

.dmgfades
	dw .morn
	dw .day
	dw .nite
	dw .darkness

.morn
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11100100, %11100100
	db %11100100, %11010000, %11010000
	db %10010000, %10000000, %10000000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000

.day
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11100100, %11100100
	db %11100100, %11010000, %11010000
	db %10010000, %10000000, %10000000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000

.nite
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11100100, %11100100
	db %11101001, %11010000, %11010000
	db %10010000, %10000000, %10000000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000

.darkness
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111111
	db %11111110, %11100100, %11111111
	db %11111101, %11010000, %11111111
	db %11111101, %10000000, %11111111
	db %00000000, %01000000, %00000000
	db %00000000, %00000000, %00000000

.cgbfade
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11111001, %11111001
	db %11100100, %11100100, %11100100
	db %10010000, %10010000, %10010000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000
