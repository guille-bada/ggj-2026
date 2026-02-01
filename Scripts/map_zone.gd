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
	if scene_resource.locations.size() > 0: return
	for n:Node2D in npc_positions.get_children():
		scene_resource.locations.push_back(n.global_position)
	
	LogicSingleton.all_possibilities.scenes[scene_resource.index] = scene_resource

func get_transition_zones() -> Array[TransitionZone]:
	return transition_zones

func hide_colliders_temporarily() -> void:
	#hide colliders when players enters zone
	# so it doesn't transition back again
	for zone: TransitionZone in transition_zones:
		zone.hide_temporarily()
