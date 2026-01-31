class_name TransitionZone
extends Node2D

@onready var area_2d: Area2D = $Area2D
@export var zone: int

signal transition_triggered(new_zone: int)

func _ready() -> void:
	area_2d.body_entered.connect(trigger_transition)

	
func trigger_transition(_body:Node2D) -> void:
	transition_triggered.emit(zone)
