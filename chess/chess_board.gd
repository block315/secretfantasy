@tool
extends Node2D
class_name ChessBoard

const original_board_size := 8
@export var board_size := 4
@export var camera_speed := 5
@export var board_margin := 64
@export var freeze := true

@onready var white_and_black: TileMapLayer = $WhiteAndBlack
@onready var camera_2d: Camera2D = $Camera2D
@onready var trump: TileMapLayer = $Trump
@onready var chess_piece: TileMapLayer = $ChessPiece

var board_length:int

func _ready() -> void:
	board_length = original_board_size * board_size / 2
	white_and_black.clear()
	for i in range(-board_length, board_length):
		for j in range(-board_length, board_length):
			if (i+j) % 2 == 0:
				white_and_black.set_cell(Vector2i(i, j), 1, Vector2i(0,0), 1)
	camera_2d.limit_bottom = board_length * 64 + board_margin
	camera_2d.limit_right = board_length * 64 + board_margin
	camera_2d.limit_top = -board_length * 64 - board_margin
	camera_2d.limit_left = -board_length * 64 - board_margin

func _process(delta: float) -> void:
	camera_2d.position \
		+= Input.get_vector("ui_left", "ui_right","ui_up", "ui_down") * camera_speed


func _on_turns_timer_timeout() -> void:
	if !freeze:
		move()

# Main game loop
func move():
	for pos in chess_piece.get_used_cells():
		var cell_sid = chess_piece.get_cell_source_id(pos)
		var cell_aid = chess_piece.get_cell_alternative_tile(pos)
		var cell_acrd = chess_piece.get_cell_atlas_coords(pos)

		# Root can't move
		if cell_aid == 6:
			continue

		var new_pos = pos + Vector2i(randi_range(-1, 1), randi_range(-1, 1))

		# Stay in side the board
		if new_pos.x >= board_length or new_pos.x < -board_length \
			or new_pos.y >= board_length or new_pos.y < -board_length:
			continue
		# Don't collide each other
		if chess_piece.get_cell_source_id(new_pos) != -1:
			# Kill other side
			if chess_piece.get_cell_source_id(new_pos) == cell_sid:
				continue
			# Can't kill rooks
			if chess_piece.get_cell_alternative_tile(new_pos) == 6:
				continue

		chess_piece.erase_cell(pos)
		chess_piece.set_cell(new_pos, cell_sid, cell_acrd, cell_aid)
