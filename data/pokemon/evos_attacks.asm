SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::
BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, TAKE_DOWN
	db 19, RAZOR_LEAF
	db 22, SWEET_SCENT
	db 26, GROWTH
	db 29, DOUBLE_EDGE
	db 33, SYNTHESIS
	db 37, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, TAKE_DOWN
	db 20, RAZOR_LEAF
	db 25, SWEET_SCENT
	db 29, GROWTH
	db 35, DOUBLE_EDGE
	db 39, SYNTHESIS
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, TAKE_DOWN
	db 20, RAZOR_LEAF
	db 24, SWEET_SCENT
	db 29, GROWTH
	db 32, PETAL_DANCE
	db 37, DOUBLE_EDGE
	db 44, SYNTHESIS
	db 52, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 12, SMOKESCREEN
	db 18, DRAGON_RAGE
	db 23, SCARY_FACE
	db 29, FLAMETHROWER
	db 34, SLASH
	db 40, DRAGONBREATH
	db 45, FIRE_SPIN
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, EMBER
	db 12, SMOKESCREEN
	db 20, DRAGON_RAGE
	db 26, SCARY_FACE
	db 34, FLAMETHROWER
	db 40, SLASH
	db 48, DRAGONBREATH
	db 54, FIRE_SPIN
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, EMBER
	db 1, SMOKESCREEN
	db 20, DRAGON_RAGE
	db 26, SCARY_FACE
	db 34, FLAMETHROWER
	db 36, WING_ATTACK
	db 44, SLASH
	db 52, DRAGONBREATH
	db 60, FIRE_SPIN
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 17, BITE
	db 21, RAPID_SPIN
	db 24, BUBBLEBEAM
	db 28, PROTECT
	db 32, RAIN_DANCE
	db 36, SKULL_BASH
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 18, BITE
	db 22, RAPID_SPIN
	db 27, BUBBLEBEAM
	db 32, PROTECT
	db 38, RAIN_DANCE
	db 43, SKULL_BASH
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 1, WITHDRAW
	db 13, WATER_GUN
	db 18, BITE
	db 22, RAPID_SPIN
	db 27, BUBBLEBEAM
	db 32, PROTECT
	db 39, RAIN_DANCE
	db 47, SKULL_BASH
	db 56, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 7, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 10, GUST
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 13, SLEEP_POWDER
	db 16, PSYBEAM
	db 20, SUPERSONIC
	db 24, WHIRLWIND
	db 29, CHARM
	db 34, WING_ATTACK
	db 40, SAFEGUARD
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 7, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TWINEEDLE
	db 10, TWINEEDLE
	db 11, FURY_ATTACK
	db 13, RAGE
	db 16, PURSUIT
	db 20, FOCUS_ENERGY
	db 25, PIN_MISSILE
	db 30, FEINT_ATTACK
	db 35, SLUDGE_BOMB
	db 40, AGILITY
	db 45, OUTRAGE
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 17, WHIRLWIND
	db 22, TWISTER
	db 27, WING_ATTACK
	db 33, AGILITY
	db 39, MIRROR_MOVE
	db 45, RAZOR_WIND
	db 49, SKY_ATTACK
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 13, QUICK_ATTACK
	db 19, WHIRLWIND
	db 24, TWISTER
	db 29, WING_ATTACK
	db 35, AGILITY
	db 42, MIRROR_MOVE
	db 48, RAZOR_WIND
	db 54, SKY_ATTACK
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 1, QUICK_ATTACK
	db 19, WHIRLWIND
	db 24, TWISTER
	db 29, WING_ATTACK
	db 37, AGILITY
	db 45, MIRROR_MOVE
	db 53, RAZOR_WIND
	db 61, SKY_ATTACK
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 11, BITE
	db 15, HYPER_FANG
	db 21, PURSUIT
	db 25, FOCUS_ENERGY
	db 29, CRUNCH
	db 35, SUPER_FANG
	db 39, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 11, BITE
	db 15, HYPER_FANG
	db 20, SCARY_FACE
	db 22, PURSUIT
	db 27, FOCUS_ENERGY
	db 32, CRUNCH
	db 39, SUPER_FANG
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 6, LEER
	db 11, FURY_ATTACK
	db 16, PURSUIT
	db 21, MIRROR_MOVE
	db 26, FOCUS_ENERGY
	db 32, FEINT_ATTACK
	db 38, DRILL_PECK
	db 44, AGILITY
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, LEER
	db 1, FURY_ATTACK
	db 16, PURSUIT
	db 22, MIRROR_MOVE
	db 28, FOCUS_ENERGY
	db 34, FEINT_ATTACK
	db 41, DRILL_PECK
	db 48, AGILITY
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 7, POISON_STING
	db 12, BITE
	db 16, GLARE
	db 21, ACID
	db 25, SCREECH
	db 30, SLAM
	db 34, HAZE
	db 39, SLUDGE_BOMB
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, POISON_STING
	db 1, BITE
	db 16, GLARE
	db 21, ACID
	db 22, CRUNCH
	db 28, SCREECH
	db 34, SLAM
	db 39, HAZE
	db 45, SLUDGE_BOMB
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
	db 15, DOUBLE_TEAM
	db 20, SLAM
	db 26, THUNDERBOLT
	db 33, AGILITY
	db 41, THUNDER
	db 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 6, SAND_ATTACK
	db 9, POISON_STING
	db 14, RAPID_SPIN
	db 17, MAGNITUDE
	db 22, SWIFT
	db 25, FURY_SWIPES
	db 30, DIG
	db 33, SLASH
	db 38, SWORDS_DANCE
	db 42, SANDSTORM
	db 47, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 6, SAND_ATTACK
	db 9, POISON_STING
	db 14, RAPID_SPIN
	db 17, MAGNITUDE
	db 22, SWIFT
	db 26, FURY_SWIPES
	db 33, DIG
	db 37, SLASH
	db 44, SWORDS_DANCE
	db 48, SANDSTORM
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 6, SCRATCH
	db 10, TAIL_WHIP
	db 14, DOUBLE_KICK
	db 19, FURY_SWIPES
	db 23, BITE
	db 27, CHARM
	db 32, DIG
	db 36, TOXIC
	db 40, CRUNCH
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 1, SCRATCH
	db 10, TAIL_WHIP
	db 14, DOUBLE_KICK
	db 20, FURY_SWIPES
	db 25, BITE
	db 31, CHARM
	db 37, DIG
	db 42, TOXIC
	db 48, CRUNCH
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 36, BODY_SLAM
	db 45, EARTHQUAKE
	db 58, SUBMISSION
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, POISON_STING
	db 6, PECK
	db 10, FOCUS_ENERGY
	db 14, DOUBLE_KICK
	db 19, FURY_ATTACK
	db 23, HORN_ATTACK
	db 27, SWAGGER
	db 32, DIG
	db 36, TOXIC
	db 40, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, POISON_STING
	db 1, PECK
	db 10, FOCUS_ENERGY
	db 14, DOUBLE_KICK
	db 20, FURY_ATTACK
	db 25, HORN_ATTACK
	db 31, SWAGGER
	db 37, DIG
	db 42, TOXIC
	db 48, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, FOCUS_ENERGY
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 36, THRASH
	db 45, EARTHQUAKE
	db 58, MEGAHORN
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, ENCORE
	db 8, SING
	db 13, DOUBLESLAP
	db 19, MINIMIZE
	db 24, DEFENSE_CURL
	db 30, BODY_SLAM
	db 35, METRONOME
	db 42, MOONLIGHT
	db 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DOUBLESLAP
	db 1, METRONOME
	db 1, MOONLIGHT
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAIL_WHIP
	db 7, DISABLE
	db 11, QUICK_ATTACK
	db 14, FIRE_SPIN
	db 20, CONFUSE_RAY
	db 24, SPITE
	db 27, FEINT_ATTACK
	db 33, FLAMETHROWER
	db 37, SAFEGUARD
	db 40, FIRE_BLAST
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, SAFEGUARD
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 4, POUND
	db 9, DEFENSE_CURL
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, DOUBLESLAP
	db 29, REST
	db 34, BODY_SLAM
	db 39, MIMIC
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, DOUBLESLAP
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 15, SWIFT
	db 19, CONFUSE_RAY
	db 24, WING_ATTACK
	db 30, CRUNCH
	db 35, MEAN_LOOK
	db 39, HAZE
	db 44, TOXIC
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 1, SUPERSONIC
	db 10, BITE
	db 15, SWIFT
	db 19, CONFUSE_RAY
	db 26, WING_ATTACK
	db 33, CRUNCH
	db 40, MEAN_LOOK
	db 47, HAZE
	db 54, TOXIC
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, SWEET_SCENT
	db 12, ACID
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 22, MEGA_DRAIN
	db 28, MOONLIGHT
	db 32, TOXIC
	db 36, GIGA_DRAIN
	db 42, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 1, SWEET_SCENT
	db 1, ACID
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 24, MEGA_DRAIN
	db 31, MOONLIGHT
	db 37, TOXIC
	db 44, GIGA_DRAIN
	db 50, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 50, PETAL_DANCE
	db 60, SOLARBEAM
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 6, STUN_SPORE
	db 6, POISONPOWDER
	db 11, LEECH_LIFE
	db 15, ABSORB
	db 20, FURY_CUTTER
	db 25, SPORE
	db 29, SLASH
	db 34, GROWTH
	db 39, GIGA_DRAIN
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 11, LEECH_LIFE
	db 15, ABSORB
	db 20, FURY_CUTTER
	db 27, SPORE
	db 33, SLASH
	db 40, GROWTH
	db 47, GIGA_DRAIN
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 6, SUPERSONIC
	db 12, CONFUSION
	db 17, POISONPOWDER
	db 22, LEECH_LIFE
	db 28, STUN_SPORE
	db 33, PSYBEAM
	db 38, SLEEP_POWDER
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 1, SUPERSONIC
	db 12, CONFUSION
	db 17, POISONPOWDER
	db 22, LEECH_LIFE
	db 28, STUN_SPORE
	db 31, GUST
	db 36, PSYBEAM
	db 42, SLEEP_POWDER
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 5, GROWL
	db 9, MUD_SLAP
	db 15, MAGNITUDE
	db 19, FEINT_ATTACK
	db 23, DIG
	db 29, SANDSTORM
	db 33, SLASH
	db 37, EARTHQUAKE
	db 43, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 1, GROWL
	db 1, MUD_SLAP
	db 15, MAGNITUDE
	db 19, FEINT_ATTACK
	db 23, DIG
	db 30, SANDSTORM
	db 36, SLASH
	db 42, EARTHQUAKE
	db 49, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, BITE
	db 12, FURY_SWIPES
	db 19, SCREECH
	db 25, PAY_DAY
	db 30, FEINT_ATTACK
	db 37, SWAGGER
	db 43, SLASH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, BITE
	db 12, FURY_SWIPES
	db 19, SCREECH
	db 25, PAY_DAY
	db 31, FEINT_ATTACK
	db 38, SWAGGER
	db 46, SLASH
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 9, WATER_GUN
	db 14, DISABLE
	db 18, CONFUSION
	db 22, FURY_SWIPES
	db 27, SCREECH
	db 32, PSYBEAM
	db 36, PSYCH_UP
	db 41, AMNESIA
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 14, DISABLE
	db 18, CONFUSION
	db 22, FURY_SWIPES
	db 27, SCREECH
	db 34, PSYBEAM
	db 39, PSYCH_UP
	db 45, AMNESIA
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LOW_KICK
	db 6, FOCUS_ENERGY
	db 11, FURY_SWIPES
	db 16, KARATE_CHOP
	db 22, SEISMIC_TOSS
	db 27, SCREECH
	db 33, SWAGGER
	db 38, CROSS_CHOP
	db 44, THRASH
	db 49, OUTRAGE
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LOW_KICK
	db 1, FOCUS_ENERGY
	db 11, FURY_SWIPES
	db 16, KARATE_CHOP
	db 22, SEISMIC_TOSS
	db 27, SCREECH
	db 28, RAGE
	db 34, SWAGGER
	db 40, CROSS_CHOP
	db 47, THRASH
	db 53, OUTRAGE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 6, EMBER
	db 12, LEER
	db 17, FLAME_WHEEL
	db 23, REVERSAL
	db 28, TAKE_DOWN
	db 34, FLAMETHROWER
	db 39, AGILITY
	db 45, CRUNCH
	db 50, OUTRAGE
	db 56, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, LEER
	db 1, TAKE_DOWN
	db 1, FLAME_WHEEL
	db 50, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 6, HYPNOSIS
	db 11, WATER_GUN
	db 14, DOUBLESLAP
	db 19, RAIN_DANCE
	db 24, BUBBLEBEAM
	db 28, BODY_SLAM
	db 33, BELLY_DRUM
	db 38, LOW_KICK
	db 42, HYDRO_PUMP
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_ITEM, KINGS_ROCK, POLITOED
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, HYPNOSIS
	db 11, WATER_GUN
	db 14, DOUBLESLAP
	db 19, RAIN_DANCE
	db 24, BUBBLEBEAM
	db 30, BODY_SLAM
	db 36, BELLY_DRUM
	db 42, LOW_KICK
	db 48, HYDRO_PUMP
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, SUBMISSION
	db 42, DYNAMICPUNCH
	db 48, MIND_READER
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM
	db EVOLVE_ITEM, LINKING_CORD, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 16, KINESIS
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, REFLECT
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 45, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 16, KINESIS
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, REFLECT
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 45, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 25, FORESIGHT
	db 31, VITAL_THROW
	db 37, SUBMISSION
	db 43, SCARY_FACE
	db 49, CROSS_CHOP
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db EVOLVE_ITEM, LINKING_CORD, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 25, FORESIGHT
	db 32, VITAL_THROW
	db 39, SUBMISSION
	db 46, CROSS_CHOP
	db 53, SCARY_FACE
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 25, FORESIGHT
	db 32, VITAL_THROW
	db 39, SUBMISSION
	db 46, CROSS_CHOP
	db 53, SCARY_FACE
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 23, ACID
	db 30, SWEET_SCENT
	db 37, RAZOR_LEAF
	db 45, SLAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 1, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 24, ACID
	db 33, SWEET_SCENT
	db 42, RAZOR_LEAF
	db 54, SLAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, WATER_GUN
	db 6, CONSTRICT
	db 12, SUPERSONIC
	db 17, ACID
	db 23, BUBBLEBEAM
	db 28, WRAP
	db 34, BARRIER
	db 39, SLUDGE_BOMB
	db 45, SCREECH
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, WATER_GUN
	db 1, CONSTRICT
	db 1, SUPERSONIC
	db 17, ACID
	db 23, BUBBLEBEAM
	db 28, WRAP
	db 37, BARRIER
	db 43, SLUDGE_BOMB
	db 50, SCREECH
	db 56, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 10, ROCK_THROW
	db 15, MAGNITUDE
	db 19, ROLLOUT
	db 24, SELFDESTRUCT
	db 28, EARTHQUAKE
	db 33, DOUBLE_EDGE
	db 37, ROCK_SLIDE
	db 42, EXPLOSION
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, -1, GOLEM
	db EVOLVE_ITEM, LINKING_CORD, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, ROCK_THROW
	db 15, MAGNITUDE
	db 19, ROLLOUT
	db 26, SELFDESTRUCT
	db 33, EARTHQUAKE
	db 40, DOUBLE_EDGE
	db 47, ROCK_SLIDE
	db 54, EXPLOSION
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, ROCK_THROW
	db 15, MAGNITUDE
	db 19, ROLLOUT
	db 26, SELFDESTRUCT
	db 33, EARTHQUAKE
	db 40, DOUBLE_EDGE
	db 47, ROCK_SLIDE
	db 54, EXPLOSION
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, TAIL_WHIP
	db 10, EMBER
	db 15, FLAME_WHEEL
	db 19, STOMP
	db 25, FIRE_SPIN
	db 31, TAKE_DOWN
	db 36, AGILITY
	db 42, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, GROWL
	db 1, TAIL_WHIP
	db 1, EMBER
	db 15, FLAME_WHEEL
	db 19, STOMP
	db 25, FIRE_SPIN
	db 31, TAKE_DOWN
	db 36, AGILITY
	db 40, FURY_ATTACK
	db 48, FIRE_BLAST
	db 56, MEGAHORN
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_ITEM, KINGS_ROCK, SLOWKING
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 11, WATER_GUN
	db 17, CONFUSION
	db 22, DISABLE
	db 27, HEADBUTT
	db 33, AMNESIA
	db 38, PSYCHIC_M
	db 43, RAIN_DANCE
	db 49, PSYCH_UP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, FUTURE_SIGHT
	db 1, CURSE
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 17, CONFUSION
	db 23, DISABLE
	db 28, HEADBUTT
	db 34, AMNESIA
	db 37, WITHDRAW
	db 43, PSYCHIC_M
	db 49, RAIN_DANCE
	db 55, PSYCH_UP
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, THUNDERSHOCK
	db 10, SUPERSONIC
	db 14, SONICBOOM
	db 19, THUNDER_WAVE
	db 23, SPARK
	db 28, SCREECH
	db 32, SWIFT
	db 37, THUNDERBOLT
	db 41, LIGHT_SCREEN
	db 46, LOCK_ON
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 1, SUPERSONIC
	db 1, SONICBOOM
	db 19, THUNDER_WAVE
	db 23, SPARK
	db 28, SCREECH
	db 34, TRI_ATTACK
	db 40, THUNDERBOLT
	db 45, LIGHT_SCREEN
	db 50, LOCK_ON
	db 56, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, SAND_ATTACK
	db 4, LEER
	db 9, FURY_ATTACK
	db 13, FURY_CUTTER
	db 19, WING_ATTACK
	db 25, FEINT_ATTACK
	db 31, SLASH
	db 37, SWORDS_DANCE
	db 43, AGILITY
	db 49, FALSE_SWIPE
	db 55, SKY_ATTACK
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 10, RAGE
	db 14, FURY_ATTACK
	db 19, PURSUIT
	db 25, AGILITY
	db 31, SWORDS_DANCE
	db 36, DRILL_PECK
	db 42, JUMP_KICK
	db 47, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, QUICK_ATTACK
	db 1, RAGE
	db 14, FURY_ATTACK
	db 19, PURSUIT
	db 25, AGILITY
	db 31, TRI_ATTACK
	db 33, SWORDS_DANCE
	db 39, DRILL_PECK
	db 46, JUMP_KICK
	db 52, THRASH
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 4, GROWL
	db 8, ENCORE
	db 12, ICY_WIND
	db 16, REST
	db 20, AURORA_BEAM
	db 26, WATERFALL
	db 32, TAKE_DOWN
	db 38, ICE_BEAM
	db 44, SAFEGUARD
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 1, ENCORE
	db 1, ICY_WIND
	db 16, REST
	db 20, AURORA_BEAM
	db 26, WATERFALL
	db 32, TAKE_DOWN
	db 40, ICE_BEAM
	db 48, SAFEGUARD
	db 56, DOUBLE_EDGE
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 7, HARDEN
	db 11, MUD_SLAP
	db 15, DISABLE
	db 21, SLUDGE
	db 25, MINIMIZE
	db 30, SCREECH
	db 36, ACID_ARMOR
	db 40, SLUDGE_BOMB
	db 45, TOXIC
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 1, HARDEN
	db 1, MUD_SLAP
	db 15, DISABLE
	db 21, SLUDGE
	db 25, MINIMIZE
	db 30, SCREECH
	db 36, ACID_ARMOR
	db 44, SLUDGE_BOMB
	db 52, TOXIC
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 6, WATER_GUN
	db 12, LEER
	db 17, SUPERSONIC
	db 22, AURORA_BEAM
	db 28, CLAMP
	db 33, PROTECT
	db 38, SCREECH
	db 44, ICE_BEAM
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, WITHDRAW
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 38, SPIKES
	db 44, SPIKE_CANNON
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 4, SMOG
	db 8, SPITE
	db 12, MEAN_LOOK
	db 16, CURSE
	db 20, NIGHT_SHADE
	db 24, POISON_GAS
	db 29, CONFUSE_RAY
	db 35, SHADOW_BALL
	db 41, DREAM_EATER
	db 48, DESTINY_BOND
	db 55, NIGHTMARE
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, -1, GENGAR
	db EVOLVE_ITEM, LINKING_CORD, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SMOG
	db 1, SPITE
	db 12, MEAN_LOOK
	db 16, CURSE
	db 20, NIGHT_SHADE
	db 24, POISON_GAS
	db 31, CONFUSE_RAY
	db 39, SHADOW_BALL
	db 46, DREAM_EATER
	db 53, DESTINY_BOND
	db 60, NIGHTMARE
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SMOG
	db 1, SPITE
	db 12, MEAN_LOOK
	db 16, CURSE
	db 20, NIGHT_SHADE
	db 24, POISON_GAS
	db 31, CONFUSE_RAY
	db 39, SHADOW_BALL
	db 46, DREAM_EATER
	db 53, DESTINY_BOND
	db 60, NIGHTMARE
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_ITEM, METAL_COAT, STEELIX
	db EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 4, SCREECH
	db 8, BIND
	db 12, ROCK_THROW
	db 17, RAGE
	db 22, SANDSTORM
	db 26, SLAM
	db 31, DRAGONBREATH
	db 35, CURSE
	db 40, IRON_TAIL
	db 44, DIG
	db 49, DOUBLE_EDGE
	db 53, ROCK_SLIDE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 7, DISABLE
	db 10, CONFUSION
	db 16, HEADBUTT
	db 19, POISON_GAS
	db 25, MEDITATE
	db 28, PSYBEAM
	db 34, PSYCH_UP
	db 37, SWAGGER
	db 43, PSYCHIC_M
	db 46, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 1, DISABLE
	db 1, CONFUSION
	db 16, HEADBUTT
	db 19, POISON_GAS
	db 26, MEDITATE
	db 32, PSYBEAM
	db 39, PSYCH_UP
	db 45, SWAGGER
	db 52, PSYCHIC_M
	db 58, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, LEER
	db 9, VICEGRIP
	db 13, HARDEN
	db 17, BUBBLEBEAM
	db 21, METAL_CLAW
	db 25, STOMP
	db 29, PROTECT
	db 33, SLAM
	db 36, SWORDS_DANCE
	db 40, CRABHAMMER
	db 44, FLAIL
	db 48, GUILLOTINE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 1, VICEGRIP
	db 13, HARDEN
	db 17, BUBBLEBEAM
	db 21, METAL_CLAW
	db 25, STOMP
	db 30, PROTECT
	db 36, SLAM
	db 41, SWORDS_DANCE
	db 47, CRABHAMMER
	db 52, FLAIL
	db 58, GUILLOTINE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, THUNDERSHOCK
	db 9, SONICBOOM
	db 14, SCREECH
	db 17, ROLLOUT
	db 22, SPARK
	db 25, SELFDESTRUCT
	db 30, LIGHT_SCREEN
	db 33, SWIFT
	db 38, THUNDERBOLT
	db 41, EXPLOSION
	db 46, MIRROR_COAT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 1, SONICBOOM
	db 1, SCREECH
	db 17, ROLLOUT
	db 22, SPARK
	db 25, SELFDESTRUCT
	db 33, LIGHT_SCREEN
	db 37, SWIFT
	db 44, THUNDERBOLT
	db 48, EXPLOSION
	db 55, MIRROR_COAT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 6, ABSORB
	db 10, REFLECT
	db 15, LEECH_SEED
	db 19, CONFUSION
	db 24, MEGA_DRAIN
	db 28, STUN_SPORE
	db 30, POISONPOWDER
	db 32, SLEEP_POWDER
	db 37, GIGA_DRAIN
	db 41, PSYCHIC_M
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 1, ABSORB
	db 1, CONFUSION
	db 19, STOMP
	db 28, EGG_BOMB
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, GROWL
	db 5, LEER
	db 9, BONE_CLUB
	db 13, HEADBUTT
	db 17, FOCUS_ENERGY
	db 21, BONE_RUSH
	db 25, RAGE
	db 29, FALSE_SWIPE
	db 33, THRASH
	db 37, BONEMERANG
	db 41, DOUBLE_EDGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, GROWL
	db 1, LEER
	db 1, BONE_CLUB
	db 13, HEADBUTT
	db 17, FOCUS_ENERGY
	db 21, BONE_RUSH
	db 25, RAGE
	db 32, FALSE_SWIPE
	db 38, THRASH
	db 44, BONEMERANG
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, PURSUIT
	db 20, DOUBLE_KICK
	db 24, MEDITATE
	db 28, ROLLING_KICK
	db 32, JUMP_KICK
	db 36, LOW_KICK
	db 40, ENDURE
	db 44, MIND_READER
	db 48, MEGA_KICK
	db 52, HI_JUMP_KICK
	db 56, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, MACH_PUNCH
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, PURSUIT
	db 20, MACH_PUNCH
	db 24, COMET_PUNCH
	db 28, THUNDERPUNCH
	db 28, ICE_PUNCH
	db 28, FIRE_PUNCH
	db 32, DETECT
	db 36, AGILITY
	db 40, MEGA_PUNCH
	db 44, MIND_READER
	db 48, COUNTER
	db 52, DYNAMICPUNCH
	db 56, REVERSAL
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 6, DEFENSE_CURL
	db 10, SUPERSONIC
	db 15, WRAP
	db 19, STOMP
	db 24, DISABLE
	db 28, SLAM
	db 33, ROLLOUT
	db 37, SCREECH
	db 42, THRASH
	db 46, AMNESIA
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 5, SMOG
	db 10, SMOKESCREEN
	db 14, FEINT_ATTACK
	db 19, SLUDGE
	db 23, SELFDESTRUCT
	db 28, HAZE
	db 32, TOXIC
	db 37, SLUDGE_BOMB
	db 41, EXPLOSION
	db 46, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 1, SMOG
	db 1, SMOKESCREEN
	db 14, FEINT_ATTACK
	db 19, SLUDGE
	db 23, SELFDESTRUCT
	db 28, HAZE
	db 32, TOXIC
	db 38, SLUDGE_BOMB
	db 44, EXPLOSION
	db 50, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, FURY_ATTACK
	db 11, SCARY_FACE
	db 16, ROCK_THROW
	db 22, HORN_ATTACK
	db 26, MAGNITUDE
	db 31, STOMP
	db 37, ROCK_SLIDE
	db 41, TAKE_DOWN
	db 46, EARTHQUAKE
	db 52, MEGAHORN
	db 56, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, FURY_ATTACK
	db 1, SCARY_FACE
	db 16, ROCK_THROW
	db 22, HORN_ATTACK
	db 26, MAGNITUDE
	db 31, STOMP
	db 37, ROCK_SLIDE
	db 41, TAKE_DOWN
	db 49, EARTHQUAKE
	db 57, MEGAHORN
	db 65, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, DEFENSE_CURL
	db 13, DOUBLESLAP
	db 18, SING
	db 23, MINIMIZE
	db 28, EGG_BOMB
	db 33, SOFTBOILED
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, ABSORB
	db 5, SLEEP_POWDER
	db 10, VINE_WHIP
	db 14, POISONPOWDER
	db 19, GROWTH
	db 23, MEGA_DRAIN
	db 28, BIND
	db 32, STUN_SPORE
	db 37, ANCIENTPOWER
	db 41, GIGA_DRAIN
	db 46, SLAM
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, TAIL_WHIP
	db 6, GROWL
	db 12, BITE
	db 17, RAGE
	db 23, MEGA_PUNCH
	db 28, FOCUS_ENERGY
	db 34, DIZZY_PUNCH
	db 39, CRUNCH
	db 44, ENDURE
	db 49, REVERSAL
	db 55, OUTRAGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 7, SMOKESCREEN
	db 10, WATER_GUN
	db 16, TWISTER
	db 19, FOCUS_ENERGY
	db 25, BUBBLEBEAM
	db 28, DRAGON_RAGE
	db 34, AGILITY
	db 37, DRAGONBREATH
	db 43, HYDRO_PUMP
	db 46, RAIN_DANCE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, DRAGON_SCALE, KINGDRA
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 10, WATER_GUN
	db 16, TWISTER
	db 19, FOCUS_ENERGY
	db 25, BUBBLEBEAM
	db 28, DRAGON_RAGE
	db 35, AGILITY
	db 40, DRAGONBREATH
	db 47, HYDRO_PUMP
	db 52, RAIN_DANCE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 7, SUPERSONIC
	db 11, WATER_GUN
	db 17, FURY_ATTACK
	db 21, FLAIL
	db 27, HORN_ATTACK
	db 31, WATERFALL
	db 37, AGILITY
	db 41, MEGAHORN
	db 47, HORN_DRILL
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 1, SUPERSONIC
	db 11, WATER_GUN
	db 17, FURY_ATTACK
	db 21, FLAIL
	db 27, HORN_ATTACK
	db 31, WATERFALL
	db 40, AGILITY
	db 47, MEGAHORN
	db 56, HORN_DRILL
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 6, WATER_GUN
	db 10, RAPID_SPIN
	db 14, MINIMIZE
	db 19, PSYWAVE
	db 23, SWIFT
	db 27, BUBBLEBEAM
	db 32, PSYBEAM
	db 37, RECOVER
	db 41, CONFUSE_RAY
	db 45, PSYCHIC_M
	db 50, LIGHT_SCREEN
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWIFT
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, BUBBLEBEAM
	db 32, CONFUSE_RAY
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 5, CONFUSION
	db 9, MEDITATE
	db 13, DOUBLESLAP
	db 17, MIMIC
	db 17, PSYWAVE
	db 21, LIGHT_SCREEN
	db 21, REFLECT
	db 25, PSYBEAM
	db 29, ENCORE
	db 33, SUBSTITUTE
	db 37, PSYCHIC_M
	db 41, BATON_PASS
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_ITEM, METAL_COAT, SCIZOR
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, WING_ATTACK
	db 34, FURY_CUTTER
	db 39, SLASH
	db 43, DOUBLE_TEAM
	db 48, RAZOR_WIND
	db 54, SWORDS_DANCE
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 1, LOVELY_KISS
	db 1, POWDER_SNOW
	db 15, DOUBLESLAP
	db 19, CONFUSION
	db 24, ICE_PUNCH
	db 28, MEAN_LOOK
	db 35, BODY_SLAM
	db 41, PSYCHIC_M
	db 48, PERISH_SONG
	db 54, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, THUNDERSHOCK
	db 1, LOW_KICK
	db 14, SWIFT
	db 19, THUNDER_WAVE
	db 25, THUNDERPUNCH
	db 32, LIGHT_SCREEN
	db 41, THUNDERBOLT
	db 47, SCREECH
	db 56, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, LEER
	db 1, EMBER
	db 1, SMOKESCREEN
	db 14, FEINT_ATTACK
	db 19, FIRE_SPIN
	db 25, FIRE_PUNCH
	db 32, CONFUSE_RAY
	db 41, FLAMETHROWER
	db 47, SUNNY_DAY
	db 56, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 1, FOCUS_ENERGY
	db 7, BIND
	db 12, SEISMIC_TOSS
	db 18, HARDEN
	db 23, REVERSAL
	db 29, VITAL_THROW
	db 34, THRASH
	db 40, SWORDS_DANCE
	db 45, SUBMISSION
	db 51, GUILLOTINE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 9, RAGE
	db 15, PURSUIT
	db 20, HORN_ATTACK
	db 26, SCARY_FACE
	db 31, TAKE_DOWN
	db 37, REST
	db 42, SWAGGER
	db 48, THRASH
	db 53, DOUBLE_EDGE
	db 59, OUTRAGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BITE
	db 20, BITE
	db 23, LEER
	db 27, TWISTER
	db 30, DRAGON_RAGE
	db 34, SCARY_FACE
	db 37, CRUNCH
	db 41, THRASH
	db 44, HYDRO_PUMP
	db 48, RAIN_DANCE
	db 51, OUTRAGE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 7, MIST
	db 12, BUBBLEBEAM
	db 18, BODY_SLAM
	db 23, CONFUSE_RAY
	db 29, PERISH_SONG
	db 34, ICE_BEAM
	db 40, RAIN_DANCE
	db 45, SAFEGUARD
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAYEVE, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, GROWL
	db 14, QUICK_ATTACK
	db 18, BITE
	db 23, SWIFT
	db 27, TAKE_DOWN
	db 33, CHARM
	db 38, BATON_PASS
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, WATER_GUN
	db 14, QUICK_ATTACK
	db 18, BITE
	db 23, BUBBLEBEAM
	db 27, AURORA_BEAM
	db 33, ACID_ARMOR
	db 38, HAZE
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, THUNDERSHOCK
	db 14, QUICK_ATTACK
	db 18, DOUBLE_KICK
	db 23, SPARK
	db 27, PIN_MISSILE
	db 33, AGILITY
	db 38, THUNDER_WAVE
	db 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, EMBER
	db 14, QUICK_ATTACK
	db 18, BITE
	db 23, FLAME_WHEEL
	db 27, FIRE_SPIN
	db 33, SMOG
	db 38, SCARY_FACE
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_ITEM, UP_GRADE, PORYGON2
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SHARPEN
	db 1, CONVERSION
	db 9, THUNDERSHOCK
	db 12, PSYBEAM
	db 20, CONVERSION2
	db 24, AGILITY
	db 32, RECOVER
	db 36, TRI_ATTACK
	db 44, LOCK_ON
	db 48, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 6, ROLLOUT
	db 13, BITE
	db 18, WATER_GUN
	db 25, LEER
	db 30, ANCIENTPOWER
	db 37, PROTECT
	db 42, ROCK_SLIDE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 1, ROLLOUT
	db 13, BITE
	db 18, WATER_GUN
	db 25, LEER
	db 30, ANCIENTPOWER
	db 37, PROTECT
	db 40, SPIKE_CANNON
	db 44, ROCK_SLIDE
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 6, ABSORB
	db 13, ROLLOUT
	db 18, LEER
	db 25, SAND_ATTACK
	db 30, ANCIENTPOWER
	db 37, ENDURE
	db 46, GIGA_DRAIN
	db 55, ROCK_SLIDE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, ABSORB
	db 13, ROLLOUT
	db 18, LEER
	db 25, SAND_ATTACK
	db 30, ANCIENTPOWER
	db 37, ENDURE
	db 40, SLASH
	db 44, GIGA_DRAIN
	db 53, ROCK_SLIDE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, SUPERSONIC
	db 7, BITE
	db 15, SCARY_FACE
	db 21, ROAR
	db 29, AGILITY
	db 35, ANCIENTPOWER
	db 43, CRUNCH
	db 49, TAKE_DOWN
	db 57, HYPER_BEAM
	db 63, ROCK_SLIDE
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 12, AMNESIA
	db 17, LICK
	db 23, BELLY_DRUM
	db 28, REST
	db 34, SNORE
	db 34, SLEEP_TALK
	db 39, BODY_SLAM
	db 45, ROLLOUT
	db 50, CRUNCH
	db 56, HYPER_BEAM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 8, MIST
	db 15, REFLECT
	db 22, ICY_WIND
	db 29, AGILITY
	db 36, ANCIENTPOWER
	db 43, WING_ATTACK
	db 50, ICE_BEAM
	db 57, MIND_READER
	db 64, BLIZZARD
	db 71, SKY_ATTACK
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 8, DETECT
	db 15, LIGHT_SCREEN
	db 22, SPARK
	db 29, AGILITY
	db 36, ANCIENTPOWER
	db 43, DRILL_PECK
	db 50, THUNDERBOLT
	db 57, THUNDER_WAVE
	db 64, THUNDER
	db 71, SKY_ATTACK
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, EMBER
	db 8, ENDURE
	db 15, SAFEGUARD
	db 22, FIRE_SPIN
	db 29, AGILITY
	db 36, ANCIENTPOWER
	db 43, WING_ATTACK
	db 50, FLAMETHROWER
	db 57, SUNNY_DAY
	db 64, SOLARBEAM
	db 71, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 36, AGILITY
	db 43, SAFEGUARD
	db 50, OUTRAGE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 56, OUTRAGE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 55, WING_ATTACK
	db 61, OUTRAGE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, DISABLE
	db 11, BARRIER
	db 22, PSYCH_UP
	db 33, SWIFT
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, AMNESIA
	db 88, RECOVER
	db 99, SAFEGUARD
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, TRANSFORM
	db 10, MEGA_PUNCH
	db 20, METRONOME
	db 30, PSYCHIC_M
	db 40, BARRIER
	db 50, ANCIENTPOWER
	db 60, AMNESIA
	db 70, BATON_PASS
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, POISONPOWDER
	db 15, SYNTHESIS
	db 21, REFLECT
	db 26, BODY_SLAM
	db 32, SWEET_SCENT
	db 37, LIGHT_SCREEN
	db 43, SAFEGUARD
	db 47, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 12, POISONPOWDER
	db 15, SYNTHESIS
	db 22, REFLECT
	db 28, BODY_SLAM
	db 33, SWEET_SCENT
	db 40, LIGHT_SCREEN
	db 46, SAFEGUARD
	db 51, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, POISONPOWDER
	db 15, SYNTHESIS
	db 22, REFLECT
	db 28, BODY_SLAM
	db 32, PETAL_DANCE
	db 35, SWEET_SCENT
	db 41, LIGHT_SCREEN
	db 48, SAFEGUARD
	db 54, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 11, EMBER
	db 17, QUICK_ATTACK
	db 22, FLAME_WHEEL
	db 27, DEFENSE_CURL
	db 33, SWIFT
	db 38, ROLLOUT
	db 43, FLAMETHROWER
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 11, EMBER
	db 18, QUICK_ATTACK
	db 24, FLAME_WHEEL
	db 29, DEFENSE_CURL
	db 35, SWIFT
	db 41, ROLLOUT
	db 48, FLAMETHROWER
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 1, EMBER
	db 18, QUICK_ATTACK
	db 24, FLAME_WHEEL
	db 29, DEFENSE_CURL
	db 35, SWIFT
	db 42, ROLLOUT
	db 50, FLAMETHROWER
	db 58, DOUBLE_EDGE
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 7, RAGE
	db 12, WATER_GUN
	db 17, BITE
	db 22, SCARY_FACE
	db 28, CRUNCH
	db 33, SLASH
	db 38, SCREECH
	db 44, THRASH
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 7, RAGE
	db 12, WATER_GUN
	db 17, BITE
	db 23, SCARY_FACE
	db 30, CRUNCH
	db 35, SLASH
	db 41, SCREECH
	db 48, THRASH
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, RAGE
	db 1, WATER_GUN
	db 17, BITE
	db 23, SCARY_FACE
	db 30, AGILITY
	db 32, CRUNCH
	db 37, SLASH
	db 45, SCREECH
	db 52, THRASH
	db 59, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, FORESIGHT
	db 5, DEFENSE_CURL
	db 10, QUICK_ATTACK
	db 14, FURY_SWIPES
	db 19, CHARM
	db 23, SLAM
	db 28, AMNESIA
	db 32, FEINT_ATTACK
	db 37, REST
	db 41, BATON_PASS
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, FORESIGHT
	db 1, DEFENSE_CURL
	db 1, QUICK_ATTACK
	db 14, FURY_SWIPES
	db 15, AGILITY
	db 20, CHARM
	db 25, SLAM
	db 31, AMNESIA
	db 36, FEINT_ATTACK
	db 42, REST
	db 47, BATON_PASS
	db 53, DOUBLE_EDGE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 7, PECK
	db 12, HYPNOSIS
	db 17, REFLECT
	db 22, CONFUSION
	db 28, WING_ATTACK
	db 34, TAKE_DOWN
	db 45, DREAM_EATER
	db 52, SKY_ATTACK
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 1, PECK
	db 12, HYPNOSIS
	db 17, REFLECT
	db 23, CONFUSION
	db 30, WING_ATTACK
	db 38, TAKE_DOWN
	db 52, DREAM_EATER
	db 58, SKY_ATTACK
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SUPERSONIC
	db 8, COMET_PUNCH
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 12, SAFEGUARD
	db 16, MACH_PUNCH
	db 19, PSYBEAM
	db 23, MORNING_SUN
	db 27, SWIFT
	db 30, BATON_PASS
	db 34, AGILITY
	db 37, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SUPERSONIC
	db 1, COMET_PUNCH
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 12, SAFEGUARD
	db 16, MACH_PUNCH
	db 21, PSYBEAM
	db 25, MORNING_SUN
	db 30, SWIFT
	db 34, BATON_PASS
	db 39, AGILITY
	db 43, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 5, CONSTRICT
	db 9, LEECH_LIFE
	db 12, SCARY_FACE
	db 16, NIGHT_SHADE
	db 20, FURY_SWIPES
	db 23, FEINT_ATTACK
	db 27, SPIDER_WEB
	db 31, AGILITY
	db 34, PIN_MISSILE
	db 38, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, CONSTRICT
	db 1, LEECH_LIFE
	db 12, SCARY_FACE
	db 16, NIGHT_SHADE
	db 20, FURY_SWIPES
	db 22, SWORDS_DANCE
	db 25, FEINT_ATTACK
	db 30, SPIDER_WEB
	db 34, AGILITY
	db 39, PIN_MISSILE
	db 44, PSYCHIC_M
	db 0 ; no more level-up moves

