extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var _velocidad_maxima:float=300.0
@export var _aceleracion:float=1000.0
@export var _friccion:float=1200.0



func _physics_process(delta):
	var input_direction = Input.get_vector("Left","Right","Up","Down")
	var target_velocity = input_direction*_velocidad_maxima
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(target_velocity,_aceleracion*delta)
		if input_direction.y <0:
			animated_sprite_2d.play("up")
		elif input_direction.y >0:
			animated_sprite_2d.play("down")
		elif input_direction.x != 0:
			animated_sprite_2d.play("walk")
			animated_sprite_2d.flip_h = input_direction.x<0

		
	else:
		velocity = velocity.move_toward(Vector2.ZERO,_friccion*delta)
		animated_sprite_2d.play("idle_Down")
		
	move_and_slide()

	
		
	
	
	
