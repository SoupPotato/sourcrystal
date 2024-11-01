; remixed by zumi in 2022

Music_CeruleanCity:
	channel_count 4
	channel 1, Music_CeruleanCity_Ch1
	channel 2, Music_CeruleanCity_Ch2
	channel 3, Music_CeruleanCity_Ch3
	channel 4, Music_CeruleanCity_Ch4

; Drum constants, replace with the proper values
DEF DRUM_CERULEAN_CITY_08	EQU	2
DEF DRUM_CERULEAN_CITY_09	EQU	3
DEF DRUM_CERULEAN_CITY_0a	EQU	4
DEF DRUM_CERULEAN_CITY_0c	EQU	5
DEF DRUM_CERULEAN_CITY_0d	EQU	8
DEF DRUM_CERULEAN_CITY_0e	EQU	8

; Drumset to use, replace with the proper value
DEF DRUMSET_CERULEAN_CITY	EQU	3

Music_CeruleanCity_Ch1:
	tempo 75
	volume 7, 7
	note_type 12, 10, 2
	vibrato 18, 3, 4
	pitch_offset 1
	rest 16
	rest 16
.loop
	sound_call .pattern1
	sound_call .pattern1
	sound_call .pattern2
	sound_call .pattern3
	sound_call .pattern8
	sound_call .pattern4
	sound_call .pattern5
	sound_call .pattern6
	sound_call .pattern7
	sound_loop 0, .loop
	sound_ret

.pattern1
	duty_cycle 0
	stereo_panning TRUE, FALSE
	note_type 12, 11, 1
	octave 3
	note G#, 4
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 4
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 4
	note E_, 2
	note C#, 2
	note G#, 4
	note E_, 2
	note C#, 2
	note A_, 4
	note F#, 2
	note D#, 2
	note A_, 4
	note D#, 2
	note F#, 2
	note B_, 4
	note D#, 2
	note F#, 2
	note B_, 4
	note D#, 2
	note F#, 2
	sound_ret

.pattern2
	duty_cycle 0
	note_type 12, 11, 1
	octave 3
	note G#, 4
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 4
	duty_cycle 2
	stereo_panning FALSE, TRUE
	note_type 12, 11, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	note B_, 4
	octave 4
	note C#, 4
	note C#, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note_type 12, 11, 4
	note C#, 8
	octave 3
	note B_, 4
	note_type 12, 11, 1
	octave 4
	note C#, 2
	note D#, 2
	note_type 12, 11, 4
	note C#, 8
	octave 3
	note B_, 8
	sound_ret

.pattern3
	duty_cycle 1
	stereo_panning TRUE, FALSE
	note_type 12, 11, 1
	octave 3
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 8
	duty_cycle 0
	note_type 12, 11, 1
	note G#, 4
	note E_, 2
	note C#, 2
	note G#, 4
	note E_, 2
	note C#, 2
	note A_, 4
	note F#, 2
	note D#, 2
	note A_, 4
	note D#, 2
	note F#, 2
	note B_, 4
	note D#, 2
	note F#, 2
	note B_, 4
	note D#, 2
	note F#, 2
	sound_ret

.pattern8
	duty_cycle 1
	note_type 12, 11, 3
	octave 3
	note E_, 4
	note F#, 4
	sound_ret

.pattern4
	note_type 12, 11, 3
	octave 3
	note G#, 4
	rest 4
	octave 4
	note E_, 8
	octave 3
	note B_, 8
	note F#, 4
	note G#, 4
	note A_, 4
	rest 4
	octave 4
	note F#, 8
	note D#, 8
	octave 3
	note F#, 4
	note G#, 4
	sound_ret

.pattern5
	note_type 12, 10, 3
	octave 3
	note C#, 4
	note_type 12, 13, 1
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note D#, 2
	note_type 12, 10, 3
	note E_, 4
	note_type 12, 13, 1
	note E_, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note_type 12, 10, 6
	note G#, 16
	note_type 12, 10, 3
	note F#, 16
	sound_ret

.pattern6
	rest 4
	duty_cycle 1
	note_type 12, 10, 3
	octave 2
	note E_, 8
	note E_, 8
	octave 1
	note F#, 8
	note G#, 8
	note A_, 8
	note A#, 4
	note B_, 4
	note A_, 4
	note G#, 4
	note F#, 4
	sound_ret

