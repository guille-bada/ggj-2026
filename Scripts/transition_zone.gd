class_name TransitionZone
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@export var zone: int

signal transition_triggered(new_zone: int)

func _ready() -> void:
	area_2d.body_entered.connect(trigger_transition)

func trigger_transition(_body:Node2D) -> void:
	transition_triggered.emit(zone)

func disable_collider() -> void:
	collision_shape_2d.disabled = true

func enable_collider() -> void:
	collision_shape_2d.disabled = false
