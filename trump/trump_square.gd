@tool
extends Label
class_name TrumpSquare

@export var trump :TrumpClass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = trump.trump_icon_filled


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
