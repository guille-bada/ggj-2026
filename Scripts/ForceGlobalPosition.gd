class_name ForceGlobalPosition extends Node

@export var subject: Node2D
@export var position_to_hold: Node2D

func _ready():
	
	if not subject: subject = owner
	if not position_to_hold:
		position_to_hold = Node2D.new()
		position_to_hold.global_position = subject.global_position
	
func _physics_process(delta):
	# subjectcall_deferred("set_global_position", position_to_hold.global_position)
	subject.global_position = position_to_hold.global_position
