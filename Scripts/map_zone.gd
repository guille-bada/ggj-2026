class_name MapZone
extends Node2D

var transition_zones: Array[TransitionZone]
var player_start_positions: Array[PlayerStartPosition]
@export var scene_resource: ResourceScene
@export var npc_positions: Node2D
@export var character: MainCharacter

func _ready() -> void:
	populate_arrays()
	get_npc_positions()

func populate_arrays() -> void:
	for n in get_children():
		if n is TransitionZone:
			transition_zones.append(n)
		if n is PlayerStartPosition:
			player_start_positions.append(n)

func get_npc_positions() -> void:
	if scene_resource.locations.size() > 0: return
	for n:Node2D in npc_positions.get_children():
		scene_resource.locations.push_back(n.global_position)
	
	LogicSingleton.all_possibilities.scenes[scene_resource.index - 1] = scene_resource

func get_transition_zones() -> Array[TransitionZone]:
	return transition_zones

func spawn_player(zone_from: int) -> void:
	for n in player_start_positions:
		print("spawn zone from: %s, player zone from: %s" % [n.zone_from, zone_from])
		if n.zone_from == zone_from:
			character.enter_zone(n.global_position, n.direction_vector)
