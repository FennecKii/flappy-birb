extends Panel

@onready var thing: CharacterBody2D = $Thing

func _ready():
	thing.set_physics_process(false)
