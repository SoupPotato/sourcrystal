; ScriptCommandTable indexes (see engine/overworld/scripting.asm)
	enum_start

	enum scall_command ; $00
MACRO scall
	db scall_command
	dw \1 ; pointer
ENDM

	enum farscall_command ; $01
MACRO farscall
	db farscall_command
	dba \1
ENDM

	enum ptcall_command ; $02
MACRO ptcall
	db ptcall_command
	dw \1 ; pointer
ENDM

	enum jump_command ; $03
MACRO jump
	db jump_command
	dw \1 ; pointer
ENDM

	enum farjump_command ; $04
MACRO farjump
	db farjump_command
	dba \1
ENDM

	enum ptjump_command ; $05
MACRO ptjump
	db ptjump_command
	dw \1 ; pointer
ENDM

	enum ifequal_command ; $06
MACRO ifequal
	db ifequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum ifnotequal_command ; $07
MACRO ifnotequal
	db ifnotequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum iffalse_command ; $08
MACRO iffalse
	db iffalse_command
	dw \1 ; pointer
ENDM

	enum iftrue_command ; $09
MACRO iftrue
	db iftrue_command
	dw \1 ; pointer
ENDM

	enum ifgreater_command ; $0a
MACRO ifgreater
	db ifgreater_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum ifless_command ; $0b
MACRO ifless
	db ifless_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum jumpstd_command ; $0c
MACRO jumpstd
	db jumpstd_command
	dw \1 ; predefined_script
ENDM

	enum callstd_command ; $0d
MACRO callstd
	db callstd_command
	dw \1 ; predefined_script
ENDM

	enum callasm_command ; $0e
MACRO callasm
	db callasm_command
	dba \1
ENDM

	enum special_command ; $0f
MACRO special
	db special_command
	dw (\1Special - SpecialsPointers) / 3
ENDM

	enum ptcallasm_command ; $10
MACRO ptcallasm
	db ptcallasm_command
	dw \1 ; asm
ENDM

	enum checkmapscene_command ; $11
MACRO checkmapscene
	db checkmapscene_command
	map_id \1 ; map
ENDM

	enum setmapscene_command ; $12
MACRO setmapscene
	db setmapscene_command
	map_id \1 ; map
	db \2 ; scene_id
ENDM

	enum checkscene_command ; $13
MACRO checkscene
	db checkscene_command
ENDM

	enum setscene_command ; $14
MACRO setscene
	db setscene_command
	db \1 ; scene_id
ENDM

	enum writebyte_command ; $15
MACRO writebyte
	db writebyte_command
	db \1 ; value
ENDM

	enum addvar_command ; $16
MACRO addvar
	db addvar_command
	db \1 ; value
ENDM

	enum random_command ; $17
MACRO random
	db random_command
	db \1 ; input
ENDM

	enum checkver_command ; $18
MACRO checkver
	db checkver_command
ENDM

	enum copybytetovar_command ; $19
MACRO copybytetovar
	db copybytetovar_command
	dw \1 ; address
ENDM

	enum copyvartobyte_command ; $1a
MACRO copyvartobyte
	db copyvartobyte_command
	dw \1 ; address
ENDM

	enum loadvar_command ; $1b
MACRO loadvar
	db loadvar_command
	dw \1 ; address
	db \2 ; value
ENDM

	enum checkcode_command ; $1c
MACRO checkcode
	db checkcode_command
	db \1 ; variable_id
ENDM

	enum writevarcode_command ; $1d
MACRO writevarcode
	db writevarcode_command
	db \1 ; variable_id
ENDM

	enum writecode_command ; $1e
MACRO writecode
	db writecode_command
	db \1 ; variable_id
	db \2 ; value
ENDM

	enum giveitem_command ; $1f
MACRO giveitem
if _NARG == 1
	giveitem \1, 1
else
	db giveitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	enum takeitem_command ; $20
MACRO takeitem
if _NARG == 1
	takeitem \1, 1
else
	db takeitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	enum checkitem_command ; $21
MACRO checkitem
	db checkitem_command
	db \1 ; item
ENDM

	enum givemoney_command ; $22
