; overworld_sprite struct members (see data/sprites/sprites.asm)
rsreset
DEF SPRITEDATA_ADDR    rw ; 0
DEF SPRITEDATA_SIZE    rb ; 2
DEF SPRITEDATA_BANK    rb ; 3
DEF SPRITEDATA_TYPE    rb ; 4
DEF SPRITEDATA_PALETTE rb ; 5
DEF NUM_SPRITEDATA_FIELDS EQU _RS

; sprite types
	const_def 1
	const WALKING_SPRITE  ; 1
	const STANDING_SPRITE ; 2
	const STILL_SPRITE    ; 3

; object_events that set a pal value will override the sprite's default palette
DEF PAL_NPC_DEFAULT EQU 0

MACRO ow_npc_pal_const
	const PAL_OW_\1
	DEF PAL_NPC_\1 EQU PAL_OW_\1 + 1
ENDM

; sprite palettes
; MapObjectPals indexes (see gfx/overworld/npc_sprites.pal)
	const_def
	ow_npc_pal_const RED               ; 00
	ow_npc_pal_const BLUE              ; 01
	ow_npc_pal_const GREEN             ; 02
	ow_npc_pal_const BROWN             ; 03
	ow_npc_pal_const PURPLE            ; 04
	ow_npc_pal_const GRAY              ; 05
	ow_npc_pal_const PINK              ; 06
	ow_npc_pal_const TEAL              ; 07
	ow_npc_pal_const YELLOW            ; 08
	ow_npc_pal_const ORANGE            ; 09
	ow_npc_pal_const AZURE             ; 0a
	ow_npc_pal_const WHITE             ; 0b
	ow_npc_pal_const BLACK             ; 0c
	ow_npc_pal_const POKE_BALL         ; 0d (red)
	ow_npc_pal_const DECO_ITEM         ; 0e (blue)
	ow_npc_pal_const KEY_ITEM          ; 0f (green)
	ow_npc_pal_const TREE              ; 10
DEF NUM_OW_TIME_OF_DAY_PALS EQU const_value
	ow_npc_pal_const EMOTE_GRAY        ; 11
	ow_npc_pal_const EMOTE_BLACK       ; 12
	ow_npc_pal_const EMOTE_GREEN       ; 13
	ow_npc_pal_const EMOTE_PURPLE      ; 14
	ow_npc_pal_const EMOTE_RED         ; 15
	ow_npc_pal_const EMOTE_ORANGE      ; 16
	ow_npc_pal_const EMOTE_BLUE        ; 17
DEF NUM_OW_INDIVIDUAL_PALS EQU const_value - NUM_OW_TIME_OF_DAY_PALS
DEF FIRST_COPY_BG_PAL EQU const_value
	ow_npc_pal_const COPY_BG_GRAY      ; 18
	ow_npc_pal_const COPY_BG_RED       ; 19
	ow_npc_pal_const COPY_BG_GREEN     ; 1a
	ow_npc_pal_const COPY_BG_WATER     ; 1b
	ow_npc_pal_const COPY_BG_YELLOW    ; 1c
	ow_npc_pal_const COPY_BG_BROWN     ; 1d
	ow_npc_pal_const COPY_BG_ROOF      ; 1e
	ow_npc_pal_const COPY_BG_TEXT      ; 1f
DEF NUM_OW_BG_COPY_PALS EQU const_value - NUM_OW_INDIVIDUAL_PALS
DEF NUM_OW_PALS EQU const_value

DEF PAL_OW_ROCK EQU PAL_OW_BROWN
DEF PAL_NPC_ROCK EQU PAL_NPC_BROWN
DEF PAL_OW_GREY EQU PAL_OW_GRAY
DEF PAL_NPC_SILVER EQU PAL_NPC_GRAY
DEF PAL_OW_SILVER EQU PAL_OW_GRAY
