extends Node2D

func _physics_process(delta):
	self.position.x -= Global.TUBE_SPEED * delta

func _on_tube_entered(body):
	if body.name == "Thing":
		body.velocity.y = 100
		Global.thing_killed.emit()

func _on_score_detection_entered(body):
	if body.name == "Thing":
		Global.score += 1
