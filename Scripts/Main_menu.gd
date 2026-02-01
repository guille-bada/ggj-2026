extends Control

@onready var timer: Timer = $thereisnotimeandihavetofixstuff
@export  var fade_menu:  TransitionFade
var did_press_any_button : bool = false

func _ready() -> void:
	fade_menu.fade_out()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		change_scene()

func change_scene() -> void:
	if did_press_any_button == true: return
	did_press_any_button = true
	await fade_menu.fade_gui()
	timer.start()
	await timer.timeout
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	queue_free()
