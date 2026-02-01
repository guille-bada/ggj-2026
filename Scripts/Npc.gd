class_name Npc extends Node2D

@export var interactable: Interactable
@export var head: Sprite2D
@export var body: Sprite2D
@export var game_over: GameOver

var is_manually_set: bool

func _ready():
	interactable.signal_interact_start.connect(on_interact_start)
	interactable.signal_interact_end.connect(on_interact_end)
	
	if not is_manually_set:
		var head_selected: ResourceClue = LogicSingleton.all_possibilities.heads.pick_random()
		if head_selected == LogicSingleton.solution.head:
			body.texture = LogicSingleton.non_solution_possibilities.bodies.pick_random().image
		else:
			body.texture = LogicSingleton.all_possibilities.bodies.pick_random().image
		head.texture = head_selected.image
	

func on_interact_start():
	print("%s: on_interact" % [name])
	LogicSingleton.clues_count += 1
	if is_manually_set:
		game_over.interact()

func on_interact_end():
	print("%s: on_interact_end" % [name])


func set_npc(head_texture: Texture2D, body_texture: Texture2D):
	head.texture = head_texture
	body.texture = body_texture
	is_manually_set = true
