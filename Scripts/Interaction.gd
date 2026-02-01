class_name Interaction extends Area2D

signal signal_interaction_enter(interactable: Interactable)
signal signal_interaction_exit(interactable: Interactable)

func _ready():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

func on_area_entered(interactable: Interactable):
	signal_interaction_enter.emit(interactable)

func on_area_exited(interactable: Interactable):
	signal_interaction_exit.emit(interactable)