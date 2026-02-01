extends Node
@export var interactable:Interactable
@export var texture_rect:TextureRect
@export var fade_text:float = 1.0
@export var label:Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.signal_interactable.connect(_show_dialogue)
	var selection:int = randi_range(0,3)
	if selection == 0:
		label.text = LogicSingleton.solution.head.clues[randi_range(0, LogicSingleton.solution.head.clues.size()-1)]
	elif selection == 1:
		label.text = LogicSingleton.solution.body.clues[randi_range(0, LogicSingleton.solution.body.clues.size()-1)]	
	elif selection == 2:
		label.text = LogicSingleton.solution.location.clues[randi_range(0, LogicSingleton.solution.location.clues.size()-1)]	
	
	texture_rect.modulate.a=0
	
func _show_dialogue():
	var tween:Tween=create_tween()
	tween.tween_property(texture_rect,"modulate:a", 1, fade_text)
	pass
	
