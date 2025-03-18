extends CharacterBody2D

const JUMP_VELOCITY = -250.0
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta
	velocity.y = clamp(velocity.y, -300, 350)
	# Handle jump.
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