MACRO givemoney
	db givemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum takemoney_command ; $23
MACRO takemoney
	db takemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum checkmoney_command ; $24
MACRO checkmoney
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum givecoins_command ; $25
MACRO givecoins
	db givecoins_command
	dw \1 ; coins
ENDM

	enum takecoins_command ; $26
MACRO takecoins
	db takecoins_command
	dw \1 ; coins
ENDM

	enum checkcoins_command ; $27
MACRO checkcoins
	db checkcoins_command
	dw \1 ; coins
ENDM

	enum addcellnum_command ; $28
MACRO addcellnum
	db addcellnum_command
	db \1 ; person
ENDM

	enum delcellnum_command ; $29
MACRO delcellnum
	db delcellnum_command
	db \1 ; person
ENDM

	enum checkcellnum_command ; $2a
MACRO checkcellnum
	db checkcellnum_command
	db \1 ; person
ENDM

	enum checktime_command ; $2b
MACRO checktime
	db checktime_command
	db \1 ; time
ENDM

	enum checkpoke_command ; $2c
MACRO checkpoke
	db checkpoke_command
	db \1 ; pkmn
ENDM

	enum givepoke_command ; $2d
MACRO givepoke
if _NARG == 2
	givepoke \1, \2, NO_ITEM, FALSE
elif _NARG == 3
	givepoke \1, \2, \3, FALSE
else
	db givepoke_command
	db \1 ; pokemon
	db \2 ; level
	db \3 ; item
	db \4 ; trainer
if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
endc
endc
ENDM

	enum giveegg_command ; $2e
MACRO giveegg
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
ENDM

	enum givepokemail_command ; $2f
MACRO givepokemail
	db givepokemail_command
	dw \1 ; pointer
ENDM

	enum checkpokemail_command ; $30
MACRO checkpokemail
	db checkpokemail_command
	dw \1 ; pointer
ENDM

	enum checkevent_command ; $31
MACRO checkevent
	db checkevent_command
	dw \1 ; event_flag
ENDM

	enum clearevent_command ; $32
MACRO clearevent
	db clearevent_command
	dw \1 ; event_flag
ENDM

	enum setevent_command ; $33
MACRO setevent
	db setevent_command
	dw \1 ; event_flag
ENDM

	enum checkflag_command ; $34
MACRO checkflag
	db checkflag_command
	dw \1 ; engine_flag
ENDM

	enum clearflag_command ; $35
MACRO clearflag
	db clearflag_command
	dw \1 ; engine_flag
ENDM

	enum setflag_command ; $36
MACRO setflag
	db setflag_command
	dw \1 ; engine_flag
ENDM

	enum wildon_command ; $37
MACRO wildon
	db wildon_command
ENDM

	enum wildoff_command ; $38
MACRO wildoff
	db wildoff_command
ENDM

	enum xycompare_command ; $39
MACRO xycompare
	db xycompare_command
	dw \1 ; pointer
ENDM

	enum warpmod_command ; $3a
MACRO warpmod
	db warpmod_command
	db \1 ; warp_id
	map_id \2 ; map
ENDM

	enum blackoutmod_command ; $3b
MACRO blackoutmod
	db blackoutmod_command
	map_id \1 ; map
ENDM

	enum warp_command ; $3c
MACRO warp
	db warp_command
	map_id \1 ; map
	db \2 ; x
	db \3 ; y
ENDM

	enum readmoney_command ; $3d
MACRO readmoney
	db readmoney_command
	db \1 ; account
	db \2 ; memory
ENDM

	enum readcoins_command ; $3e
MACRO readcoins
	db readcoins_command
	db \1 ; memory
ENDM

	enum vartomem_command ; $3f
MACRO vartomem
	db vartomem_command
	db \1 ; memory
ENDM

	enum pokenamemem_command ; $40
MACRO pokenamemem
	db pokenamemem_command
	db \1 ; pokemon
	db \2 ; memory
ENDM

	enum itemtotext_command ; $41
MACRO itemtotext
	db itemtotext_command
	db \1 ; item
	db \2 ; memory
ENDM

	enum mapnametotext_command ; $42
