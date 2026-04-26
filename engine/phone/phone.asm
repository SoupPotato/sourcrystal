; `c` = Which contact to add. Index starts with PHONE_00.
AddPhoneNumber::
	push bc
		call _CheckCellNum
	pop bc
	jr c, .already_exists
	push de
		ld e, c
		dec e
		ld d, 0
		ld b, SET_FLAG
		push hl
			ld hl, wPhoneList
			call FlagAction
		pop hl
	pop de
	xor a
	ret

.already_exists
	scf
	ret

; `c` = Which contact to delete. Index starts with PHONE_00.
DelCellNum::
	push bc
		call _CheckCellNum
	pop bc
	jr nc, .not_in_list
	push de
		ld e, c
		dec e
		ld d, 0
		ld b, RESET_FLAG
		push hl
			ld hl, wPhoneList
			call FlagAction
		pop hl
	pop de
	xor a
	ret

.not_in_list
	scf
	ret

; `c` = Which contact to check
; It's using the index that starts with PHONE_00, I think.
;
; Returns carry if the contact is in your list.
CheckCellNum::
_CheckCellNum:
	push de
	push hl
		ld hl, wPhoneList
		ld e, c
		dec e
		ld d, 0
		ld b, CHECK_FLAG
		call FlagAction
	pop hl
	pop de
	ld a, c
	and a
; not found, so carry is not set
	ret z
	scf
	ret

INCLUDE "data/phone/permanent_numbers.asm"

BrokenPlaceFarString:
; This routine is not in bank 0 and will fail or crash if called.
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call PlaceString

	pop af
	rst Bankswitch
	ret

CheckPhoneCall::
; Check if the phone is ringing in the overworld.

	call CheckStandingOnEntrance
	jr z, .no_call

	call .timecheck
	jr nc, .no_call

	; 50% chance for a call
	call Random
	ld b, a
	and %01111111
	cp b
	jr nz, .no_call

	call GetMapPhoneService
	and a
	jr nz, .no_call

	call ChooseRandomCaller
	jr nc, .no_call

	ld e, a
	call LoadCallerScript
	ld a, BANK(Script_ReceivePhoneCall)
	ld hl, Script_ReceivePhoneCall
	call CallScript
	scf
	ret

.no_call
	xor a
	ret

.timecheck
	farcall CheckReceiveCallTimer
	ret

CheckPhoneContactTimeOfDay:
	push hl
	push bc
	push de
	push af

	farcall CheckTime
	pop af
	and ANYTIME
	and c

	pop de
	pop bc
	pop hl
	ret

; Sets carry if we have someone calling us.
ChooseRandomCaller:
; Check the time and save it for the "should call" check
; later on.
	farcall CheckTime
	ld a, c
	ld [wCheckedTime], a

; Get the list of all contacts we have. wAvailableCallers is available but we're
; not gonna use that.
	ld a, BANK(sSortedPhoneContacts)
	call OpenSRAM
	call SortPhoneContacts
; Right now sSortedPhoneContacts starts at 00 so we can use this to avoid
; subtracting 16 bit numbers or whatever. `hl` is at the end of the list plus one.
	assert LOW(sSortedPhoneContacts) == $00
; So getting the length is as simple as:
	ld c, l

; Sample a random number.
	call Random
; Get the modulo (at `a`) of this over how many contacts we actually have
; (already loaded at `c`).
	ldh a, [hRandomAdd]
	call SimpleDivide

	assert LOW(sSortedPhoneContacts) == $00
	ld l, a
	ld h, HIGH(sSortedPhoneContacts)

; Well we got a contact ID...
; and one that starts with PHONE_00 too
; Received phone contact will be in `e` because that's what the vanilla code
; asks for or something.
	ld e, [hl]

; ...So we're done with accessing SRAM
	call CloseSRAM

