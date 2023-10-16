; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
	const_def
	const TRNATTR_ITEM1           ; 0
	const TRNATTR_ITEM2           ; 1
	const TRNATTR_BASEMONEY       ; 2
	const TRNATTR_AI_MOVE_WEIGHTS ; 3
	const TRNATTR_AI2             ; 4
	const TRNATTR_AI_ITEM_SWITCH  ; 5
	const TRNATTR_AI4             ; 6
NUM_TRAINER_ATTRIBUTES EQU const_value

; TRNATTR_AI_MOVE_WEIGHTS bit flags (wEnemyTrainerAIFlags)
; AIScoringPointers indexes (see engine/battle/ai/move.asm)
	const_def
	const       NO_AI
const_value = 0
	shift_const AI_BASIC
	shift_const AI_SETUP
	shift_const AI_TYPES
	shift_const AI_OFFENSIVE
	shift_const AI_SMART
	shift_const AI_OPPORTUNIST
	shift_const AI_AGGRESSIVE
	shift_const AI_CAUTIOUS
	shift_const AI_STATUS
	shift_const AI_RISKY
	shift_const AI_10
	shift_const AI_11
	shift_const AI_12
	shift_const AI_13
	shift_const AI_14
	shift_const AI_15

; TRNATTR_AI_ITEM_SWITCH bit flags
CONTEXT_USE_F      EQU 6
UNKNOWN_USE_F      EQU 5
ALWAYS_USE_F       EQU 4
SWITCH_SOMETIMES_F EQU 2
SWITCH_RARELY_F    EQU 1
SWITCH_OFTEN_F     EQU 0

CONTEXT_USE        EQU 1 << CONTEXT_USE_F
UNKNOWN_USE        EQU 1 << UNKNOWN_USE_F
ALWAYS_USE         EQU 1 << ALWAYS_USE_F
SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F

; TrainerTypes bits (see engine/battle/read_trainer_party.asm)
	const_def
	const TRAINERTYPE_MOVES_F    ; 0
	const TRAINERTYPE_ITEM_F     ; 1
	const TRAINERTYPE_VARIABLE_F ; 3

; Trainer party types (see data/trainers/parties.asm)
DEF TRAINERTYPE_NORMAL     EQU 0
DEF TRAINERTYPE_MOVES      EQU 1 << TRAINERTYPE_MOVES_F
DEF TRAINERTYPE_ITEM       EQU 1 << TRAINERTYPE_ITEM_F
DEF TRAINERTYPE_ITEM_MOVES EQU TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
DEF TRAINERTYPE_VARIABLE   EQU 1 << TRAINERTYPE_VARIABLE_F
