	db PIKACHU ; 025

	db  35,  55,  40,  90,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 82 ; base exp
	db ORAN_BERRY, ORAN_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/pikachu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SNORE, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, STRENGTH, FLASH, THUNDERBOLT, PAY_DAY, RAGE, MEGA_PUNCH, SEISMIC_TOSS, MEGA_KICK, REFLECT, BODY_SLAM, SUBMISSION, MIMIC, THUNDER_WAVE, SUBSTITUTE, DOUBLE_EDGE
	; end