;CrobatEvosAttacks: moved to golbat's to save space

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SUPERSONIC
	db 6, THUNDER_WAVE
	db 10, THUNDERSHOCK
	db 14, WATER_GUN
	db 19, CONFUSE_RAY
	db 23, SPARK
	db 27, BUBBLEBEAM
	db 32, FLAIL
	db 36, TAKE_DOWN
	db 40, THUNDERBOLT
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SUPERSONIC
	db 1, THUNDER_WAVE
	db 10, THUNDERSHOCK
	db 14, WATER_GUN
	db 19, CONFUSE_RAY
	db 23, SPARK
	db 29, BUBBLEBEAM
	db 35, FLAIL
	db 41, TAKE_DOWN
	db 47, THUNDERBOLT
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, SWEET_KISS
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 13, SWEET_KISS
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, SING
	db 9, DEFENSE_CURL
	db 14, SWEET_KISS
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 6, METRONOME
	db 13, SWEET_KISS
	db 18, ENCORE
	db 25, ANCIENTPOWER
	db 30, SAFEGUARD
	db 37, DOUBLE_EDGE
	db 42, BATON_PASS
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 6, METRONOME
	db 13, SWEET_KISS
	db 18, ENCORE
	db 25, ANCIENTPOWER
	db 30, SAFEGUARD
	db 37, DOUBLE_EDGE
	db 42, BATON_PASS
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 6, CONFUSION
	db 12, TELEPORT
	db 18, NIGHT_SHADE
	db 24, CONFUSE_RAY
	db 30, PSYCHIC_M
	db 36, DRILL_PECK
	db 42, FUTURE_SIGHT
	db 48, SAFEGUARD
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 1, CONFUSION
	db 1, TELEPORT
	db 18, NIGHT_SHADE
	db 24, CONFUSE_RAY
	db 32, PSYCHIC_M
	db 40, DRILL_PECK
	db 48, FUTURE_SIGHT
	db 56, SAFEGUARD
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, GROWL
	db 9, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 17, TAKE_DOWN
	db 21, SPARK
	db 25, COTTON_SPORE
	db 29, CONFUSE_RAY
	db 33, LIGHT_SCREEN
	db 37, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 18, TAKE_DOWN
	db 24, SPARK
	db 29, COTTON_SPORE
	db 35, CONFUSE_RAY
	db 40, LIGHT_SCREEN
	db 46, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 18, TAKE_DOWN
	db 24, SPARK
	db 29, COTTON_SPORE
	db 30, THUNDERPUNCH
	db 36, CONFUSE_RAY
	db 44, LIGHT_SCREEN
	db 53, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 50, PETAL_DANCE
	db 60, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, WATER_GUN
	db 10, DEFENSE_CURL
	db 15, ROLLOUT
	db 19, SLAM
	db 24, BUBBLEBEAM
	db 28, CHARM
	db 33, BELLY_DRUM
	db 37, RAIN_DANCE
	db 42, HYDRO_PUMP
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 10, DEFENSE_CURL
	db 15, ROLLOUT
	db 20, SLAM
	db 26, BUBBLEBEAM
	db 32, CHARM
	db 38, BELLY_DRUM
	db 44, RAIN_DANCE
	db 50, HYDRO_PUMP
	db 56, DOUBLE_EDGE
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, FLAIL
	db 8, LOW_KICK
	db 15, MIMIC
	db 22, SLAM
	db 29, ROCK_SLIDE
	db 36, FEINT_ATTACK
	db 43, COUNTER
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 42, SWAGGER
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 4, SYNTHESIS
	db 7, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 13, SLEEP_POWDER
	db 17, GUST
	db 20, LEECH_SEED
	db 23, MEGA_DRAIN
	db 27, COTTON_SPORE
	db 30, AMNESIA
	db 33, GIGA_DRAIN
	db 37, DOUBLE_EDGE
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 1, SYNTHESIS
	db 7, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 13, SLEEP_POWDER
	db 17, GUST
	db 21, LEECH_SEED
	db 26, MEGA_DRAIN
	db 30, COTTON_SPORE
	db 34, AMNESIA
	db 39, GIGA_DRAIN
	db 43, DOUBLE_EDGE
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 13, SLEEP_POWDER
	db 17, GUST
	db 21, LEECH_SEED
	db 26, MEGA_DRAIN
	db 31, COTTON_SPORE
	db 37, AMNESIA
	db 43, GIGA_DRAIN
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, BATON_PASS
	db 16, FURY_SWIPES
	db 20, SWIFT
	db 26, MUD_SLAP
	db 30, SCREECH
	db 36, AGILITY
	db 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, TACKLE
	db 5, GROWTH
	db 9, MEGA_DRAIN
	db 13, RAZOR_LEAF
	db 17, SING
	db 21, LEECH_SEED
	db 25, GIGA_DRAIN
	db 29, SYNTHESIS
	db 33, SOLARBEAM
	db 37, DOUBLE_EDGE
	db 41, SUNNY_DAY
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, POUND
	db 5, GROWTH
	db 9, MEGA_DRAIN
	db 13, RAZOR_LEAF
	db 17, SING
	db 21, LEECH_SEED
	db 25, GIGA_DRAIN
	db 29, PETAL_DANCE
	db 33, SOLARBEAM
	db 37, DOUBLE_EDGE
	db 41, SUNNY_DAY
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, FORESIGHT
	db 5, GUST
	db 9, DOUBLE_TEAM
	db 13, SONICBOOM
	db 15, DETECT
	db 19, LEECH_LIFE
	db 23, SUPERSONIC
	db 27, HYPNOSIS
	db 29, PURSUIT
	db 33, ANCIENTPOWER
	db 37, WING_ATTACK
	db 41, SCREECH
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 7, MUD_SLAP
	db 12, MIST
	db 12, HAZE
	db 15, SLAM
	db 21, RAIN_DANCE
	db 26, AMNESIA
	db 29, SURF
	db 35, TOXIC
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 1, MUD_SLAP
	db 12, MIST
	db 12, HAZE
	db 15, SLAM
	db 21, RAIN_DANCE
	db 27, AMNESIA
	db 32, SURF
	db 39, TOXIC
	db 47, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, CONFUSION
	db 14, QUICK_ATTACK
	db 18, SWIFT
	db 23, PSYBEAM
	db 27, PSYCH_UP
	db 33, FUTURE_SIGHT
	db 38, MORNING_SUN
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 10, PURSUIT
	db 14, QUICK_ATTACK
	db 18, CONFUSE_RAY
	db 23, FEINT_ATTACK
	db 27, SCREECH
	db 33, MEAN_LOOK
	db 38, MOONLIGHT
	db 45, CRUNCH
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 5, PURSUIT
	db 11, HAZE
	db 15, WING_ATTACK
	db 21, NIGHT_SHADE
	db 25, MEAN_LOOK
	db 31, FEINT_ATTACK
	db 35, SCREECH
	db 41, DRILL_PECK
	db 45, PERISH_SONG
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, FUTURE_SIGHT
	db 1, CURSE
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 17, CONFUSION
	db 22, DISABLE
	db 27, HEADBUTT
	db 33, SWAGGER
	db 38, PSYCHIC_M
	db 43, RAIN_DANCE
	db 49, PSYCH_UP
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, PSYWAVE
	db 6, SPITE
	db 11, CONFUSE_RAY
	db 17, MEAN_LOOK
	db 22, NIGHT_SHADE
	db 27, PSYBEAM
	db 33, PAIN_SPLIT
	db 38, CURSE
	db 43, SHADOW_BALL
	db 49, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, CONFUSION
	db 13, STOMP
	db 19, PSYBEAM
	db 25, AGILITY
	db 31, DOUBLE_KICK
	db 37, BATON_PASS
	db 43, PSYCHIC_M
	db 49, CRUNCH
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 6, SELFDESTRUCT
	db 9, ROLLOUT
	db 12, TAKE_DOWN
	db 17, RAPID_SPIN
	db 20, BIDE
	db 23, CURSE
	db 28, SPIKES
	db 31, PIN_MISSILE
	db 34, EXPLOSION
	db 39, ENDURE
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 1, SELFDESTRUCT
	db 1, ROLLOUT
	db 12, TAKE_DOWN
	db 17, RAPID_SPIN
	db 20, BIDE
	db 23, CURSE
	db 28, SPIKES
	db 32, PIN_MISSILE
	db 36, EXPLOSION
	db 42, ENDURE
	db 46, DOUBLE_EDGE
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, DEFENSE_CURL
	db 4, SPITE
	db 8, ROLLOUT
	db 11, PURSUIT
	db 15, SCREECH
	db 18, MUD_SLAP
	db 22, ANCIENTPOWER
	db 25, BODY_SLAM
	db 29, CURSE
	db 32, TAKE_DOWN
	db 36, GLARE
	db 39, DIG
	db 43, DOUBLE_EDGE
	db 46, ENDURE
	db 50, FLAIL
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 5, SAND_ATTACK
	db 9, HARDEN
	db 13, QUICK_ATTACK
	db 16, FURY_CUTTER
	db 20, WING_ATTACK
	db 23, FEINT_ATTACK
	db 27, SCREECH
	db 31, SLASH
	db 36, SWORDS_DANCE
	db 42, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 4, SCREECH
	db 8, BIND
	db 12, ROCK_THROW
	db 17, RAGE
	db 22, SANDSTORM
	db 26, SLAM
	db 31, DRAGONBREATH
	db 35, CURSE
	db 40, IRON_TAIL
	db 44, CRUNCH
	db 49, DOUBLE_EDGE
	db 53, ROCK_SLIDE
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 1, TAIL_WHIP
	db 1, CHARM
	db 8, BITE
	db 13, LICK
	db 19, HEADBUTT
	db 25, ROAR
	db 31, RAGE
	db 37, CRUNCH
	db 43, TAKE_DOWN
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 1, TAIL_WHIP
	db 1, CHARM
	db 8, BITE
	db 13, LICK
	db 19, HEADBUTT
	db 26, ROAR
	db 33, RAGE
	db 40, CRUNCH
	db 47, TAKE_DOWN
	db 54, OUTRAGE
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, HARDEN
	db 1, TACKLE
	db 1, POISON_STING
	db 8, WATER_GUN
	db 12, MINIMIZE
	db 19, SPIKES
	db 23, ROLLOUT
	db 30, REVERSAL
	db 34, PIN_MISSILE
	db 41, TAKE_DOWN
	db 45, HYDRO_PUMP
	db 52, DESTINY_BOND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, METAL_CLAW
	db 34, FURY_CUTTER
	db 39, SLASH
	db 43, DOUBLE_TEAM
	db 48, STEEL_WING
	db 54, SWORDS_DANCE
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 6, BIDE
	db 12, ROLLOUT
	db 16, ENCORE
	db 21, WRAP
	db 27, ROCK_THROW
	db 31, SAFEGUARD
	db 36, REST
	db 42, ROCK_SLIDE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, FURY_ATTACK
	db 11, ENDURE
	db 17, ROCK_SMASH
	db 22, HORN_ATTACK
	db 28, COUNTER
	db 33, PIN_MISSILE
	db 39, THRASH
	db 44, SWORDS_DANCE
	db 50, REVERSAL
	db 55, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 8, QUICK_ATTACK
	db 11, SCREECH
	db 16, FEINT_ATTACK
	db 21, FURY_SWIPES
	db 27, ICY_WIND
	db 32, AGILITY
	db 38, METAL_CLAW
	db 44, BEAT_UP
	db 49, SLASH
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 7, FURY_SWIPES
	db 13, FEINT_ATTACK
	db 19, SWEET_SCENT
	db 25, SLASH
	db 31, CHARM
	db 37, REST
	db 37, SNORE
	db 43, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 1, FURY_SWIPES
	db 13, FEINT_ATTACK
	db 19, SWEET_SCENT
	db 25, SLASH
	db 33, SCARY_FACE
	db 41, REST
	db 41, SNORE
	db 49, THRASH
	db 56, CROSS_CHOP
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 5, EMBER
	db 10, ROCK_THROW
	db 14, HARDEN
	db 19, RECOVER
	db 23, ANCIENTPOWER
	db 28, FLAME_WHEEL
	db 32, ROCK_SLIDE
	db 37, AMNESIA
	db 41, BODY_SLAM
	db 46, FLAMETHROWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 14, HARDEN
	db 19, RECOVER
	db 23, ANCIENTPOWER
	db 28, FLAME_WHEEL
	db 32, ROCK_SLIDE
	db 37, AMNESIA
	db 43, BODY_SLAM
	db 50, FLAMETHROWER
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, POWDER_SNOW
	db 10, ENDURE
	db 16, MUD_SLAP
	db 20, MIST
	db 25, ICY_WIND
	db 31, TAKE_DOWN
	db 35, AMNESIA
	db 40, EARTHQUAKE
	db 46, BLIZZARD
	db 50, FLAIL
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 1, ENDURE
	db 1, MUD_SLAP
	db 20, MIST
	db 25, ICY_WIND
	db 31, TAKE_DOWN
	db 33, FURY_ATTACK
	db 37, AMNESIA
	db 45, EARTHQUAKE
	db 51, BLIZZARD
	db 58, THRASH
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, HARDEN
	db 11, BUBBLE
	db 15, RECOVER
	db 20, ENDURE
	db 25, BUBBLEBEAM
	db 29, BARRIER
	db 34, ANCIENTPOWER
	db 39, SPIKE_CANNON
	db 43, MIRROR_COAT
	db 48, FLAIL
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 7, PSYBEAM
	db 13, AURORA_BEAM
	db 19, BUBBLEBEAM
	db 25, LOCK_ON
	db 31, ICE_BEAM
	db 37, FOCUS_ENERGY
	db 43, HYDRO_PUMP
	db 49, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, CONSTRICT
	db 7, PSYBEAM
	db 13, AURORA_BEAM
	db 19, BUBBLEBEAM
	db 25, LOCK_ON
	db 25, OCTAZOOKA
	db 32, ICE_BEAM
	db 40, FOCUS_ENERGY
	db 47, HYDRO_PUMP
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 25, DRILL_PECK
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 6, SUPERSONIC
	db 11, HEADBUTT
	db 16, AGILITY
	db 22, BUBBLEBEAM
	db 27, WING_ATTACK
	db 33, PSYBEAM
	db 38, TAKE_DOWN
	db 44, CONFUSE_RAY
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 7, SAND_ATTACK
	db 12, FURY_ATTACK
	db 18, METAL_CLAW
	db 23, AGILITY
	db 29, WING_ATTACK
	db 34, SLASH
	db 40, STEEL_WING
	db 45, SPIKES
	db 51, DRILL_PECK
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 6, SMOG
	db 12, BITE
	db 17, ROAR
	db 22, FLAME_WHEEL
	db 28, FEINT_ATTACK
	db 33, SPITE
	db 38, BEAT_UP
	db 44, FLAMETHROWER
	db 49, CRUNCH
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 6, SMOG
	db 12, BITE
	db 17, ROAR
	db 22, FLAME_WHEEL
	db 29, FEINT_ATTACK
	db 36, SPITE
	db 43, BEAT_UP
	db 50, FLAMETHROWER
	db 57, CRUNCH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 10, WATER_GUN
	db 16, TWISTER
	db 19, FOCUS_ENERGY
	db 25, BUBBLEBEAM
	db 28, DRAGON_RAGE
	db 35, AGILITY
	db 40, DRAGONBREATH
	db 47, HYDRO_PUMP
	db 52, RAIN_DANCE
	db 60, OUTRAGE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, DEFENSE_CURL
	db 10, FLAIL
	db 15, ROLLOUT
	db 19, MAGNITUDE
	db 24, SLAM
	db 28, TAKE_DOWN
	db 33, ENDURE
	db 37, CHARM
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, GROWL
	db 1, DEFENSE_CURL
	db 10, FLAIL
	db 15, ROLLOUT
	db 19, MAGNITUDE
	db 24, SLAM
	db 25, FURY_ATTACK
	db 31, RAPID_SPIN
	db 37, SCARY_FACE
	db 44, EARTHQUAKE
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, CONVERSION
	db 9, THUNDERSHOCK
	db 12, PSYBEAM
	db 20, CONVERSION2
	db 24, AGILITY
	db 32, RECOVER
	db 36, TRI_ATTACK
	db 44, LOCK_ON
	db 48, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, LEER
	db 11, HYPNOSIS
	db 17, STOMP
	db 22, SAND_ATTACK
	db 28, TAKE_DOWN
	db 35, CONFUSE_RAY
	db 40, LIGHT_SCREEN
	db 46, JUMP_KICK
	db 53, DOUBLE_EDGE
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, PURSUIT
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLING_KICK
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, PURSUIT
	db 20, ROLLING_KICK
	db 24, QUICK_ATTACK
	db 28, RAPID_SPIN
	db 32, COUNTER
	db 36, TRIPLE_KICK
	db 40, FEINT_ATTACK
	db 44, AGILITY
	db 48, DIG
	db 52, REVERSAL
	db 56, DETECT
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 6, SWEET_KISS
	db 10, POWDER_SNOW
	db 15, SING
	db 19, CONFUSION
	db 24, ICE_PUNCH
	db 28, MEAN_LOOK
	db 33, BODY_SLAM
	db 37, PSYCHIC_M
	db 42, PERISH_SONG
	db 46, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, THUNDERSHOCK
	db 10, LOW_KICK
	db 14, SWIFT
	db 19, THUNDER_WAVE
	db 25, THUNDERPUNCH
	db 30, LIGHT_SCREEN
	db 36, THUNDERBOLT
	db 41, SCREECH
	db 47, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, LEER
	db 6, EMBER
	db 10, SMOKESCREEN
	db 14, FEINT_ATTACK
	db 19, FIRE_SPIN
	db 25, FIRE_PUNCH
	db 30, CONFUSE_RAY
	db 36, FLAMETHROWER
	db 41, SUNNY_DAY
	db 47, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 25, BIDE
	db 31, ROLLOUT
	db 37, BODY_SLAM
	db 44, HEAL_BELL
	db 51, CHARM
	db 0 ; no more level-up moves

