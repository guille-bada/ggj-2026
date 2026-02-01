extends Node

@export var solution: ResourceSolution
@export var clues_found: Array[ResourceClue]
@export var all_possibilities: ResourceAllPossibilities = preload("uid://ckfq6o77hhe5j")
var non_solution_possibilities: ResourceAllPossibilities

var clues_count: int
var clues_count_needed: int = 5
var can_solution_spawn: bool
var is_solution_found: bool

func _ready() -> void:
	var head: ResourceClue = all_possibilities.heads.pick_random()
	var body: ResourceClue = all_possibilities.bodies.pick_random()
	var scene: ResourceScene = all_possibilities.scenes.pick_random()
	var location: ResourceLocation = scene.locations.pick_random()
	solution = ResourceSolution.new()
	solution.head = head
	solution.body = body
	solution.location = location
	solution.scene = scene

	get_non_solution_possibilities()

	# test_force_spawn()
	pass

func get_non_solution_possibilities() -> ResourceAllPossibilities:
	non_solution_possibilities = all_possibilities.duplicate(true)
	non_solution_possibilities.heads.erase(solution.head)
	non_solution_possibilities.bodies.erase(solution.body)
	return non_solution_possibilities


func test_force_spawn():
	can_solution_spawn = true
	solution.head = all_possibilities.heads[0]
	solution.body = all_possibilities.bodies[0]
	solution.scene = all_possibilities.scenes[0]
	solution.location = solution.scene.locations[0]
