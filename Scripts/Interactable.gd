class_name Interactable extends Area2D

signal signal_interact_start
signal signal_interact_end

func _ready():
	pass

func interact():
	signal_interact_start.emit()

func interact_end():
	signal_interact_end.emit()
