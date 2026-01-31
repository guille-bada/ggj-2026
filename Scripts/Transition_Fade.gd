extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect

var fade_time : float = 1.7	
	
func fade_in():
	var tween = create_tween()
	color_rect.color.a=0
	tween.tween_property(color_rect,"color:a", 1, fade_time)
	await tween.finished
	fade_out()
	
	
func fade_out():
	var tween = create_tween()
	color_rect.color.a=1
	tween.tween_property(color_rect,"color:a", 0, fade_time)
