class_name Interactable extends Area2D

signal signal_interactable

func _ready():
	pass

func interact():
	signal_interactable.emit()