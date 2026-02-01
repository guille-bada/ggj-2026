class_name Npc extends Node2D

@export var interactable: Interactable
@export var head: Sprite2D
@export var body: Sprite2D

func _ready():
	interactable.signal_interact_start.connect(on_interact_start)
	interactable.signal_interact_end.connect(on_interact_end)
	
	head.texture = LogicSingleton.non_solution_possibilities.heads[randi_range(0, LogicSingleton.non_solution_possibilities.heads.size() - 1)].image
	body.texture = LogicSingleton.non_solution_possibilities.bodies[randi_range(0, LogicSingleton.non_solution_possibilities.bodies.size() - 1)].image
	

func on_interact_start():
	print("%s: on_interact" % [name])

func on_interact_end():
	print("%s: on_interact_end" % [name])
