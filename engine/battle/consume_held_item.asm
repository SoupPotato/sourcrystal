ConsumeHeldItem:
	push hl
	push de
	push bc
	farcall SwitchTurnCore
	farcall GetUserItem
	push hl
	farcall SwitchTurnCore
	pop hl
	ld b, [hl]
	farcall GetItemHeldEffect
	ld hl, ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	jr .done

.ok
	farcall SwitchTurnCore
	farcall ConsumeUserItem
	farcall SwitchTurnCore
.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/battle/held_consumables.asm"
