class_name Interaction extends Area2D

signal signal_interaction_trigger(interactable: Interactable)

func _ready():
	area_entered.connect(on_area_entered)

func on_area_entered(interactable: Interactable):
	signal_interaction_trigger.emit(interactable)
