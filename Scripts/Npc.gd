class_name Npc extends Node2D

@export var interactable: Interactable
@export var head:Sprite2D
@export var body: Sprite2D

func _ready():
	interactable.signal_interactable.connect(on_interacted)
	pass

func on_interacted():
	print("%s: on_interact" % [name])
