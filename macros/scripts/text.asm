text   EQUS "db TX_START,"    ; Start writing text.
next   EQUS "db \"<NEXT>\","  ; Move a line down.
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
page   EQUS "db \"@\","       ; Start a new Pokédex page.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

; TextCommands indexes (see home/text.asm)
	enum_start

	enum TX_START ; $00
MACRO text_start
	db TX_START
ENDM

	enum TX_RAM ; $01
MACRO text_from_ram
	db TX_RAM
	dw \1
ENDM

	enum TX_BCD ; $02
MACRO text_bcd
	db TX_BCD
	dw \1
	db \2
ENDM

	enum TX_MOVE ; $03
MACRO text_move
	db TX_MOVE
	dw \1
ENDM

	enum TX_BOX ; $04
MACRO text_box
	db TX_BOX
	dw \1
	db \2, \3
ENDM

	enum TX_LOW ; $05
MACRO text_low
	db TX_LOW
ENDM

	enum WAIT_BUTTON ; $06
MACRO text_waitbutton
	db WAIT_BUTTON
ENDM

	enum TX_SCROLL ; $07
MACRO text_scroll
	db TX_SCROLL
ENDM

	enum START_ASM ; $08
MACRO start_asm
	db START_ASM
ENDM

	enum TX_NUM ; $09
MACRO deciram
	db TX_NUM
	dw \1 ; address
	dn \2, \3 ; bytes, digits
ENDM

	enum TX_EXIT ; $0a
MACRO interpret_data
	db TX_EXIT
ENDM

	enum TX_SOUND_DEX_FANFARE_50_79 ; $0b
MACRO sound_dex_fanfare_50_79
	db TX_SOUND_DEX_FANFARE_50_79
ENDM

	enum TX_DOTS ; $0c
MACRO limited_interpret_data
	db TX_DOTS
	db \1
ENDM

	enum TX_LINK_WAIT_BUTTON ; $0d
MACRO link_wait_button
	db TX_LINK_WAIT_BUTTON
ENDM

	enum TX_SOUND_DEX_FANFARE_20_49 ; $0e
MACRO sound_dex_fanfare_20_49
	db TX_SOUND_DEX_FANFARE_20_49
ENDM

	enum TX_SOUND_ITEM ; $0f
MACRO sound_item
	db TX_SOUND_ITEM
ENDM

	enum TX_SOUND_CAUGHT_MON ; $10
MACRO sound_caught_mon
	db TX_SOUND_CAUGHT_MON
ENDM

	enum TX_SOUND_DEX_FANFARE_80_109 ; $11
MACRO sound_dex_fanfare_80_109
	db TX_SOUND_DEX_FANFARE_80_109
ENDM

	enum TX_SOUND_FANFARE ; $12
MACRO sound_fanfare
	db TX_SOUND_FANFARE
ENDM

	enum TX_SOUND_SLOT_MACHINE_START ; $13
MACRO sound_slot_machine_start
	db TX_SOUND_SLOT_MACHINE_START
ENDM

	enum TX_STRINGBUFFER ; $14
MACRO text_buffer
	db TX_STRINGBUFFER
	db \1
ENDM

	enum TX_DAY ; $15
MACRO current_day
	db TX_DAY
ENDM

	enum TX_FAR ; $16
MACRO text_jump
	db TX_FAR
	dw \1
	db BANK(\1)
ENDM