; Check if it's the right time of day for them to be calling us
	ld hl, PhoneContacts + PHONE_CONTACT_SCRIPT2_TIME
	ld bc, PHONE_CONTACT_SIZE
	ld a, e
	call AddNTimes
	ld a, [wCheckedTime]
	and [hl]
; Not the right time
	ret z

; If we're at the right place
	ld bc, PHONE_CONTACT_MAP_GROUP - PHONE_CONTACT_SCRIPT2_TIME
	add hl, bc
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .no_call

	inc hl ; PHONE_CONTACT_MAP_NUMBER
	ld a, [wMapNumber]
	cp [hl]
; Almost the right place that is... calls initiate in the same map group
; but not the map number itself, because that'd be kind of pointless?
	jr z, .no_call

; `e` should remain intact here, which is the caller ID we got.
	ld a, e
	scf
	ret

.no_call
	and a
	ret

CheckSpecialPhoneCall::
	ld a, [wSpecialPhoneCallID]
	and a
	jr z, .NoPhoneCall

	dec a
	ld c, a
	ld b, 0
	ld hl, SpecialPhoneCallList
	ld a, SPECIALCALL_SIZE
	call AddNTimes
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	jr nc, .NoPhoneCall

	call .DoSpecialPhoneCall
	inc hl
	inc hl
	ld a, [hli]
	ld e, a
	push hl
	call LoadCallerScript
	pop hl
	ld de, wCallerContact + PHONE_CONTACT_SCRIPT2_BANK
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, BANK(.script)
	ld hl, .script
	call CallScript
	scf
	ret
.NoPhoneCall:
	xor a
	ret

.script
	pause 30
	sjump Script_ReceivePhoneCall

.DoSpecialPhoneCall:
	ld a, [wSpecialPhoneCallID]
	dec a
	ld c, a
	ld b, 0
	ld hl, SpecialPhoneCallList
	ld a, SPECIALCALL_SIZE
	call AddNTimes
	ret

SpecialCallOnlyWhenOutside:
	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr z, .outside
	xor a
	ret

.outside
	scf
	ret

SpecialCallWhereverYouAre:
	scf
	ret

MakePhoneCallFromPokegear:
	; Don't do the call if you're in a link communication
	ld a, [wLinkMode]
	and a
	jr nz, .OutOfArea
	; If you're in an area without phone service, don't do the call
	call GetMapPhoneService
	and a
	jr nz, .OutOfArea
	; If the person can't take a call at that time, don't do the call
	ld a, b
	ld [wCurCaller], a
	ld hl, PhoneContacts
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, PHONE_CONTACT_SCRIPT1_TIME
	add hl, de
	ld a, [hl]
	call CheckPhoneContactTimeOfDay
	jr z, .OutOfArea
	; If we're in the same map as the person we're calling,
	; use the "Just talk to that person" script.
	ld hl, PHONE_CONTACT_MAP_GROUP
	add hl, de
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .GetPhoneScript
	ld hl, PHONE_CONTACT_MAP_NUMBER
	add hl, de
	ld a, [wMapNumber]
	cp [hl]
	jr nz, .GetPhoneScript
	ld b, BANK(PhoneScript_JustTalkToThem)
	ld hl, PhoneScript_JustTalkToThem
	jr .DoPhoneCall

.GetPhoneScript:
	ld hl, PHONE_CONTACT_SCRIPT1_BANK
	add hl, de
	ld b, [hl]
	ld hl, PHONE_CONTACT_SCRIPT1_ADDR
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr .DoPhoneCall

.OutOfArea:
	ld b, BANK(LoadOutOfAreaScript)
	ld de, LoadOutOfAreaScript
	call ExecuteCallbackScript
	ret

.DoPhoneCall:
	ld a, b
	ld [wPhoneScriptBank], a
	ld a, l
	ld [wPhoneCaller], a
	ld a, h
	ld [wPhoneCaller + 1], a
	ld b, BANK(LoadPhoneScriptBank)
	ld de, LoadPhoneScriptBank
	call ExecuteCallbackScript
	ret

