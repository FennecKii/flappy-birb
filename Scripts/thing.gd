extends CharacterBody2D

@onready var thing_outline_animation: AnimatedSprite2D = $Outline
@onready var thing_body_animation: AnimatedSprite2D = $Body
@onready var thing_killed: bool = false

func _ready():
	Global.thing_killed.connect(_on_thing_killed)

func _physics_process(delta: float) -> void:
	pass
	# Add the gravity.
	velocity += get_gravity() * delta
	velocity.y = clamp(velocity.y, -240, 340)
	# Handle jump.
	if (Input.is_action_just_pressed("Jump") or Input.is_action_just_pressed("Mouse_Jump")) and !thing_killed:
		velocity.y = Global.JUMP_VELOCITY
		AudioStreamer.play_sfx(Global.jump_sound, -3)
	
	move_and_slide()
	update_animation()

func update_animation():
	if velocity.y >= 110:
		var tween_down = create_tween()
		tween_down.tween_property(self, "rotation", deg_to_rad(20), 0.3)
		thing_outline_animation.play("fall")
		thing_body_animation.play("fall")
	elif velocity.y < 70:
		var tween_up = create_tween()
		tween_up.tween_property(self, "rotation", deg_to_rad(-15), 0.5)
		thing_outline_animation.play("flap")
		thing_body_animation.play("flap")
	else:
		self.rotation = 0

func _on_thing_killed():
	thing_killed = true
