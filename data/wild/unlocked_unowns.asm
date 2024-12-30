MACRO unown_set
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to UNLOCKED_UNOWNS_* constants
	table_width 2
	dw .Set_A_J ; UNLOCKED_UNOWNS_A_TO_J_F
	dw .Set_K_Q ; UNLOCKED_UNOWNS_K_TO_Q_F
	dw .Set_R_V ; UNLOCKED_UNOWNS_R_TO_V_F
	dw .Set_W_Z ; UNLOCKED_UNOWNS_W_TO_Z_F
	assert_table_length NUM_UNLOCKED_UNOWN_SETS

.Set_A_J:
	unown_set A, B, C, D, E, F, G, H, I, J
.Set_K_Q:
	unown_set K, L, M, N, O, P, Q
.Set_R_V:
	unown_set R, S, T, U, V
.Set_W_Z:
	unown_set W, X, Y, Z
