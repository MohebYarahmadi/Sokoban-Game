extends NinePatchRect

class_name LevelButton

@onready var level_label: Label = $LevelLabel
@onready var check_mark: TextureRect = $CheckMark

var _level_number: String = "99"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = _level_number


func setup(ln: String) -> void:
	_level_number = ln
