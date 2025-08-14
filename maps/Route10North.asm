	object_const_def


Route10North_MapScripts:
	def_scene_scripts

	def_callbacks

Route10PokecenterSign:
	jumpstd PokecenterSignScript

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 19, ROUTE_10_POKECENTER_1F, 1
	warp_event  8, 17, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 19, BGEVENT_READ, Route10PokecenterSign

	def_object_events
