extends Panel

@onready var thing: CharacterBody2D = $Thing
@onready var thing_sprite: AnimatedSprite2D = $Thing/Thing

func _ready():
	thing.set_physics_process(false)
	thing.set_process(false)
	thing_sprite.material.set("shader_parameter/outline_color", Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255))
	thing_sprite.material.set("shader_parameter/body_color", Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255))
	thing_sprite.material.set("shader_parameter/mouth_color", Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255))
	thing_sprite.material.set("shader_parameter/eye_color", Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255))
