extends Button
class_name ClassButton

@export var button_class : ChessClass
@export var is_black : bool = false
@onready var attack_or_defend_label: Label = $"../../../../HBoxContainer/AttackOrDefendLabel"
@onready var texture_rect: TextureRect = $"../../../../HBoxContainer/TextureRect"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_black:
		text = button_class.chess_icon_black
	else:
		text = button_class.chess_icon_white
	mouse_entered.connect(display_class_information)
	pressed.connect(chess_start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display_class_information() -> void:
	print(name)
	if is_black:
		attack_or_defend_label.text = "You\nHave to\nAttack"
	else:
		attack_or_defend_label.text = "You\nHave to\nDefend"
	texture_rect.texture = button_class.image

func chess_start():
	if is_black:
		PlayerStatus.is_black = true
	else:
		PlayerStatus.is_black = false
	get_tree().change_scene_to_file("res://stages/stage1.tscn")
