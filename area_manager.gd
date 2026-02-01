extends Node

@export var zone_container: Node2D
@export var fade: TransitionFade

@export var zone_1: PackedScene
@export var zone_2: PackedScene
@export var zone_3: PackedScene
@export var zone_4: PackedScene

var current_zone: MapZone
var last_zone: int = 2

func _ready() -> void:
	transition_zone(zone_1, true)

func get_zone(zone_id: int) -> void:
	var new_zone: PackedScene
	match zone_id:
		1: new_zone = zone_1
		2: new_zone = zone_2
		3: new_zone = zone_3
		4: new_zone = zone_4
	
	transition_zone(new_zone)
	
func transition_zone(zone: PackedScene, skip_fade_in: bool = false) -> void:
	if not skip_fade_in:
		fade.fade_in()
		await fade.fade_in_complete
	else:
		fade.fade_out()
	
	for n:MapZone in zone_container.get_children():
		for z in n.get_transition_zones():
			z.transition_triggered.disconnect(get_zone)
		n.queue_free()
	
	var instance = zone.instantiate()
	
	zone_container.add_child(instance)
	for n:MapZone in zone_container.get_children():
		for z in n.get_transition_zones():
			z.transition_triggered.connect(get_zone)
	
	if current_zone != null:
		last_zone = current_zone.scene_resource.index
	current_zone = instance
	current_zone.spawn_player(last_zone)
