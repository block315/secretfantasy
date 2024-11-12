extends TileMapLayer
@onready var turns_timer: Timer = $"../TurnsTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_turns_timer_timeout() -> void:
	pass # Replace with function body.
