class_name MapZone
extends Node2D

var transition_zones: Array[TransitionZone]
@export var scene_resource: ResourceScene
@export var npc_positions: Node2D

func _ready() -> void:
	find_transition_zones()
	get_npc_positions()
	hide_colliders_temporarily()

func find_transition_zones() -> void:
	for n in get_children():
		if n is TransitionZone:
			transition_zones.append(n)

func get_npc_positions() -> void:
	if npc_positions.get_child_count() >= scene_resource.locations.size():
		printerr("%s: get_npc_positions: more NPCs spawn points than ResourceLocations" % [name])
	if scene_resource.locations.size() > 0: return
	for i in range(npc_positions.get_child_count()):
		var child: Node2D = npc_positions.get_child(i)
		if i >= scene_resource.locations.size() - 1:
			printerr("%s: get_npc_positions: %s out of range of ResourceLocations. Ignoring" % [name, child.name])
		scene_resource.locations[i].position = child.global_position
	
	# LogicSingleton.all_possibilities.scenes[scene_resource.index] = scene_resource

func get_transition_zones() -> Array[TransitionZone]:
	return transition_zones

func hide_colliders_temporarily() -> void:
	#hide colliders when players enters zone
	# so it doesn't transition back again
	for zone: TransitionZone in transition_zones:
		zone.hide_temporarily()


func spawn_solution():
	if LogicSingleton.can_solution_spawn:
		var is_scene_correct: bool = LogicSingleton.solution.scene.index == scene_resource.index
		if not is_scene_correct: return
		for i in range(npc_positions.get_child_count()):
			var child: Node2D = npc_positions.get_child(i)
			var distance: float = child.global_position.distance_to(LogicSingleton.solution.location.position)
			if distance <= 10:
				(child as Npc).set_npc(LogicSingleton.solution.head.image, LogicSingleton.solution.body.image)
				return
