extends Node

func _ready() -> void:
	await create_tween().tween_property(self , "modulate:a", 1, 1).finished
	await get_tree().create_timer(2).timeout
	create_tween().tween_property(self , "modulate:a", 0, 1)
