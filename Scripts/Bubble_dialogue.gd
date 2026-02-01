extends Node
@export var interactable: Interactable
@export var texture_rect: TextureRect
@export var fade_duration: float = 1.0
@export var label: Label

func _ready() -> void:
	interactable.signal_interact_start.connect(show_dialogue)
	interactable.signal_interact_end.connect(hide_dialogue)
	var selection: int = randi_range(0, 3)
	if selection == 0:
		label.text = LogicSingleton.solution.head.clues[randi_range(0, LogicSingleton.solution.head.clues.size() - 1)]
	elif selection == 1:
		label.text = LogicSingleton.solution.body.clues[randi_range(0, LogicSingleton.solution.body.clues.size() - 1)]
	elif selection == 2:
		label.text = LogicSingleton.solution.location.clues[randi_range(0, LogicSingleton.solution.location.clues.size() - 1)]
	
	texture_rect.modulate.a = 0
	
func show_dialogue():
	var tween: Tween = create_tween()
	tween.tween_property(texture_rect, "modulate:a", 1, fade_duration)

func hide_dialogue():
	var tween: Tween = create_tween()
	tween.tween_property(texture_rect, "modulate:a", 0, fade_duration)
