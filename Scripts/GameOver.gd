class_name GameOver extends Control

func interact():
	await create_tween().tween_property(self , "modulate:a", 1, 1).finished
	await get_tree().create_timer(3).timeout
	LogicSingleton._ready()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
