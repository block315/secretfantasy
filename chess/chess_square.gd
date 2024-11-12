@tool
extends Label
class_name ChessSquare

@export var chess : ChessClass
@export var is_black := false
const CHESS_PIECE_THEME = preload("res://chess/chesspiece/chess_piece_theme.tres")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_black:
		text = chess.chess_icon_black
		if PlayerStatus.is_black:
			set("theme_override_colors/font_outline_color", Color(0,0,255))
	else:
		text = chess.chess_icon_white
		if !PlayerStatus.is_black:
			set("theme_override_colors/font_outline_color", Color(0,0,255))
	theme = CHESS_PIECE_THEME
