extends Node2D
class_name Main

@onready var main_menu = $UI/MainMenu
@onready var class_menu = $UI/ClassMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_game_start() -> void:
	main_menu.hide()
	class_menu.show()
