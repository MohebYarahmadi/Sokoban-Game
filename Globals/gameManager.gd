extends Node


const MAIN = preload("uid://bd8163sl6xcut")
const LEVEL = preload("uid://ctbngahe53x5b")

var _level_selected: String = "1"
var _best_scores: HighScoresResource


func _enter_tree() -> void:
	_best_scores = HighScoresResource.load_scores()
	

func has_level_score(level: String) -> bool:
	return _best_scores.has_level_score(level)


func level_completed(level: String, score: int) -> bool:
	return _best_scores.add_score(level, score)


func get_level_selected() -> String:
	return _level_selected


func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)


func load_level_scene(ln: String) -> void:
	_level_selected = ln
	get_tree().change_scene_to_packed(LEVEL)
