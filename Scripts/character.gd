extends CharacterBody2D
@export var _velocidad_maxima:float=300.0
@export var _aceleracion:float=1000.0
@export var _friccion:float=1200.0
func _physics_process(delta):

	var input_direction= Input.get_vector("Left","Right","Up","Down")
	var target_velocity= input_direction*_velocidad_maxima
	if input_direction!= Vector2.ZERO:
		velocity=velocity.move_toward(target_velocity,_aceleracion*delta)
	else:
		velocity=velocity.move_toward(Vector2.ZERO,_friccion*delta)
		
		
	
	move_and_slide() 
	
