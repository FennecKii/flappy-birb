extends Node2D

var SPEED: float = 200.0

signal kill_thing

func _physics_process(delta):
	position.x -= SPEED * delta

func _on_tube_entered(body):
	if body.name == "Thing":
		body.queue_free()

func _on_score_detection_entered(body):
	if body.name == "Thing":
		print("Score + 1")
