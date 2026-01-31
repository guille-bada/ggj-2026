extends Node

@export var zone_container: Node2D
@export var fade: TransitionFade

@export var zone_1: PackedScene
@export var zone_2: PackedScene
@export var zone_3: PackedScene
@export var zone_4: PackedScene


func _ready() -> void:
	transition_zone(zone_1)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		transition_zone(zone_1)
	if Input.is_action_just_pressed("ui_right"):
		transition_zone(zone_2)
	if Input.is_action_just_pressed("ui_down"):
		transition_zone(zone_3)
	if Input.is_action_just_pressed("ui_left"):
		transition_zone(zone_4)

func get_zone(zone: int) -> void:
	var new_zone: PackedScene
	match zone:
		1: new_zone = zone_1
		2: new_zone = zone_2
		3: new_zone = zone_3
		4: new_zone = zone_4
	
	transition_zone(new_zone)
	
func transition_zone(zone: PackedScene) -> void:
	fade.fade_in()
	await fade.fade_in_complete
	for n in zone_container.get_children():
		n.queue_free()
	var instance = zone.instantiate()
	zone_container.add_child(instance)
