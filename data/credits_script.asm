CreditsScript:

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                STAFF, 1

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 0 ; Pichu

	db             DIRECTOR, 1
	db       SATOSHI_TAJIRI, 2

	db CREDITS_WAIT, 8

	db           CODIRECTOR, 1
	db       JUNICHI_MASUDA, 2

	db CREDITS_WAIT, 8

	db          PROGRAMMERS, 0
	db       SOUSUKE_TAMADA, 1
	db       HISASHI_SOGABE, 2
	db         KEITA_KAGAYA, 3
	db    YOSHINORI_MATSUDA, 4

	db CREDITS_WAIT, 9

	db          PROGRAMMERS, 0
	db     SHIGEKI_MORIMOTO, 1
	db     TETSUYA_WATANABE, 2
	db        TAKENORI_OOTA, 3

	db CREDITS_WAIT, 9

	db    GRAPHICS_DIRECTOR, 1
	db         KEN_SUGIMORI, 2

	db CREDITS_WAIT, 8

	db       MONSTER_DESIGN, 0
	db         KEN_SUGIMORI, 1
	db    MOTOFUMI_FUJIWARA, 2
	db     SHIGEKI_MORIMOTO, 3
	db     HIRONOBU_YOSHIDA, 4
	db         SATOSHI_OOTA, 5

	db CREDITS_WAIT, 9

	db       MONSTER_DESIGN, 0
	db       ATSUKO_NISHIDA, 1
	db          MUNEO_SAITO, 2
	db       RENA_YOSHIKAWA, 3

	db CREDITS_WAIT, 9

	db    POKEMON_ANIMATION, 1
	db     HIRONOBU_YOSHIDA, 2
	db          JUN_OKUTANI, 3

	db CREDITS_WAIT, 8

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 1 ; Smoochum

	db      GRAPHICS_DESIGN, 0
	db     HIRONOBU_YOSHIDA, 1
	db          JUN_OKUTANI, 2
	db       ASUKA_IWASHITA, 3
	db     TETSUYA_WATANABE, 4

	db CREDITS_WAIT, 9

	db         CREDIT_MUSIC, 0
	db       JUNICHI_MASUDA, 1
	db        MORIKAZU_AOKI, 2
	db          GO_ICHINOSE, 3

	db CREDITS_WAIT, 8

	db CREDIT_SOUND_EFFECTS, 0
	db        MORIKAZU_AOKI, 1
	db       JUNICHI_MASUDA, 2
	db     TETSUYA_WATANABE, 3

	db CREDITS_WAIT, 8

	db          GAME_DESIGN, 0
	db       JUNICHI_MASUDA, 1
	db     SHIGEKI_MORIMOTO, 2
	db        KOHJI_NISHINO, 3

	db CREDITS_WAIT, 8

	db          GAME_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db          HITOMI_SATO, 2
	db     KENJI_MATSUSHIMA, 3

	db CREDITS_WAIT, 8

	db        GAME_SCENARIO, 0
	db       JUNICHI_MASUDA, 1
	db        KOHJI_NISHINO, 2
	db  TOSHINOBU_MATSUMIYA, 3
	db     KENJI_MATSUSHIMA, 4

	db CREDITS_WAIT, 9

	db         POKEDEX_TEXT, 1
	db  TOSHINOBU_MATSUMIYA, 2

	db CREDITS_WAIT, 8

	db     TOOL_PROGRAMMING, 1
	db       SOUSUKE_TAMADA, 2
	db        TAKENORI_OOTA, 3

	db CREDITS_WAIT, 8

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 2 ; Ditto

	db    PARAMETRIC_DESIGN, 1
	db        KOHJI_NISHINO, 2

	db CREDITS_WAIT, 8

	db        SCRIPT_DESIGN, 1
	db         TETSUJI_OOTA, 2
	db        NOBUHIRO_SEYA, 3

	db CREDITS_WAIT, 8

	db      MAP_DATA_DESIGN, 1
	db         TETSUJI_OOTA, 2
	db      KAZUHITO_SEKINE, 3

	db CREDITS_WAIT, 8

	db           MAP_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db        KOHJI_NISHINO, 2
	db        NOBUHIRO_SEYA, 3

	db CREDITS_WAIT, 8

	db         COORDINATION, 1
	db      HIROYUKI_ZINNAI, 2

	db CREDITS_WAIT, 8

	db            PRODUCERS, 0
	db         SATORU_IWATA, 1
	db       SATOSHI_YAMATO, 2
	db     SHIGERU_MIYAMOTO, 3

	db CREDITS_WAIT, 8

	db            PRODUCERS, 1
	db   TSUNEKAZU_ISHIHARA, 2

	db CREDITS_WAIT, 8

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 3 ; Igglybuff

	db     US_VERSION_STAFF, 2

	db CREDITS_WAIT, 8

	db      US_COORDINATION, 0
	db          GAIL_TILDEN, 1
	db        HIRO_NAKAMURA, 2
	db        SETH_MCMAHILL, 3

	db CREDITS_WAIT, 8

	db      US_COORDINATION, 0
	db       JUNICHI_MASUDA, 1
	db     HIROTO_ALEXANDER, 2
	db     TERESA_LILLYGREN, 3

	db CREDITS_WAIT, 9

	db     TEXT_TRANSLATION, 1
	db        NOB_OGASAWARA, 2

	db CREDITS_WAIT, 8

	db          PROGRAMMERS, 1
	db      TERUKI_MURAKAWA, 2
	db      KAZUYOSHI_OSAWA, 3

	db CREDITS_WAIT, 8

	db         PAAD_TESTING, 1
	db       THOMAS_HERTZOG, 2
	db         ERIK_JOHNSON, 3

	db CREDITS_WAIT, 8

	db      PRODUCT_TESTING, 0
	db             PLANNING, 1

	db CREDITS_WAIT, 8

	db      PRODUCT_TESTING, 0
	db       KEITA_NAKAMURA, 1
	db      HIROTAKA_UEMURA, 2
	db       HIROAKI_TAMURA, 3
	db    NORIAKI_SAKAGUCHI, 4

	db CREDITS_WAIT, 9

	db      PRODUCT_TESTING, 0
	db NCL_SUPER_MARIO_CLUB, 1
	db          KENJI_SAIKI, 2
	db         ATSUSHI_TADA, 3
	db          MIYUKI_SATO, 4

	db CREDITS_WAIT, 9

	db       SPECIAL_THANKS, 0
	db     KIMIKO_NAKAMICHI, 1
	db           AKITO_MORI, 2
	db        GAKUZI_NOMOTO, 3
	db           AI_MASHIMA, 4

	db CREDITS_WAIT, 9

	db       SPECIAL_THANKS, 0
	db      KUNIMI_KAWAMURA, 1
	db    MIKIHIRO_ISHIKAWA, 2
	db   HIDEYUKI_HASHIMOTO, 3

	db CREDITS_WAIT, 9

	db   EXECUTIVE_PRODUCER, 1
	db     HIROSHI_YAMAUCHI, 2

	db CREDITS_WAIT, 8

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 4 ; Magby

	db SOURCRYSTAL_STAFF, 1

	db CREDITS_WAIT, 8

	db             DIRECTOR, 1
	db            SOURAPPLE, 2

	db CREDITS_WAIT, 7

	db          PROGRAMMERS, 0
	db            VULCANDTH, 1
	db                 ZUMI, 2
	db                PFERO, 3
	db               RANGI42, 4
	db                  AX6, 5

	db CREDITS_WAIT, 10

	db    POKEMON_ANIMATION, 1
	db            SOURAPPLE, 2

	db CREDITS_WAIT, 7

	db   MISCELLANEOUS_WORK, 0
	db        MONSTAAHRULES, 1
	db         DAMIEN_DOURY, 2
	db                DANZC, 3
	db             SONICRAY, 4
	db                  FIQ, 5

	db CREDITS_WAIT, 10

	db     BATTLE_ANIMATION, 1
	db            SOURAPPLE, 2

	db CREDITS_WAIT, 7

	db     ADDITIONAL_MUSIC, 0
	db             CORALDEV, 1
	db                 ZUMI, 2
	db       FROGGESTSPIRIT, 3
	db               MMMMMM, 4
	db                 PIGU, 5

	db CREDITS_WAIT, 10

	db     INTERNAL_SYSTEMS, 0
	db              RANGI42, 1
	db            VULCANDTH, 2
	db      JUSTREGULARLUNA, 3
	db                 ZUMI, 4
	db            _8BITZETA, 5

	db CREDITS_WAIT, 10

	db        POKEMON_ICONS, 0
	db            SOURAPPLE, 1
	db        FRENCH_ORANGE, 2
	db     BENNIBEEFAGHETTI, 3
	db             GUI_ALBE, 4

	db CREDITS_WAIT, 9

	db        POKEMON_ICONS, 0
	db         CESARE_CBASS, 1
	db         DAMIEN_DOURY, 2
	db            LUIGI_TKO, 3

	db CREDITS_WAIT, 9

	db           MAP_DESIGN, 1
	db            SOURAPPLE, 2
	db              RANGI42, 3

	db CREDITS_WAIT, 8

	db      QA_CONSULTATION, 1
	db                GMERC, 2
	db                 AHAB, 3

	db CREDITS_WAIT, 8

	db         GAME_TESTING, 0
	db             SHANAMOE, 1
	db             ZAXARONE, 2
	db       THAT_NERD_LADY, 3
	db               MATTEW, 4
	db                 AHAB, 5

	db CREDITS_WAIT, 10

	db         GAME_TESTING, 0
	db              MANARDO, 1
	db     BENNIBEEFAGHETTI, 2
	db         CESARE_CBASS, 3
	db                  TAJ, 4
	db               CHILLY, 5

	db CREDITS_WAIT, 10

	db         GAME_TESTING, 0
	db               HALLAN, 1
	db         TABLETPILLOW, 2
	db                IDAIN, 3
	db             WHOOPING, 4
	db          TASTYSNAX12, 5

	db CREDITS_WAIT, 10

	db       SPECIAL_THANKS, 1
	db     POKECRYSTAL_PRET, 2


	db CREDITS_WAIT, 7

	db            COPYRIGHT, 1

	db CREDITS_WAIT, 9

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
