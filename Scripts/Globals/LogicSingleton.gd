extends Node

@export var solution: ResourceSolution
@export var clues_found: Array[ResourceClue]
@export var all_possibilities: ResourceAllPossibilities = preload("uid://ckfq6o77hhe5j")

func _ready() -> void:
	var head:ResourceClue = all_possibilities.heads[randi_range(0, all_possibilities.heads.size()-1)]
	var body:ResourceClue = all_possibilities.bodies[randi_range(0, all_possibilities.bodies.size()-1)]
	var location:ResourceClue = all_possibilities.locations[randi_range(0, all_possibilities.locations.size()-1)]
	var scene:ResourceScene = all_possibilities.scenes[randi_range(0, all_possibilities.scenes.size()-1)]
	solution = ResourceSolution.new()
	solution.head = head
	solution.body = body
	solution.location = location
	solution.scene = scene
	pass
