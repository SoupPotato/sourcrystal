; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db CUT_PAGER, LEFTOVERS
	db FLASH_PAGER, BITTER_BERRY
	db SURF_PAGER, GOLD_BERRY
	db STRNGTHPAGER, BERRY
	db FLY_PAGER, BERRY
	db WRLPOOLPAGER, BERRY
	db ITEM_87, BERRY
	db ITEM_BE, BERRY
	db ITEM_C3, BERRY
	db ITEM_DC, BERRY
	db ITEM_FA, BERRY
	db TM_PSYCH_UP, BERRY
	db TM_ICE_PUNCH, BERRY
	db TM_DETECT, BERRY
	db -1,      BERRY
	db 0 ; end