LoadPhoneScriptBank:
	memcall wPhoneScriptBank
	endcallback

LoadOutOfAreaScript:
	scall PhoneOutOfAreaScript
	endcallback

LoadCallerScript:
	ld a, e
	ld [wCurCaller], a
	and a
	jr nz, .actualcaller
	ld a, BANK(WrongNumber)
	ld hl, WrongNumber
	jr .proceed

.actualcaller
	ld hl, PhoneContacts
	ld bc, PHONE_CONTACT_SIZE
	ld a, e
	call AddNTimes
	ld a, BANK(PhoneContacts)
.proceed
	ld de, wCallerContact
	ld bc, PHONE_CONTACT_SIZE
	call FarCopyBytes
	ret

WrongNumber:
	db TRAINER_NONE, PHONE_00
	dba .script
.script
	writetext .PhoneWrongNumberText
	end
.PhoneWrongNumberText:
	text_far _PhoneWrongNumberText
	text_end

Script_ReceivePhoneCall:
	reanchormap
	callasm RingTwice_StartCall
	memcall wCallerContact + PHONE_CONTACT_SCRIPT2_BANK
	waitbutton
	callasm HangUp
	closetext
	callasm InitCallReceiveDelay
	end

Script_SpecialBillCall::
	callasm .LoadBillScript
	sjump Script_ReceivePhoneCall

.LoadBillScript:
	ld e, PHONE_BILL
	jp LoadCallerScript

Script_SpecialElmCall: ; unreferenced
	callasm .LoadElmScript
	pause 30
	sjump Script_ReceivePhoneCall

.LoadElmScript:
	ld e, PHONE_ELM
	jp LoadCallerScript

RingTwice_StartCall:
	call .Ring
	call .Ring
	farcall StubbedTrainerRankings_PhoneCalls
	ret

.Ring:
	call Phone_StartRinging
	call Phone_Wait20Frames
	call .CallerTextboxWithName
	call Phone_Wait20Frames
	call Phone_CallerTextbox
	call Phone_Wait20Frames
	call .CallerTextboxWithName
	ret

.CallerTextboxWithName:
	ld a, [wCurCaller]
	ld b, a
	call Phone_TextboxWithName
	ret

PhoneCall::
	ld a, b
	ld [wPhoneScriptBank], a
	ld a, e
	ld [wPhoneCaller], a
	ld a, d
	ld [wPhoneCaller + 1], a
	call .Ring
	call .Ring
	farcall StubbedTrainerRankings_PhoneCalls
	ret

.Ring:
	call Phone_StartRinging
	call Phone_Wait20Frames
	call .CallerTextboxWithName
	call Phone_Wait20Frames
	call Phone_CallerTextbox
	call Phone_Wait20Frames
	call .CallerTextboxWithName
	ret

.CallerTextboxWithName:
	call Phone_CallerTextbox
	hlcoord 1, 2
	ld [hl], "☎"
	inc hl
	inc hl
; BUG: The unused phonecall script command may crash (see docs/bugs_and_glitches.md)
	ld a, [wPhoneScriptBank]
	ld b, a
	ld a, [wPhoneCaller]
	ld e, a
	ld a, [wPhoneCaller + 1]
	ld d, a
	call BrokenPlaceFarString
	ret

Phone_NoSignal:
	ld de, SFX_NO_SIGNAL
	call PlaySFX
	jr Phone_CallEnd

HangUp::
	call HangUp_Beep
	call HangUp_Wait20Frames
Phone_CallEnd:
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	ret

HangUp_ShutDown: ; unreferenced
	ld de, SFX_SHUT_DOWN_PC
	call PlaySFX
	ret

HangUp_Beep:
	ld hl, PhoneClickText
	call PrintText
	ld de, SFX_HANG_UP
	call PlaySFX
	ret

PhoneClickText:
	text_far _PhoneClickText
	text_end

HangUp_BoopOn:
	ld hl, PhoneEllipseText
	call PrintText
	ret

