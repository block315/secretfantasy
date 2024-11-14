extends Resource
class_name ChessClass

@export_category("Visual")
@export var chess_class : String
@export var chess_icon : String
@export var chess_icon_white: String
@export var chess_icon_black: String
@export var image : Texture2D

@export_category("Gameplay")
@export var weapon : String
@export var range : int = 1
@export var mobile : bool = true
@export var strength : int = 10
@export var health : int = 100
