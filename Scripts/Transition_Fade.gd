class_name TransitionFade
extends CanvasLayer

@export var color_rect: ColorRect
@export var fade_time : float = 1.7
signal fade_in_complete

#func _ready() -> void:
	#fade_out()

func fade_in():
	var tween = create_tween()
	color_rect.color.a = 0
	tween.tween_property(color_rect,"color:a", 1, fade_time)
	await tween.finished
	fade_in_complete.emit()
	fade_out()
	
func fade_out():
	var tween = create_tween()
	color_rect.color.a=1
	tween.tween_property(color_rect,"color:a", 0, fade_time)
	
	
func fade_gui():
	var tween = create_tween()
	tween.tween_property(color_rect,"color:a", 1, fade_time)
	await tween.finished
	fade_in_complete.emit()
