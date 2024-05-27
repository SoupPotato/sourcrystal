	object_const_def
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2
	const MOUNTMORTAR1FOUTSIDE_HELIX_FOSSIL
	const MOUNTMORTAR1FOUTSIDE_DOME_FOSSIL

MountMortar1FOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .FossilWallMountMortar1F

.FossilWallMountMortar1F:
	checkevent EVENT_MT_MORTAR_OBTAINED_FOSSIL
	iffalse .nope
	changeblock 20, 16, $0f
	changeblock 20, 22, $2c
.nope
	endcallback

MountMortar1FHelixFossil:
	opentext
	writetext MountMortar1FHelixFossilText
	yesorno
	iffalse .nope
	disappear MOUNTMORTAR1FOUTSIDE_HELIX_FOSSIL
	setevent EVENT_MT_MORTAR_OBTAINED_HELIX_FOSSIL
	setevent EVENT_DOME_FOSSIL_AT_MT_MOON
	setevent EVENT_MT_MORTAR_OBTAINED_FOSSIL
	clearevent EVENT_MT_MOON_OBTAINED_FOSSIL
	verbosegiveitem HELIX_FOSSIL
	closetext
rept 6
	playsound SFX_SPARK
	earthquake 4
endr
	pause 10
	playsound SFX_BUBBLEBEAM
	changeblock 20, 22, $7c
	changeblock 20, 16, $0f
	reloadmappart
	changeblock 20, 22, $7d
	reloadmappart
	changeblock 20, 22, $7e
	reloadmappart
	changeblock 20, 22, $2c
	reloadmappart
	applymovement MOUNTMORTAR1FOUTSIDE_DOME_FOSSIL, MovementData_DomeFossil
	changeblock 22, 26, $03
	reloadmappart
	playsound SFX_TOXIC
	disappear MOUNTMORTAR1FOUTSIDE_DOME_FOSSIL
	pause 5
rept 2
	playsound SFX_TOXIC
	pause 5
endr
	pause 23
	changeblock 22, 26, $0f
	reloadmappart
	closetext
	opentext
	writetext MountMortar1FDomeFossilWashedAwayText
	waitbutton
	closetext
	end

.nope
	closetext
	end

MountMortar1FDomeFossil:
	opentext
	writetext MountMortar1FDomeFossilText
	yesorno
	iffalse .nope
	disappear MOUNTMORTAR1FOUTSIDE_DOME_FOSSIL
	setevent EVENT_MT_MORTAR_OBTAINED_DOME_FOSSIL
	setevent EVENT_HELIX_FOSSIL_AT_MT_MOON
	setevent EVENT_MT_MORTAR_OBTAINED_FOSSIL
	clearevent EVENT_MT_MOON_OBTAINED_FOSSIL
	verbosegiveitem DOME_FOSSIL
	closetext
rept 6
	playsound SFX_SPARK
	earthquake 4
endr
	pause 10
	playsound SFX_BUBBLEBEAM
	changeblock 20, 22, $7c
	changeblock 20, 16, $0f
	reloadmappart
	changeblock 20, 22, $7d
	reloadmappart
	changeblock 20, 22, $7e
	reloadmappart
	changeblock 20, 22, $2c
	reloadmappart
	applymovement MOUNTMORTAR1FOUTSIDE_HELIX_FOSSIL, MovementData_HelixFossil
	changeblock 22, 26, $03
	reloadmappart
	playsound SFX_TOXIC
	disappear MOUNTMORTAR1FOUTSIDE_HELIX_FOSSIL
	pause 5
rept 2
	playsound SFX_TOXIC
	pause 5
endr
	pause 23
	changeblock 22, 26, $0f
	reloadmappart
	closetext
	opentext
	writetext MountMortar1FHelixFossilWashedAwayText
	waitbutton
	closetext
	end

.nope
	closetext
	end

MountMortar1FOutsideEther:
	itemball ETHER

MountMortar1FOutsideRevive:
	itemball REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION

MountMortar1FHelixFossilText:
	text "You found a"
	line "HELIX FOSSIL…"

	para "If you take this"
	line "fossil, the wall"
	
	para "will most likely"
	line "collapse."
	
	para "Will you take the"
	line "HELIX FOSSIL?"
	done

MountMortar1FDomeFossilText:
	text "You found a"
	line "DOME FOSSIL…"

	para "If you take this"
	line "fossil, the wall"
	
	para "will most likely"
	line "collapse."
	
	para "Will you take the"
	line "DOME FOSSIL?"
	done

MountMortar1FHelixFossilWashedAwayText:
	text "The HELIX FOSSIL"
	line "was washed away…"
	done

MountMortar1FDomeFossilWashedAwayText:
	text "The DOME FOSSIL"
	line "was washed away…"
	done

MovementData_DomeFossil:
	step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_HelixFossil:
	step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MountMortar1FOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 33, ROUTE_42, 3
	warp_event 17, 33, ROUTE_42, 4
	warp_event 37, 33, ROUTE_42, 5
	warp_event 17,  5, MOUNT_MORTAR_2F_INSIDE, 1
	warp_event 11, 21, MOUNT_MORTAR_1F_INSIDE, 1
	warp_event 29, 21, MOUNT_MORTAR_1F_INSIDE, 2
	warp_event 17, 29, MOUNT_MORTAR_B1F, 2
	warp_event  7, 13, MOUNT_MORTAR_1F_INSIDE, 3
	warp_event 33, 13, MOUNT_MORTAR_1F_INSIDE, 4

	def_coord_events

	def_bg_events
	bg_event 25, 22, BGEVENT_ITEM, MountMortar1FOutsideHiddenHyperPotion

	def_object_events
	object_event 13, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	object_event 31, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
	object_event 20, 23, SPRITE_FOSSIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FHelixFossil, EVENT_MT_MORTAR_OBTAINED_FOSSIL
	object_event 21, 23, SPRITE_FOSSIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FDomeFossil, EVENT_MT_MORTAR_OBTAINED_FOSSIL
