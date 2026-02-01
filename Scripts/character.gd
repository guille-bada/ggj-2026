class_name MainCharacter
extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@export var _velocidad_maxima: float = 400.0
@export var _aceleracion: float = 1400.0
@export var _friccion: float = 2000.0
@export var interaction: Interaction

var controls_disabled: bool
var auto_walk_direction: Vector2

func _ready():
	interaction.signal_interaction_enter.connect(on_interaction_enter)
	interaction.signal_interaction_exit.connect(on_interact_exit)
	
func _physics_process(delta: float) -> void:
	var input_direction: Vector2
	if controls_disabled == false:
		input_direction = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	else:
		input_direction = auto_walk_direction
	move_character(input_direction, delta)
	
func move_character(direction: Vector2, delta: float) -> void:
	var target_velocity = direction * _velocidad_maxima
	
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(target_velocity, _aceleracion * delta)
		if direction.y < 0:
			animated_sprite_2d.play("up")
		elif direction.y > 0:
			animated_sprite_2d.play("down")
		elif direction.x != 0:
			animated_sprite_2d.play("walk")
			animated_sprite_2d.flip_h = direction.x < 0
	else:
		velocity = velocity.move_toward(Vector2.ZERO, _friccion * delta)
		animated_sprite_2d.play("idle_Down")
		
	move_and_slide()

func on_interaction_enter(interactable: Interactable):
	#print("%s: on_interaction_enter: %s" % [name, interactable])
	interactable.interact()
	pass

func on_interact_exit(interactable: Interactable):
	interactable.interact_end()
	
func enter_zone(spawn_pos: Vector2, direction: Vector2) -> void:
	global_position = spawn_pos
	auto_walk_direction = direction
	controls_disabled = true
	timer.start()
	await timer.timeout
	controls_disabled = false

func disable_controls() -> void:
	auto_walk_direction = Vector2.ZERO
	controls_disabled = true
