class_name PlayerStartPosition
extends Node2D

@export var direction: Direction
@export var zone_from: int
var direction_vector: Vector2

func _ready() -> void:
	set_vector()
	

func set_vector() -> void:
	match direction:
		Direction.up: direction_vector = Vector2.UP
		Direction.down: direction_vector = Vector2.DOWN
		Direction.left: direction_vector = Vector2.LEFT
		Direction.right: direction_vector = Vector2.RIGHT

func reposition_player(player: MainCharacter) -> void:
	player.global_position = global_position

enum Direction{
	up,
	down,
	left,
	right
}
