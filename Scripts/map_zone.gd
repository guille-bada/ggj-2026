class_name MapZone
extends Node2D

var transition_zones: Array[TransitionZone]

func _ready() -> void:
	find_transition_zones()

func find_transition_zones() -> void:
	for n in get_children():
		if n is TransitionZone:
			transition_zones.append(n)

func get_transition_zones() -> Array[TransitionZone]:
	return transition_zones
