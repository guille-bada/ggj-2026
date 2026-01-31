class_name Npc extends Node2D

@export var interactable: Interactable

func _ready():
	interactable.signal_interactable.connect(on_interacted)
	pass

func on_interacted():
	print("%s: on_interact" % [name])
