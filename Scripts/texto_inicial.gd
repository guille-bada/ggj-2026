extends Label
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start()
	await timer.timeout
	queue_free()
