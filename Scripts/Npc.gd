class_name Npc extends Node2D

@export var interactable: Interactable
@export var head: Sprite2D
@export var body: Sprite2D
@export var AllPosibilities: ResourceAllPossibilities

func _ready():
	interactable.signal_interact_start.connect(on_interact_start)
	interactable.signal_interact_end.connect(on_interact_end)
	
	head.texture = AllPosibilities.heads[randi_range(0, 5)].image
	body.texture = AllPosibilities.bodies[randi_range(0, 5)].image
	

func on_interact_start():
	print("%s: on_interact" % [name])

func on_interact_end():
	print("%s: on_interact_end" % [name])
