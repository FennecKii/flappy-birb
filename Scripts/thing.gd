extends CharacterBody2D

@onready var thing_sprite: AnimatedSprite2D = $Thing
@onready var thing_killed: bool = false

func _ready():
	update_colors()
	Global.thing_killed.connect(_on_thing_killed)

func _process(_delta):
	update_colors()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta
	velocity.y = clamp(velocity.y, -240, 330)
	# Handle jump.
	if (Input.is_action_just_pressed("Jump") or Input.is_action_just_pressed("Mouse_Jump")) and !thing_killed:
		velocity.y = Global.JUMP_VELOCITY
		AudioStreamer.play_sfx(Global.jump_sound, -3)
	
	move_and_slide()
	update_animation()

func update_animation():
	if velocity.y >= 90:
		var tween_down = create_tween()
		tween_down.tween_property(self, "rotation", deg_to_rad(20), 0.3)
		thing_sprite.play("fall")
	elif velocity.y < 50:
		var tween_up = create_tween()
		tween_up.tween_property(self, "rotation", deg_to_rad(-15), 0.5)
		thing_sprite.play("flap") 
	else:
		self.rotation = 0

func update_colors():
	thing_sprite.material.set("shader_parameter/outline_color", Global.thing_outline_color)
	thing_sprite.material.set("shader_parameter/body_color", Global.thing_body_color)
	thing_sprite.material.set("shader_parameter/mouth_color", Global.thing_mouth_color)
	thing_sprite.material.set("shader_parameter/eye_color", Global.thing_eye_color)

func _on_thing_killed():
	thing_killed = true