.pattern7
	rest 4
	duty_cycle 1
	note_type 12, 10, 3
	octave 2
	note E_, 8
	note E_, 8
	octave 1
	note F#, 8
	note G#, 8
	note A_, 8
	note A#, 4
	octave 3
	note_type 12, 10, 3
	note E_, 4
	note D#, 4
	note C#, 4
	note D#, 4
	sound_ret

Music_CeruleanCity_Ch2:
	vibrato 15, 4, 4
	sound_call .pattern0
.loop
	sound_call .pattern1
	sound_call .pattern2
	sound_call .pattern3
	sound_call .pattern4
	sound_call .pattern9
	sound_call .pattern5
	sound_call .pattern6
	sound_call .pattern7
	sound_call .pattern8
	sound_loop 0, .loop
	sound_ret

.pattern0
	duty_cycle 2
	note_type 12, 12, 2
	octave 4
	note E_, 4
	note D#, 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C#, 4
	note D#, 4
	sound_ret

.pattern1
	note_type 12, 12, 2
	octave 4
	note E_, 12
	note_type 12, 12, 1
	note E_, 2
	octave 3
	note B_, 2
	note_type 12, 12, 2
	octave 4
	note C#, 4
	note D#, 4
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note_type 12, 12, 4
	note G#, 12
	note_type 12, 12, 1
	note A_, 2
	note G#, 2
	note_type 12, 12, 4
	note F#, 16
	sound_ret

.pattern2
	rest 12
	note_type 12, 12, 1
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	note_type 12, 12, 2
	octave 4
	note C#, 4
	note D#, 4
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note_type 12, 12, 4
	note G#, 12
	note_type 12, 12, 1
	note E_, 2
	note G#, 2
	note_type 12, 12, 4
	note B_, 16
	sound_ret

.pattern3
	rest 12
	duty_cycle 1
	stereo_panning TRUE, FALSE
	note_type 12, 12, 1
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	note_type 12, 12, 2
	octave 4
	note C#, 4
	note D#, 4
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note_type 12, 12, 4
	note G#, 12
	note_type 12, 12, 1
	note A_, 2
	note G#, 2
	note_type 12, 12, 4
	note F#, 16
	sound_ret

.pattern4
	duty_cycle 2
	stereo_panning FALSE, TRUE
	note_type 12, 12, 1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 4
	duty_cycle 1
	stereo_panning TRUE, TRUE
	note E_, 2
	octave 3
	note B_, 2
	note_type 12, 12, 2
	octave 4
	note C#, 4
	note D#, 4
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note_type 12, 12, 4
	note G#, 12
	note_type 12, 12, 1
	note E_, 2
	note G#, 2
	note_type 12, 12, 4
	note B_, 16
	sound_ret

.pattern9
	duty_cycle 2
	note_type 12, 12, 3
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	sound_ret

.pattern5
	note_type 12, 12, 1
	octave 4
	note E_, 8
	note_type 12, 12, 4
	note G#, 8
	note E_, 8
	note_type 12, 12, 5
	note D#, 2
	note C#, 2
	note D#, 2
	note E_, 2
	note_type 12, 12, 1
	note F#, 8
	note_type 12, 12, 4
	note B_, 8
	note F#, 8
	note_type 12, 12, 5
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	sound_ret

.pattern6
	note_type 12, 12, 3
	octave 4
	note E_, 4
	note_type 12, 12, 5
	note E_, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note_type 12, 12, 3
	note G#, 4
	note_type 12, 12, 5
	note G#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note_type 12, 12, 3
	note B_, 2
	note F#, 2
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note F#, 2
	note B_, 16
	sound_ret

.pattern7
	rest 16
	rest 16
	stereo_panning FALSE, TRUE
	note_type 12, 11, 7
	octave 2
	note B_, 8
	octave 3
	note F#, 8
	note G#, 16
	sound_ret

.pattern8
	note_type 12, 11, 7
	octave 3
	note B_, 16
	note E_, 16
	note F#, 16
	stereo_panning TRUE, TRUE
	note_type 12, 12, 2
	octave 4
	note E_, 4
	note D#, 4
	note C#, 4
	note D#, 4
	sound_ret

