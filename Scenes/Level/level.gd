extends Node2D

class_name Level

@onready var tile_layers: Node2D = $TileLayers
@onready var floor_tiles: TileMapLayer = $TileLayers/Floor
@onready var walls_tiles: TileMapLayer = $TileLayers/Walls
@onready var targets_tiles: TileMapLayer = $TileLayers/Targets
@onready var boxes_tiles: TileMapLayer = $TileLayers/Boxes


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") == true:
		GameManager.load_main_scene()
	if event.is_action_pressed("reload") == true:
		get_tree().reload_current_scene()


func _ready() -> void:
	print('level loaded', GameManager.get_level_selected())
	print(floor_tiles.get_used_cells())
	print(floor_tiles.get_used_rect())
	print(floor_tiles.get_used_rect().get_center())	# Good for set camera position
	print(floor_tiles.tile_set.tile_size.x)	# Good for set camera position
	
	floor_tiles.erase_cell(Vector2i(7, 4))
	floor_tiles.erase_cell(Vector2i(7, 5))
	floor_tiles.erase_cell(Vector2i(8, 4))
	floor_tiles.set_cell(Vector2i(7, 4), 0, Vector2i(2, 0))
	floor_tiles.set_cell(Vector2i(7, 5), 0, Vector2i(0, 0))
	floor_tiles.set_cell(Vector2i(8, 4), 0, Vector2i(0, 0))
	
	floor_tiles.clear()	# Will clear all floor_tiles.


























#
