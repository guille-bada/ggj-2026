class_name TransitionZone
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var timer: Timer = $Timer
@export var zone: int

signal transition_triggered(new_zone: int)

func _ready() -> void:
	area_2d.body_entered.connect(trigger_transition)

func trigger_transition(_body:Node2D) -> void:
	print("here " + name)
	transition_triggered.emit(zone)

func hide_colliders_temporarily() -> void:
	collision_shape_2d.disabled = true
	timer.start()
	await timer.timeout
	collision_shape_2d.disabled = false