Music_CeruleanCity_Ch3:
	vibrato 18, 3, 3
	note_type 12, 2, 5
	sound_call .pattern0
.loop
	sound_call .pattern1
	sound_call .pattern1
	sound_call .pattern1
	sound_call .pattern1
	sound_call .pattern2
	sound_call .pattern3
	sound_call .pattern6
	sound_call .pattern4
	sound_call .pattern5
	sound_loop 0, .loop
	sound_ret

.pattern0
	rest 16
	stereo_panning FALSE, TRUE
	note_type 12, 2, 5
	octave 4
	note E_, 4
	note D#, 4
	note C#, 4
	note C_, 4
	sound_ret

.pattern1
	stereo_panning TRUE, TRUE
	note_type 12, 1, 6
	octave 2
	note E_, 4
	rest 2
	note G#, 1
	rest 1
	note E_, 4
	octave 1
	note B_, 3
	rest 1
	octave 2
	note E_, 4
	note G#, 1
	rest 3
	note E_, 4
	note G#, 1
	rest 3
	note F#, 4
	rest 2
	note G#, 1
	rest 1
	note F#, 4
	note A_, 4
	note B_, 3
	rest 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G#, 4
	note F#, 4
	sound_ret

.pattern2
	note_type 12, 1, 6
	octave 2
	note E_, 4
	note F#, 4
	sound_ret

.pattern3
	octave 2
	note G#, 4
	octave 3
	note C#, 2
	rest 2
	octave 2
	note G#, 4
	octave 3
	note C#, 2
	rest 2
	octave 2
	note G#, 4
	octave 3
	note C#, 2
	rest 2
	octave 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note B_, 4
	octave 3
	note D#, 2
	rest 2
	octave 2
	note B_, 4
	octave 3
	note D#, 2
	rest 2
	octave 2
	note B_, 4
	octave 3
	note D#, 2
	rest 2
	octave 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	sound_ret

.pattern4
	note_type 12, 1, 1
	octave 5
	note E_, 14
	note D#, 1
	note C#, 1
	octave 4
	note B_, 8
	octave 5
	note F#, 8
	note G#, 8
	note A_, 8
	note B_, 16
	sound_ret

.pattern5
	octave 5
	note B_, 16
	note G#, 8
	octave 6
	note D#, 7
	note D_, 1
	note C#, 8
	note D#, 8
	note_type 12, 1, 6
	octave 2
	note B_, 3
	rest 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G#, 4
	note F#, 4
	sound_ret

.pattern6
	octave 3
	note C#, 4
	rest 8
	octave 2
	note A_, 4
	note A#, 4
	octave 3
	note C#, 4
	octave 2
	note B_, 8
	octave 1
	note B_, 8
	octave 2
	note B_, 3
	rest 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G#, 4
	note F#, 4
	sound_ret

Music_CeruleanCity_Ch4:
	toggle_noise DRUMSET_CERULEAN_CITY
	drum_speed 12
	sound_call .pattern0
.loop
	sound_call .pattern1
	sound_call .pattern1
	sound_call .pattern1
	sound_call .pattern2
	sound_call .pattern6
	sound_call .pattern1
	sound_call .pattern3
	sound_call .pattern5
	sound_call .pattern4
	sound_loop 0, .loop
	sound_ret

.pattern0
	rest 16
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	sound_ret

.pattern1
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	sound_ret

.pattern2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_08, 2
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	sound_ret

.pattern6
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_0e, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	sound_ret

.pattern3
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0a, 8
	drum_note DRUM_CERULEAN_CITY_09, 6
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_0a, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_09, 2
	sound_ret

.pattern4
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0a, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_0e, 4
	drum_note DRUM_CERULEAN_CITY_09, 4
	drum_note DRUM_CERULEAN_CITY_09, 2
	drum_note DRUM_CERULEAN_CITY_09, 2
	sound_ret

.pattern5
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0c, 4
	drum_note DRUM_CERULEAN_CITY_0d, 2
	drum_note DRUM_CERULEAN_CITY_0d, 2
	sound_ret
