; Modified version of PlaceString that translates <LINE> characters into <LF> commands.
; See:
;   * mon_menu.asm
;   * move_reminder.asm
; Rationale:
;   MoveDescriptions is also used for TM/HM descriptions, so they couldn't be
;   changed nor must they be duplicated.

	push hl
.place_next
	ld a, [de]
	cp "@"
	jr nz, .CheckDict
	ld b, h
	ld c, l
	pop hl
	ret
.next
	inc de
	jp .place_next
.CheckDict:
	dict "<MOBILE>",  MobileScriptChar
	dict "<LINE>",    LineChar
	dict "<NEXT>",    LineFeedChar
	dict "<CR>",      CarriageReturnChar
	dict "<NULL>",    NullChar
	dict "<SCROLL>",  _ContTextNoPause
	dict "<_CONT>",   _ContText
	dict "<PARA>",    Paragraph
	dict "<MOM>",     PrintMomsName
	dict "<PLAYER>",  PrintPlayerName
	dict "<RIVAL>",   PrintRivalName
	dict "<ROUTE>",   PlaceJPRoute
	dict "<WATASHI>", PlaceWatashi
	dict "<KOKO_WA>", PlaceKokoWa
	dict "<RED>",     PrintRedsName
	dict "<GREEN>",   PrintGreensName
	dict "#",         PlacePOKe
	dict "<PC>",      PCChar
	dict "<ROCKET>",  RocketChar
	dict "<TM>",      TMChar
	dict "<TRAINER>", TrainerChar
	dict "<KOUGEKI>", PlaceKougeki
	dict "<LF>",      LineFeedChar
	dict "<CONT>",    ContText
	dict "<……>",      SixDotsChar
	dict "<DONE>",    DoneText
	dict "<PROMPT>",  PromptText
	dict "<PKMN>",    PlacePKMN
	dict "<POKE>",    PlacePOKE
	dict "<WBR>",     NextChar
	dict "<BSP>",     " "
	dict "<DEXEND>",  PlaceDexEnd
	dict "<TARGET>",  PlaceMoveTargetsName
	dict "<USER>",    PlaceMoveUsersName
	dict "<ENEMY>",   PlaceEnemysName
	dict "<PLAY_G>",  PlaceGenderedPlayerName
	ld [hli], a
	call PrintLetterDelay
	jp .next
