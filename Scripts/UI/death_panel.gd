extends Control

@onready var score_label: Label = $Panel/VBoxContainer/Score
@onready var highscore_label: Label = $Panel/VBoxContainer/Highscore

func _on_play_again_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_visibility_changed():
	if self.visible == true:
		score_label.text = "Score: " + str(Global.score)
		highscore_label.text = "Highscore: " + str(Global.highscore)
