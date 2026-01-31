extends Node2D
@onready var area_2d: Area2D = $Area2D
@export var zone: int
@onready var transition_fade: CanvasLayer = $Area2D/Transition_Fade


signal transition_triggered(new_zone:int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(trigger_transition)
	
func trigger_transition(_body:Node2D) -> void:
	transition_triggered.emit(zone)
	transition_fade.fade_in()
