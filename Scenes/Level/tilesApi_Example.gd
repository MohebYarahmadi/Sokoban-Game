extends Node2D

func _ready() -> void:
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