PhoneEllipseText:
	text_far _PhoneEllipseText
	text_end

HangUp_BoopOff:
	call SpeechTextbox
	ret

Phone_StartRinging:
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	call Phone_CallerTextbox
	call UpdateSprites
	farcall PhoneRing_CopyTilemapAtOnce
	ret

HangUp_Wait20Frames:
	jr Phone_Wait20Frames

Phone_Wait20Frames:
	ld c, 20
	call DelayFrames
	farcall PhoneRing_CopyTilemapAtOnce
	ret

Phone_TextboxWithName:
	push bc
	call Phone_CallerTextbox
	hlcoord 1, 1
	ld [hl], "☎"
	inc hl
	inc hl
	ld d, h
	ld e, l
	pop bc
	call GetCallerClassAndName
	ret

Phone_CallerTextbox:
	call ClearSpritesUnderPhoneCall
	hlcoord 0, 0
	ld b, 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ret

GetCallerClassAndName:
	ld h, d
	ld l, e
	ld a, b
	call GetCallerTrainerClass
	call GetCallerName
	ret

GetCallerClassAndName_Gear:
	ld h, d
	ld l, e
	ld a, b
	push af ; a = phone contact ID
	call GetCallerTrainerClass
	pop af
	call GetCallerName_Gear
	ret

CheckCanDeletePhoneNumber:
	ld a, c
	call GetCallerTrainerClass
	ld a, c
	; and a
	ret nz
	ld a, b
	cp PHONECONTACT_MOM
	ret z
	cp PHONECONTACT_ELM
	ret z
	ld c, $1
	ret

GetCallerTrainerClass:
	push hl
	ld hl, PhoneContacts + PHONE_CONTACT_TRAINER_CLASS
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	ret

GetCallerName:
	ld a, c
	and a
	jr z, .NotTrainer

	call Phone_GetTrainerName
	push hl
	push bc
	call PlaceString
	ld a, ":"
	ld [bc], a
	pop bc
	pop hl
	ld de, SCREEN_WIDTH + 3
	add hl, de
	call Phone_GetTrainerClassName
	call PlaceString
	ret

.NotTrainer:
	push hl
	ld c, b
	ld b, 0
	ld hl, NonTrainerCallerNames
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	call PlaceString
	ret

INCLUDE "data/phone/non_trainer_names.asm"

GetCallerName_Gear:
	; standard check
	push af
		ld a, c
		and a
		jp z, .not_trainer

		; move WRAM to scratch space
		ldh a, [rSVBK]
		ldh [hTempBank], a ; is this safe to use?
		ld a, BANK(wScratchPokegearPhoneVWF)
		ldh [rSVBK], a
	pop af
	
	; render vwf
	push hl
	push bc
		ld hl, PhoneTimesOfDay
		add a, l
		ld l, a
		ld a, h
		adc 0
		ld h, a
		ld a, [hl]
		and a
		jr z, .no_time_specified
		; first nybble = day of week
		ld c, a
		push bc
			and a, %11110000
			swap a
			dec a
			add a
			ld hl, .StringTable1
			add l
			ld l, a
			ld a, h
			adc 0
			ld h, a
			ld a, [hli]
			ld e, a
			ld d, [hl]
			; de = string to be printed
			call .clear_scratch
			ld hl, wScratchPokegearPhoneVWF
			call .print
			ld e, c
		pop bc
		; second nybble = time of day
		ld a, c
		and a, %00001111
		dec a
		add a
		ld hl, .StringTable2
		add l
		ld l, a
		ld a, h
		adc 0
		ld h, a
		ld a, [hli]
		ld c, e
		ld e, a
		ld d, [hl]
		ld hl, wScratchPokegearPhoneVWF
		call .print
	; actually transfer to VRAM
