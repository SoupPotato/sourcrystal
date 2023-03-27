; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to map groups
	dw OlivineGroupSprites
	dw MahoganyGroupSprites
	dw DungeonsGroupSprites
	dw EcruteakGroupSprites
	dw BlackthornGroupSprites
	dw CinnabarGroupSprites
	dw CeruleanGroupSprites
	dw AzaleaGroupSprites
	dw LakeOfRageGroupSprites
	dw VioletGroupSprites
	dw GoldenrodGroupSprites
	dw VermilionGroupSprites
	dw PalletGroupSprites
	dw PewterGroupSprites
	dw FastShipGroupSprites
	dw IndigoGroupSprites
	dw FuchsiaGroupSprites
	dw LavenderGroupSprites
	dw SilverGroupSprites
	dw CableClubGroupSprites
	dw CeladonGroupSprites
	dw CianwoodGroupSprites
	dw ViridianGroupSprites
	dw NewBarkGroupSprites
	dw SaffronGroupSprites
	dw CherrygroveGroupSprites
	dw Route47GroupSprites
	dw SafariSpecSprites


; Route1 and ViridianCity are connected
; Route2North and PewterCity are connected
; PalletTown and Route21 are connected
PewterGroupSprites:
; Route3, PewterCity
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_BLACK_BELT
	db SPRITE_POKEFAN_M
	; max 9 of 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db 0 ; end
ViridianGroupSprites:
; Route2South, Route22, ViridianCity
PalletGroupSprites:
; Route1, PalletTown
CinnabarGroupSprites:
; Route19, Route20, Route21, CinnabarIsland
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_LASS
	db SPRITE_COOLTRAINER_F
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GUY
	; max 9 of 9 walking sprites
	db SPRITE_BLUE
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_ROCK
	db 0 ; end

; CeruleanCity and Route5 are connected
CeruleanGroupSprites:
; Route4, Route9, Route10North, Route24, Route25, CeruleanCity
SaffronGroupSprites:
; Route5, SaffronCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKET
	db SPRITE_MISTY
	; max 9 of 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_SLOWBRO
	db SPRITE_ZAPDOS
	db 0 ; end

VermilionGroupSprites:
; Route6, Route11, VermilionCity
	db SPRITE_POKEFAN_M
	db SPRITE_YOUNGSTER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_FISHER
	db SPRITE_LASS
	; 6 of max 9 walking sprites
	db SPRITE_GRAMPS
	db SPRITE_BIG_SNORLAX
	db SPRITE_MACHOP
	db SPRITE_TWIN
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db 0 ; end

CeladonGroupSprites:
; Route7, Route16, Route17, CeladonCity
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BIKER
	; 6 of max 9 walking sprites
	db SPRITE_POLIWRATH
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db 0 ; end

; Route12 and Route13 are connected
LavenderGroupSprites:
; Route8, Route12, Route10South, LavenderTown
FuchsiaGroupSprites:
; Route13, Route14, Route15, Route18, FuchsiaCity
	db SPRITE_POKEFAN_M
	db SPRITE_POKEFAN_F
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_BIKER
	db SPRITE_GENTLEMAN
	db SPRITE_LASS
	; 9 of max 9 walking sprites
	db SPRITE_GRAMPS
	db SPRITE_ZAPDOS
	db SPRITE_TWIN
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db 0 ; end

IndigoGroupSprites:
; Route23
	; 0 of max 9 walking sprites
	db 0 ; end

; Route29 and CherrygroveCity are connected
NewBarkGroupSprites:
; Route26, Route27, Route29, NewBarkTown
CherrygroveGroupSprites:
; Route30, Route31, CherrygroveCity
	db SPRITE_SILVER
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_YOUNGSTER
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	; max 8 of 9 walking sprites
	db SPRITE_PIDGEY
	db SPRITE_RATTATA_UP
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db 0 ; end

