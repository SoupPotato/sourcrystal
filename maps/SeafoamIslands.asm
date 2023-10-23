	object_const_def

SeafoamIslands_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslands_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19, 21, ROUTE_20, 1
	warp_event 19, 19, SEAFOAM_GYM, 1
	warp_event  5,  7, ROUTE_20, 2
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 1
	warp_event 15, 17, SEAFOAM_ISLANDS_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
