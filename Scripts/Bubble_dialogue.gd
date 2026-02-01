extends Node
@export var interactable: Interactable
@export var texture_rect: TextureRect
@export var fade_duration: float = 1.0
@export var label: Label

func _ready() -> void:
	interactable.signal_interact_start.connect(show_dialogue)
	interactable.signal_interact_end.connect(hide_dialogue)
	var selection: int = randi_range(0, 2)
	if selection == 0:
		label.text = LogicSingleton.solution.head.clues.pick_random()
	elif selection == 1:
		label.text = LogicSingleton.solution.body.clues.pick_random()
	elif selection == 2:
		label.text = LogicSingleton.solution.location.clues.pick_random()
	
	texture_rect.modulate.a = 0


func show_dialogue():
	if LogicSingleton.solution_node and LogicSingleton.solution_node.get_instance_id() == owner.get_instance_id(): return
	var tween: Tween = create_tween()
	tween.tween_property(texture_rect, "modulate:a", 1, fade_duration)

func hide_dialogue():
	var tween: Tween = create_tween()
	tween.tween_property(texture_rect, "modulate:a", 0, fade_duration)