; Route37 and EcruteakCity are connected
VioletGroupSprites:
; Route32, Route35, Route36, Route37, VioletCity
EcruteakGroupSprites:
; EcruteakCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_OFFICER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BUG_CATCHER
	db SPRITE_SUPER_NERD
	; 8 of max 9 walking sprites
	db SPRITE_TWIN
	db SPRITE_SUDOWOODO
	db SPRITE_POKE_BALL
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_SUICUNE
	db 0 ; end

AzaleaGroupSprites:
; Route33, AzaleaTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_TEACHER
	db SPRITE_ROCKET
	db SPRITE_LASS
	db SPRITE_SILVER
	; 7 of max 9 walking sprites
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_SLOWPOKE
	db SPRITE_KURT
	db 0 ; end

GoldenrodGroupSprites:
; Route34, GoldenrodCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_OFFICER
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_ROCKET
	db SPRITE_LASS
	; 7 of max 9 walking sprites
	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_POKE_BALL
	db 0 ; end

; OlivineCity and Route40 are connected
OlivineGroupSprites:
; Route38, Route39, OlivineCity
CianwoodGroupSprites:
; Route40, Route41, CianwoodCity, BattleTowerOutside
	db SPRITE_SILVER
	db SPRITE_POKEFAN_M
	db SPRITE_LASS
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SAILOR
	db SPRITE_POKEFAN_F
	db SPRITE_SUPER_NERD
	db SPRITE_SWIMMER_GUY
	db SPRITE_GENTLEMAN
	; 9 of max 9 walking sprites
	db SPRITE_BUENA
	db SPRITE_MILTANK
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_ROCK
	db SPRITE_YOUNGSTER ; non-walking version of SPRITE_YOUNGSTER
	db SPRITE_SUICUNE
	db 0 ; end

MahoganyGroupSprites:
; Route42, Route44, MahoganyTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	; 8 of max 9 walking sprites
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_POKE_BALL
	db SPRITE_SUICUNE
	db 0 ; end

LakeOfRageGroupSprites:
; Route43, LakeOfRage
	db SPRITE_LANCE
	db SPRITE_GRAMPS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_LASS
	db SPRITE_YOUNGSTER
	; 8 of max 9 walking sprites
	db SPRITE_GYARADOS
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_POKE_BALL
	db 0 ; end

BlackthornGroupSprites:
; Route45, Route46, BlackthornCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_BLACK_BELT
	db SPRITE_COOLTRAINER_F
	; 8 of max 9 walking sprites
	db SPRITE_BERRY
	db SPRITE_APRICORN
	db SPRITE_POKE_BALL
	db 0 ; end

SilverGroupSprites:
; Route28, SilverCaveOutside
	; 0 of max 9 walking sprites
	db 0 ; end

DungeonsGroupSprites:
; NationalPark, NationalParkBugContest, RuinsOfAlphOutside
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKER
	db SPRITE_FISHER
	db SPRITE_SCIENTIST
	; 8 of max 9 walking sprites
	db SPRITE_GAMEBOY_KID
	db SPRITE_PERSIAN
	db SPRITE_POKE_BALL
	db 0 ; end

FastShipGroupSprites:
; OlivinePort, VermilionPort, MountMoonSquare, TinTowerRoof
	db SPRITE_SAILOR
	db SPRITE_FISHING_GURU
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	; 5 of max 9 walking sprites
	db SPRITE_HO_OH
	db SPRITE_CLEFAIRY_MOVE
	db SPRITE_ROCK
	db 0 ; end

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end

Route47GroupSprites:
SafariSpecSprites:
; Route47, Route48, YellowForest, CliffEdgeCave, CliffEdgeGate
	db SPRITE_TWIN
	db SPRITE_SUPER_NERD
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_JIGGLYPUFF
	db SPRITE_KANGASKHAN
	db SPRITE_BUTTERFREE
	db SPRITE_TEACHER
	; 7 of max 9 walking sprites
	db SPRITE_SLOWPOKE
	db SPRITE_GENTLEMAN
	db SPRITE_POKEFAN_F
	db SPRITE_GRAMPS
	db SPRITE_COOLTRAINER_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_BUENA
	db SPRITE_POKE_BALL
	db SPRITE_OLD_LINK_RECEPTIONIST
