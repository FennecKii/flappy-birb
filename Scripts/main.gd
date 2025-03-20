extends Node2D

@onready var tube_scene: PackedScene = preload("res://Scenes/tube.tscn")
@onready var floor_scene: PackedScene = preload("res://Scenes/floor.tscn")
@onready var score_label: Label = $Score
@onready var death_panel: Control = $DeathPanel

var tube_spacing_min: float = 125
var tube_spacing_max: float = 135
var spawn_position_min: float = -65
var spawn_position_max: float = 50
var floor_spawned: bool = false
var tube_spawned: bool = false
var tube_num: int = 0

func _ready():
	Global.initialize_game_state()
	Global.thing_killed.connect(_on_thing_killed)

func _process(_delta):
	update_score()
	if tube_spawned == false:
		tube_num += 1
		if tube_num == 1:
			spawn_tube(Vector2(300, randf_range(-15, 0)))
		elif tube_num == 2:
			spawn_tube(Vector2(300, randf_range(-25, 10)))
		elif tube_num == 3:
			spawn_tube(Vector2(300, randf_range(-45, 30)))
		else:
			spawn_tube(Vector2(300, randf_range(spawn_position_min, spawn_position_max)))
		tube_spawned = true
		await get_tree().create_timer(randf_range(tube_spacing_min, tube_spacing_max)/100).timeout
		tube_spawned = false 

func _on_bottom_bound_entered(body):
	if body.name == "Thing":
		if Global.score > Global.highscore:
			Global.highscore = Global.score
		body.process_mode = Node.PROCESS_MODE_DISABLED
		death_panel.visible = true
		get_tree().paused = true

func _on_tube_bound_entered(body):
	if body.get_parent().is_in_group("Tubes"):
		body.get_parent().queue_free()

func spawn_tube(tube_position: Vector2i):
	var new_tube = tube_scene.instantiate()
	new_tube.set_position(tube_position)
	self.add_child(new_tube)

func update_score():
	score_label.text = str(Global.score)

func _on_thing_killed():
	if Global.score > Global.highscore:
		Global.highscore = Global.score
	await get_tree().create_timer(0.01).timeout
	self.set_process(false)
	for floor in get_tree().get_nodes_in_group("Floors"):
		floor.process_mode = Node.PROCESS_MODE_DISABLED
	for tube in get_tree().get_nodes_in_group("Tubes"):
		tube.process_mode = Node.PROCESS_MODE_DISABLED
	death_panel.visible = true
	await get_tree().create_timer(1.5).timeout
	get_tree().paused = true

func spawn_floor(floor_position: Vector2i):
	var new_floor = floor_scene.instantiate()
	new_floor.set_position(floor_position)
	self.add_child(new_floor)

func _on_floor_bound_entered(area):
	if area.get_parent().is_in_group("Floors"):
		area.get_parent().queue_free()
		await get_tree().create_timer(0.01).timeout
		spawn_floor(Vector2(306, 116))


func _on_thing_bottom_bound_body_entered(body):
	pass # Replace with function body.
