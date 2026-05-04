extends Control

class_name GameUi

@onready var level_value: Label = $MC/VB/HB_Level/LevelValue
@onready var moves_value: Label = $MC/VB/HB_Moves/MovesValue
@onready var best_value: Label = $MC/VB/HB_Best/BestValue
@onready var game_over_npr: NinePatchRect = $GameOverNpr
@onready var moves_label: Label = $GameOverNpr/MC/VB/VB/MovesLabel
@onready var new_record_label: Label = $GameOverNpr/MC/VB/VB/NewRecordLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ln: String = GameManager.get_level_selected()
	level_value.text = ln
	
	if GameManager.has_level_score(ln):
		best_value.text = str(GameManager.get_best_score(ln))
	

func set_moves_label(moves: int) -> void:
	moves_value.text = str(moves)


func game_over(moves: int, was_best: bool) -> void:
	moves_label.text = "You took %d moves" % moves
	new_record_label.visible = was_best
	game_over_npr.show()