MACRO mapnametotext
	db mapnametotext_command
	db \1 ; memory
ENDM

	enum trainertotext_command ; $43
MACRO trainertotext
	db trainertotext_command
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
ENDM

	enum stringtotext_command ; $44
MACRO stringtotext
	db stringtotext_command
	dw \1 ; text_pointer
	db \2 ; memory
ENDM

	enum itemnotify_command ; $45
MACRO itemnotify
	db itemnotify_command
ENDM

	enum pocketisfull_command ; $46
MACRO pocketisfull
	db pocketisfull_command
ENDM

	enum opentext_command ; $47
MACRO opentext
	db opentext_command
ENDM

	enum refreshscreen_command ; $48
MACRO refreshscreen
if _NARG == 0
	refreshscreen 0
else
	db refreshscreen_command
	db \1 ; dummy
endc
ENDM

	enum closetext_command ; $49
MACRO closetext
	db closetext_command
ENDM

	enum loadbytec2cf_command ; $4a
MACRO loadbytec2cf
	db loadbytec2cf_command
	db \1 ; byte
ENDM

	enum farwritetext_command ; $4b
MACRO farwritetext
	db farwritetext_command
	dba \1
ENDM

	enum writetext_command ; $4c
MACRO writetext
	db writetext_command
	dw \1 ; text_pointer
ENDM

	enum repeattext_command ; $4d
MACRO repeattext
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
ENDM

	enum yesorno_command ; $4e
MACRO yesorno
	db yesorno_command
ENDM

	enum loadmenu_command ; $4f
MACRO loadmenu
	db loadmenu_command
	dw \1 ; menu_header
ENDM

	enum closewindow_command ; $50
MACRO closewindow
	db closewindow_command
ENDM

	enum jumptextfaceplayer_command ; $51
MACRO jumptextfaceplayer
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
ENDM

; if _CRYSTAL
	enum farjumptext_command ; $52
MACRO farjumptext
	db farjumptext_command
	dba \1
ENDM
; endc

	enum jumptext_command ; $53
MACRO jumptext
	db jumptext_command
	dw \1 ; text_pointer
ENDM

	enum waitbutton_command ; $54
MACRO waitbutton
	db waitbutton_command
ENDM

	enum buttonsound_command ; $55
MACRO buttonsound
	db buttonsound_command
ENDM

	enum pokepic_command ; $56
MACRO pokepic
	db pokepic_command
	db \1 ; pokemon
ENDM

	enum closepokepic_command ; $57
MACRO closepokepic
	db closepokepic_command
ENDM

	enum _2dmenu_command ; $58
MACRO _2dmenu
	db _2dmenu_command
ENDM

	enum verticalmenu_command ; $59
MACRO verticalmenu
	db verticalmenu_command
ENDM

	enum loadpikachudata_command ; $5a
MACRO loadpikachudata
	db loadpikachudata_command
ENDM

	enum randomwildmon_command ; $5b
MACRO randomwildmon
	db randomwildmon_command
ENDM

	enum loadmemtrainer_command ; $5c
MACRO loadmemtrainer
	db loadmemtrainer_command
ENDM

	enum loadwildmon_command ; $5d
MACRO loadwildmon
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
ENDM

	enum loadtrainer_command ; $5e
MACRO loadtrainer
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
ENDM

	enum startbattle_command ; $5f
MACRO startbattle
	db startbattle_command
ENDM

	enum reloadmapafterbattle_command ; $60
MACRO reloadmapafterbattle
	db reloadmapafterbattle_command
ENDM

	enum catchtutorial_command ; $61
MACRO catchtutorial
	db catchtutorial_command
	db \1 ; byte
ENDM

	enum trainertext_command ; $62
MACRO trainertext
	db trainertext_command
	db \1 ; which_text
ENDM

	enum trainerflagaction_command ; $63
MACRO trainerflagaction
	db trainerflagaction_command
	db \1 ; action
ENDM

	enum winlosstext_command ; $64
MACRO winlosstext
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
ENDM

	enum scripttalkafter_command ; $65
MACRO scripttalkafter
	db scripttalkafter_command
