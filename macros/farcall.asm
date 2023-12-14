; Far calls to another bank

MACRO farcall ; bank, address
	assert !(\1 & $8000), "cannot `farcall \1` in RAM"
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `farcall \1`"
ENDM

MACRO newfarcall ; bank, address
	assert !(\1 & $8000), "cannot `newfarcall \1` in RAM"
	; We can't replace previous farcalls because it breaks saves...
	rst BetterFarCall
	dbw BANK(\1), \1
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `newfarcall \1`"
ENDM

MACRO newfarjp
	assert !(\1 & $8000), "cannot `newfarjp \1` in RAM"
	rst BetterFarCall
	dbw BANK(\1) | $80, \1
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `newfarjp \1`"
ENDM

MACRO callfar ; address, bank
	assert !(\1 & $8000), "cannot `callfar \1` in RAM"
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `callfar \1`"
ENDM

MACRO homecall
	ldh a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
	assert warn, BANK(\1) != 0, "unnecessary `homecall \1`"
ENDM
