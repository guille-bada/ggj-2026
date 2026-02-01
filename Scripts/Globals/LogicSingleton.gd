extends Node

@export var solution: ResourceSolution
@export var clues_found: Array[ResourceClue]
@export var all_possibilities: ResourceAllPossibilities = preload("uid://ckfq6o77hhe5j")
var non_solution_possibilities: ResourceAllPossibilities

func _ready() -> void:
	var head: ResourceClue = all_possibilities.heads[randi_range(0, all_possibilities.heads.size() - 1)]
	var body: ResourceClue = all_possibilities.bodies[randi_range(0, all_possibilities.bodies.size() - 1)]
	var location: ResourceClue = all_possibilities.locations[randi_range(0, all_possibilities.locations.size() - 1)]
	var scene: ResourceScene = all_possibilities.scenes[randi_range(0, all_possibilities.scenes.size() - 1)]
	solution = ResourceSolution.new()
	solution.head = head
	solution.body = body
	solution.location = location
	solution.scene = scene

	get_non_solution_possibilities()
	pass

func get_non_solution_possibilities() -> ResourceAllPossibilities:
	non_solution_possibilities = all_possibilities.duplicate(true)
	non_solution_possibilities.heads.erase(solution.head)
	non_solution_possibilities.bodies.erase(solution.body)
	non_solution_possibilities.locations.erase(solution.location)
	non_solution_possibilities.scenes.erase(solution.scene)
	return non_solution_possibilities