ENDM

	enum endifjustbattled_command ; $66
MACRO endifjustbattled
	db endifjustbattled_command
ENDM

	enum checkjustbattled_command ; $67
MACRO checkjustbattled
	db checkjustbattled_command
ENDM

	enum setlasttalked_command ; $68
MACRO setlasttalked
	db setlasttalked_command
	db \1 ; object id
ENDM

	enum applymovement_command ; $69
MACRO applymovement
	db applymovement_command
	db \1 ; object id
	dw \2 ; data
ENDM

	enum applymovement2_command ; $6a
MACRO applymovement2
	db applymovement2_command
	dw \1 ; data
ENDM

	enum faceplayer_command ; $6b
MACRO faceplayer
	db faceplayer_command
ENDM

	enum faceobject_command ; $6c
MACRO faceobject
	db faceobject_command
	db \1 ; object1
	db \2 ; object2
ENDM

	enum variablesprite_command ; $6d
MACRO variablesprite
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
ENDM

	enum disappear_command ; $6e
MACRO disappear
	db disappear_command
	db \1 ; object id
ENDM

	enum appear_command ; $6f
MACRO appear
	db appear_command
	db \1 ; object id
ENDM

	enum follow_command ; $70
MACRO follow
	db follow_command
	db \1 ; object2
	db \2 ; object1
ENDM

	enum stopfollow_command ; $71
MACRO stopfollow
	db stopfollow_command
ENDM

	enum moveobject_command ; $72
MACRO moveobject
	db moveobject_command
	db \1 ; object id
	db \2 ; x
	db \3 ; y
ENDM

	enum writeobjectxy_command ; $73
MACRO writeobjectxy
	db writeobjectxy_command
	db \1 ; object id
ENDM

	enum loademote_command ; $74
MACRO loademote
	db loademote_command
	db \1 ; bubble
ENDM

	enum showemote_command ; $75
MACRO showemote
	db showemote_command
	db \1 ; bubble
	db \2 ; object id
	db \3 ; time
ENDM

	enum turnobject_command ; $76
MACRO turnobject
	db turnobject_command
	db \1 ; object id
	db \2 ; facing
ENDM

	enum follownotexact_command ; $77
MACRO follownotexact
	db follownotexact_command
	db \1 ; object2
	db \2 ; object1
ENDM

	enum earthquake_command ; $78
MACRO earthquake
	db earthquake_command
	db \1 ; param
ENDM

	enum changemap_command ; $79
MACRO changemap
	db changemap_command
	db \1 ; map_bank
	dw \2 ; map_data_pointer
ENDM

	enum changeblock_command ; $7a
MACRO changeblock
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
ENDM

	enum reloadmap_command ; $7b
MACRO reloadmap
	db reloadmap_command
ENDM

	enum reloadmappart_command ; $7c
MACRO reloadmappart
	db reloadmappart_command
ENDM

	enum usestonetable_command ; $7d
MACRO usestonetable
	db usestonetable_command
	dw \1 ; stonetable_pointer
ENDM

	enum clearstonetable_command ; $7e
MACRO clearstonetable
	db clearstonetable_command
ENDM

	enum playmusic_command ; $7f
MACRO playmusic
	db playmusic_command
	dw \1 ; music_pointer
ENDM

	enum encountermusic_command ; $80
MACRO encountermusic
	db encountermusic_command
ENDM

	enum musicfadeout_command ; $81
MACRO musicfadeout
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
ENDM

	enum playmapmusic_command ; $82
MACRO playmapmusic
	db playmapmusic_command
ENDM

	enum dontrestartmapmusic_command ; $83
MACRO dontrestartmapmusic
	db dontrestartmapmusic_command
ENDM

	enum cry_command ; $84
MACRO cry
	db cry_command
	dw \1 ; cry_id
ENDM

	enum playsound_command ; $85
MACRO playsound
	db playsound_command
	dw \1 ; sound_pointer
ENDM

	enum waitsfx_command ; $86
MACRO waitsfx
	db waitsfx_command
ENDM

	enum warpsound_command ; $87
MACRO warpsound
	db warpsound_command
ENDM

	enum specialsound_command ; $88
