class_name Npc extends Node2D

@export var interactable: Interactable
@export var head:Sprite2D
@export var body: Sprite2D
@export var AllPosibilities:ResourceAllPossibilities

func _ready():
	interactable.signal_interactable.connect(on_interacted)
	head.texture = AllPosibilities.heads[randi_range(0,2)].image
	body.texture = AllPosibilities.bodies[randi_range(0,2)].image
	

func on_interacted():
	print("%s: on_interact" % [name])