.transfer_vram
		push de
			ld a, [wPokegearPhoneDisplayPosition]
			; switch-case, that seems less error-prone
			; than calculation...
			and a
			jr z, .zero
			cp 1
			jr z, .one
			cp 2
			jr z, .two
			; 3+
			ld hl, vTiles2 tile ($60 + (6 * 3))
			jr .got_location
.two
			ld hl, vTiles2 tile ($60 + (6 * 2))
			jr .got_location
.one
			ld hl, vTiles2 tile ($60 + 6)
			jr .got_location
.zero
			ld hl, vTiles2 tile $60
			; hl = location to print
			;      0x9600 + ([wPokegearPhoneDisplayPosition] * 6)
.got_location
			ld c, 6 ; occupy this many tiles
			ld de, wScratchPokegearPhoneVWF
			call Request2bpp
		pop de
	pop bc
	pop hl
	ldh a, [hTempBank]
	ldh [rSVBK], a
	jr .print_everything

.no_time_specified
	call .clear_scratch
	jr .transfer_vram

.clear_scratch
		ld hl, wScratchPokegearPhoneVWF
		ld c, 6 tiles
		xor a
.clear_set
		ld [hli], a
		dec c
		ret z
		jr .clear_set

.print_everything
	ld a, c
	call Phone_GetTrainerName
	push hl
	push bc
	call PlaceString
	ld a, ":"
	ld [bc], a
	pop bc
	pop hl
	push hl
; print the tiles we just made
	ld a, 10
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	; a <- a * 6 + $60
	ld a, [wPokegearPhoneDisplayPosition]
	ld e, a
	add a
	add a
	add e
	add e
	add $60
rept 6
	ld [hli], a
	inc a
endr
	pop hl
	ld de, SCREEN_WIDTH + 3
	add hl, de
	call Phone_GetTrainerClassName
	call PlaceString
	ret

.not_trainer
	pop af
	jp GetCallerName.NotTrainer

.print
	ld a, [de]
	call PokegearPlaceNextVWFChar
	ret z
	jr .print

.StringTable1:
	dw .Sun
	dw .Mon
	dw .Tue
	dw .Wed
	dw .Thu
	dw .Fri
	dw .Sat
.Sun: db "[Sun]@"
.Mon: db "[Mon]@"
.Tue: db "[Tue]@"
.Wed: db "[Wed]@"
.Thu: db "[Thu]@"
.Fri: db "[Fri]@"
.Sat: db "[Sat]@"

.StringTable2:
	dw .Morn
	dw .Day
	dw .Nite
	dw .Eve
.Morn: db "[Morn]@"
.Day: db "[Noon]@"
.Nite: db "[Nite]@"
.Eve: db "[Eve]@"

Phone_GetTrainerName:
	push hl
	push bc
	farcall GetTrainerName
	pop bc
	pop hl
	ret

Phone_GetTrainerClassName:
	push hl
	push bc
	farcall GetTrainerClassName
	pop bc
	pop hl
	ret

GetCallerLocation:
	ld a, [wCurCaller]
	call GetCallerTrainerClass
	ld d, c
	ld e, b
	push de
	ld a, [wCurCaller]
	ld hl, PhoneContacts + PHONE_CONTACT_MAP_GROUP
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld b, [hl]
	inc hl
	ld c, [hl]
	push bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	pop bc
	pop de
	ret

INCLUDE "data/phone/phone_contacts.asm"

INCLUDE "data/phone/special_calls.asm"

PhoneTimesOfDay:
INCLUDE "data/phone/phone_times_of_day.asm"

PhoneOutOfAreaScript:
	writetext PhoneOutOfAreaText
	end

PhoneOutOfAreaText:
	text_far _PhoneOutOfAreaText
	text_end

PhoneScript_JustTalkToThem:
	writetext PhoneJustTalkToThemText
	end

PhoneJustTalkToThemText:
	text_far _PhoneJustTalkToThemText
	text_end

PhoneThankYouTextScript: ; unreferenced
	writetext PhoneThankYouText
	end

PhoneThankYouText:
	text_far _PhoneThankYouText
	text_end
