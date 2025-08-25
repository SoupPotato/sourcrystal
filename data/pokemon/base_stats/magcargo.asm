	db MAGCARGO ; 219

	db  80,  50, 120,  30,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK ; type
	db 75 ; catch rate
	db 154 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/magcargo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, SOLARBEAM, EARTHQUAKE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SANDSTORM, DEFENSE_CURL, REST, ATTRACT, STRENGTH, FLAMETHROWER, RAGE, REFLECT, BODY_SLAM, MIMIC, SELFDESTRUCT, FISSURE, SUBSTITUTE, ROCK_SLIDE, DOUBLE_EDGE, EXPLOSION
	; end
