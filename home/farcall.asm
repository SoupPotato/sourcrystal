FarCall_de::
; Call a:de.
; Preserves other registers.
; TODO: Get rid of this, it's only used in two places
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _de_
	jr ReturnFarCall

AnonBankPush::
	ldh [hFarCallSavedA], a
	ld a, h
	ldh [hFarCallSavedH], a
	ld a, l
	ldh [hFarCallSavedL], a
	pop hl
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	jr _DoFarCall_BankInA

FarCall_hl::
; Call a:hl.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	jr _DoFarCall

FarPointerCall::
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	ldh [hTempBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr _DoFarCall

StackCallInBankB:
	ld a, b
StackCallInBankA:
	ldh [hTempBank], a
	ld a, h
	ldh [hFarCallSavedH], a
	ld a, l
	ldh [hFarCallSavedL], a
	pop hl
	ldh a, [hROMBank]
	push af
	jr _DoFarCall

RstFarCall::
; Call the following dba pointer on the stack.
; Preserves a, bc, de, hl
	ldh [hFarCallSavedA], a
	ld a, h
	ldh [hFarCallSavedH], a
	ld a, l
	ldh [hFarCallSavedL], a
	pop hl
	ld a, [hli]
	ldh [hTempBank], a
	ld a, [hli]
	bit 7, [hl]
	jr nz, .farjp
	inc hl
	push hl
	dec hl
.farjp
	ld h, [hl]
	ld l, a
	res 7, h
	ldh a, [hROMBank]
	push af
_DoFarCall:
	ldh a, [hTempBank]
	and $7f
_DoFarCall_BankInA:
	rst Bankswitch
	call RetrieveAHLAndCallFunction
ReturnFarCall::
	ldh [hFarCallSavedA], a
	; We want to retain the contents of f.
	; To accomplish this, mess with the stack a bit...
	push af
	push hl
	ld hl, sp+$2 ; a flags
	ld a, [hli]
	inc l ; faster than inc hl (stack is always c000-c100...)
	ld [hl], a ; write to flags
	pop hl
	pop af
	pop af
	rst Bankswitch
	ldh a, [hFarCallSavedA]
	ret

RunFunctionInWRA6::
	ld a, BANK(wDecompressScratch)
StackCallInWRAMBankA::
	ldh [hTempBank], a
	ld a, h
	ldh [hFarCallSavedH], a
	ld a, l
	ldh [hFarCallSavedL], a
	pop hl
	ldh a, [rSVBK]
	push af
	ldh a, [hTempBank]
	ldh [rSVBK], a
	call RetrieveAHLAndCallFunction
	ldh [hTempBank], a

	; Preserve flags.
	push af
	push hl
	ld hl, sp+$2 ; a flags
	ld a, [hli]
	inc l ; faster than inc hl (stack is always c000-c100...)
	ld [hl], a ; write to flags
	pop hl
	pop af
	pop af
	ldh [rSVBK], a
	ldh a, [hTempBank]
	ret

RetrieveAHLAndCallFunction:
	push hl
	ld hl, hFarCallSavedHL
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hFarCallSavedA]
	ret

Old_FarCall_hl::
; Vanilla's Farcall
; Call a:hl
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call FarCall_JumpToHL
	; fallthrough

Old_ReturnFarCall::
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.
	ld a, b
	ld [wFarCallBC], a
	ld a, c
	ld [wFarCallBC + 1], a

; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch

; Restore the contents of bc.
	ld a, [wFarCallBC]
	ld b, a
	ld a, [wFarCallBC + 1]
	ld c, a
	ret

FarCall_JumpToHL:
	jp hl
