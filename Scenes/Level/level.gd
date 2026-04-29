extends Node2D

class_name Level


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") == true:
		GameManager.load_main_scene()
	if event.is_action_pressed("reload") == true:
		get_tree().reload_current_scene()


func _ready() -> void:
	print('level loaded', GameManager.get_level_selected())
