extends Node2D

func _physics_process(delta):
	self.position.x -= Global.TUBE_SPEED * delta

func _on_tube_entered(body):
	if body.name == "Thing":
		body.velocity.y = 100
		Global.death_sound_played = true
		AudioStreamer.play_sfx(Global.death_sound, 2)
		Global.thing_killed.emit()

func _on_score_detection_entered(body):
	if body.name == "Thing":
		Global.score += 1
		AudioStreamer.play_sfx(Global.score_1, -3)
		if Global.score % 100 == 0:
			AudioStreamer.play_sfx(Global.score_100, -3)
		elif Global.score % 25 == 0:
			AudioStreamer.play_sfx(Global.score_25, -4)
