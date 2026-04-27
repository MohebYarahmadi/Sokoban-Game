extends Node

const LEVEL_DATA_PATH: String = "res://Data/level_data.json"

var _level_data: Dictionary = {}	# To store the data


func _enter_tree() -> void:
	load_level_data()


func add_tiles_for_layer(layout: LevelLayout,
						 layer_type: TileLayers.LayerType,
						 tile_coords: Array) -> void:
	# add to level layout
	for tc in tile_coords:
		layout.add_tile_to_layer(tc.x, tc.y, layer_type)


func setup_level(ln: String, raw_level_data: Dictionary) -> LevelLayout:
	var layout := LevelLayout.new()
	var raw_tiles: Dictionary = raw_level_data.tiles	# json key
	var player_start: Dictionary = raw_level_data.player_start	# json key
	
	add_tiles_for_layer(layout, TileLayers.LayerType.Floor, raw_tiles.Floor)
	add_tiles_for_layer(layout, TileLayers.LayerType.Walls, raw_tiles.Walls)
	add_tiles_for_layer(layout, TileLayers.LayerType.Boxes, raw_tiles.Boxes)
	add_tiles_for_layer(layout, TileLayers.LayerType.Targets, raw_tiles.Targets)
	add_tiles_for_layer(layout, TileLayers.LayerType.TargetBoxes, raw_tiles.TargetBoxes)
	
	layout.set_player_start(player_start.x, player_start.y)
	
	return layout
	


## Load json file and parse as dictionary
func load_level_data() -> void:
	var file := FileAccess.open(LEVEL_DATA_PATH, FileAccess.READ)
	
	if !file:
		return
	
	var json_data: Dictionary = JSON.parse_string(file.get_as_text())
	
	# Iterate on all the keys and setup data for that level - ln: levelNumber
	for ln in json_data.keys():
		var level_data = json_data[ln]
		_level_data[ln] = setup_level(ln, level_data)



func get_level_data(ln: String) -> LevelLayout:
	return _level_data[ln]