;BlisseyEvosAttacks: moved to chansey's to save space

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, THUNDERSHOCK
	db 1, LEER
	db 1, QUICK_ATTACK
	db 1, BITE
	db 22, SPARK
	db 29, ROAR
	db 36, SWIFT
	db 43, CRUNCH
	db 50, THUNDERBOLT
	db 57, PSYCHIC_M
	db 64, REFLECT
	db 71, RAIN_DANCE
	db 78, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, EMBER
	db 1, LEER
	db 1, FIRE_SPIN
	db 1, BITE
	db 22, FLAME_WHEEL
	db 29, ROAR
	db 36, STOMP
	db 43, CRUNCH
	db 50, FLAMETHROWER
	db 57, PSYCHIC_M
	db 64, SWAGGER
	db 71, SUNNY_DAY
	db 78, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, WATER_GUN
	db 1, LEER
	db 1, BITE
	db 1, RAIN_DANCE
	db 22, GUST
	db 29, BUBBLEBEAM
	db 36, AURORA_BEAM
	db 43, MIST
	db 50, AGILITY
	db 57, PSYCHIC_M
	db 64, MIRROR_COAT
	db 71, HYDRO_PUMP
	db 78, BLIZZARD
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 7, ROCK_THROW
	db 13, SANDSTORM
	db 19, SCREECH
	db 25, ROCK_SLIDE
	db 31, THRASH
	db 37, SCARY_FACE
	db 43, CRUNCH
	db 49, EARTHQUAKE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, ROCK_THROW
	db 13, SANDSTORM
	db 19, SCREECH
	db 25, ROCK_SLIDE
	db 33, THRASH
	db 41, SCARY_FACE
	db 49, CRUNCH
	db 57, EARTHQUAKE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, ROCK_THROW
	db 13, SANDSTORM
	db 19, SCREECH
	db 25, ROCK_SLIDE
	db 33, THRASH
	db 41, SCARY_FACE
	db 49, CRUNCH
	db 61, EARTHQUAKE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWIFT
	db 1, WHIRLWIND
	db 9, GUST
	db 15, WHIRLPOOL
	db 23, DOUBLE_EDGE
	db 29, ANCIENTPOWER
	db 37, PSYCHIC_M
	db 43, RECOVER
	db 50, AEROBLAST
	db 57, RAIN_DANCE
	db 65, SAFEGUARD
	db 71, HYDRO_PUMP
	db 79, FUTURE_SIGHT
	db 85, SKY_ATTACK
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWIFT
	db 1, WHIRLWIND
	db 9, GUST
	db 15, FIRE_SPIN
	db 23, DOUBLE_EDGE
	db 29, ANCIENTPOWER
	db 37, PSYCHIC_M
	db 43, RECOVER
	db 50, SACRED_FIRE
	db 57, SUNNY_DAY
	db 65, SAFEGUARD
	db 71, FIRE_BLAST
	db 79, FUTURE_SIGHT
	db 85, SKY_ATTACK
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, RECOVER
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 19, RAZOR_LEAF
	db 28, ANCIENTPOWER
	db 37, BATON_PASS
	db 46, FUTURE_SIGHT
	db 55, GIGA_DRAIN
	db 64, PERISH_SONG
	db 0 ; no more level-up moves