MACRO specialsound
	db specialsound_command
ENDM

	enum passtoengine_command ; $89
MACRO passtoengine
	db passtoengine_command
	db \1 ; data_pointer
ENDM

	enum newloadmap_command ; $8a
MACRO newloadmap
	db newloadmap_command
	db \1 ; which_method
ENDM

	enum pause_command ; $8b
MACRO pause
	db pause_command
	db \1 ; length
ENDM

	enum deactivatefacing_command ; $8c
MACRO deactivatefacing
	db deactivatefacing_command
	db \1 ; time
ENDM

	enum priorityjump_command ; $8d
MACRO priorityjump
	db priorityjump_command
	dw \1 ; pointer
ENDM

	enum warpcheck_command ; $8e
MACRO warpcheck
	db warpcheck_command
ENDM

	enum ptpriorityjump_command ; $8f
MACRO ptpriorityjump
	db ptpriorityjump_command
	dw \1 ; pointer
ENDM

	enum return_command ; $90
MACRO return
	db return_command
ENDM

	enum end_command ; $91
MACRO end
	db end_command
ENDM

	enum reloadandreturn_command ; $92
MACRO reloadandreturn
	db reloadandreturn_command
	db \1 ; which_method
ENDM

	enum endall_command ; $93
MACRO endall
	db endall_command
ENDM

	enum pokemart_command ; $94
MACRO pokemart
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
ENDM

	enum elevator_command ; $95
MACRO elevator
	db elevator_command
	dw \1 ; floor_list_pointer
ENDM

	enum trade_command ; $96
MACRO trade
	db trade_command
	db \1 ; trade_id
ENDM

	enum askforphonenumber_command ; $97
MACRO askforphonenumber
	db askforphonenumber_command
	db \1 ; number
ENDM

	enum phonecall_command ; $98
MACRO phonecall
	db phonecall_command
	dw \1 ; caller_name
ENDM

	enum hangup_command ; $99
MACRO hangup
	db hangup_command
ENDM

	enum describedecoration_command ; $9a
MACRO describedecoration
	db describedecoration_command
	db \1 ; byte
ENDM

	enum fruittree_command ; $9b
MACRO fruittree
	db fruittree_command
	db \1 ; tree_id
ENDM

	enum specialphonecall_command ; $9c
MACRO specialphonecall
	db specialphonecall_command
	dw \1 ; call_id
ENDM

	enum checkphonecall_command ; $9d
MACRO checkphonecall
	db checkphonecall_command
ENDM

	enum verbosegiveitem_command ; $9e
MACRO verbosegiveitem
if _NARG == 1
	verbosegiveitem \1, 1
else
	db verbosegiveitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	enum verbosegiveitem2_command ; $9f
MACRO verbosegiveitem2
	db verbosegiveitem2_command
	db \1 ; item
	db \2 ; var
ENDM

	enum swarm_command ; $a0
MACRO swarm
	db swarm_command
	map_id \1 ; map
ENDM

	enum halloffame_command ; $a1
MACRO halloffame
	db halloffame_command
ENDM

	enum credits_command ; $a2
MACRO credits
	db credits_command
ENDM

	enum warpfacing_command ; $a3
MACRO warpfacing
	db warpfacing_command
	db \1 ; facing
	map_id \2 ; map
	db \3 ; x
	db \4 ; y
ENDM

	enum battletowertext_command ; $a4
MACRO battletowertext
	db battletowertext_command
	db \1 ; memory
ENDM

	enum landmarktotext_command ; $a5
MACRO landmarktotext
	db landmarktotext_command
	db \1 ; id
	db \2 ; memory
ENDM

	enum trainerclassname_command ; $a6
MACRO trainerclassname
	db trainerclassname_command
	db \1 ; id
	db \2 ; memory
ENDM

	enum name_command ; $a7
MACRO name
	db name_command
	db \1 ; type
	db \2 ; id
	db \3 ; memory
ENDM

	enum wait_command ; $a8
MACRO wait
	db wait_command
	db \1 ; duration
ENDM

	enum checksave_command ; $a9
MACRO checksave
	db checksave_command
ENDM
