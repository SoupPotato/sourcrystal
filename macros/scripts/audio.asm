MACRO musicheader
	; number of tracks, track idx, address
	dbw ((\1 - 1) << 6) + (\2 - 1), \3
ENDM

MACRO note
	dn (\1), (\2) - 1
ENDM

MACRO sound
	note \1, \2
	db \3 ; intensity
	dw \4 ; frequency
ENDM

MACRO noise
	note \1, \2 ; duration
	db \3 ; intensity
	db \4 ; frequency
ENDM

; MusicCommands indexes (see audio/engine.asm)
	enum_start $d8

	enum notetype_cmd ; $d8
MACRO octave
	db notetype_cmd - (\1)
ENDM

MACRO notetype
	db notetype_cmd
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
ENDM

	enum pitchoffset_cmd ; $d9
MACRO pitchoffset
	db pitchoffset_cmd
	dn \1, \2 - 1 ; octave, key
ENDM

	enum tempo_cmd ; $da
MACRO tempo
	db tempo_cmd
	bigdw \1 ; tempo
ENDM

	enum dutycycle_cmd ; $db
MACRO dutycycle
	db dutycycle_cmd
	db \1 ; duty_cycle
ENDM

	enum intensity_cmd ; $dc
MACRO intensity
	db intensity_cmd
	db \1 ; intensity
ENDM

	enum soundinput_cmd ; $dd
MACRO soundinput
	db soundinput_cmd
	db \1 ; input
ENDM

	enum sound_duty_cmd ; $de
MACRO sound_duty
	db sound_duty_cmd
	if _NARG == 4
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6) ; duty sequence
	else
	db \1 ; one-byte duty value for legacy support
	endc
ENDM

	enum togglesfx_cmd ; $df
MACRO togglesfx
	db togglesfx_cmd
ENDM

	enum slidepitchto_cmd ; $e0
MACRO slidepitchto
	db slidepitchto_cmd
	db \1 - 1 ; duration
	dn \2, \3 ; octave, pitch
ENDM

	enum vibrato_cmd ; $e1
MACRO vibrato
	db vibrato_cmd
	db \1 ; delay
	db \2 ; extent
ENDM

	enum unknownmusic0xe2_cmd ; $e2
MACRO unknownmusic0xe2
	db unknownmusic0xe2_cmd
	db \1 ; unknown
ENDM

	enum togglenoise_cmd ; $e3
MACRO togglenoise
	db togglenoise_cmd
	db \1 ; id
ENDM

	enum panning_cmd ; $e4
MACRO panning
	db panning_cmd
	db \1 ; tracks
ENDM

	enum volume_cmd ; $e5
MACRO volume
	db volume_cmd
	db \1 ; volume
ENDM

	enum tone_cmd ; $e6
MACRO tone
	db tone_cmd
	bigdw \1 ; tone
ENDM

	enum unknownmusic0xe7_cmd ; $e7
MACRO unknownmusic0xe7
	db unknownmusic0xe7_cmd
	db \1 ; unknown
ENDM

	enum unknownmusic0xe8_cmd ; $e8
MACRO unknownmusic0xe8
	db unknownmusic0xe8_cmd
	db \1 ; unknown
ENDM

	enum tempo_relative_cmd ; $e9
MACRO tempo_relative
	db tempo_relative_cmd
	bigdw \1 ; value
ENDM

	enum restartchannel_cmd ; $ea
MACRO restartchannel
	db restartchannel_cmd
	dw \1 ; address
ENDM

	enum newsong_cmd ; $eb
MACRO newsong
	db newsong_cmd
	bigdw \1 ; id
ENDM

	enum sfxpriorityon_cmd ; $ec
MACRO sfxpriorityon
	db sfxpriorityon_cmd
ENDM

	enum sfxpriorityoff_cmd ; $ed
MACRO sfxpriorityoff
	db sfxpriorityoff_cmd
ENDM

	enum unknownmusic0xee_cmd ; $ee
MACRO unknownmusic0xee
	db unknownmusic0xee_cmd
	dw \1 ; address
ENDM

	enum stereopanning_cmd ; $ef
MACRO stereopanning
	db stereopanning_cmd
	db \1 ; tracks
ENDM

	enum sfxtogglenoise_cmd ; $f0
MACRO sfxtogglenoise
	db sfxtogglenoise_cmd
	db \1 ; id
ENDM

	enum music0xf1_cmd ; $f1
MACRO music0xf1
	db music0xf1_cmd
ENDM

	enum music0xf2_cmd ; $f2
MACRO music0xf2
	db music0xf2_cmd
ENDM

	enum music0xf3_cmd ; $f3
MACRO music0xf3
	db music0xf3_cmd
ENDM

	enum music0xf4_cmd ; $f4
MACRO music0xf4
	db music0xf4_cmd
ENDM

	enum music0xf5_cmd ; $f5
MACRO music0xf5
	db music0xf5_cmd
ENDM

	enum music0xf6_cmd ; $f6
MACRO music0xf6
	db music0xf6_cmd
ENDM

	enum music0xf7_cmd ; $f7
MACRO music0xf7
	db music0xf7_cmd
ENDM

	enum music0xf8_cmd ; $f8
MACRO music0xf8
	db music0xf8_cmd
ENDM

	enum unknownmusic0xf9_cmd ; $f9
MACRO unknownmusic0xf9
	db unknownmusic0xf9_cmd
ENDM

	enum setcondition_cmd ; $fa
MACRO setcondition
	db setcondition_cmd
	db \1 ; condition
ENDM

	enum jumpif_cmd ; $fb
MACRO jumpif
	db jumpif_cmd
	db \1 ; condition
	dw \2 ; address
ENDM

	enum jumpchannel_cmd ; $fc
MACRO jumpchannel
	db jumpchannel_cmd
	dw \1 ; address
ENDM

	enum loopchannel_cmd ; $fd
MACRO loopchannel
	db loopchannel_cmd
	db \1 ; count
	dw \2 ; address
ENDM

	enum callchannel_cmd ; $fe
MACRO callchannel
	db callchannel_cmd
	dw \1 ; address
ENDM

	enum endchannel_cmd ; $ff
MACRO endchannel
	db endchannel_cmd
ENDM
