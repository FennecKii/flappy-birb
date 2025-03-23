extends Control

@onready var score_label: Label = $Panel/VBoxContainer/Score
@onready var highscore_label: Label = $Panel/VBoxContainer/Highscore

func _process(_delta):
	if self.visible and Input.is_action_just_pressed("Jump") and !Global.highscore_set:
		_on_play_again_pressed()

func _on_play_again_pressed():
	get_tree().paused = false
	Global.highscore_set = false
	SaveLoad.contents_to_save.highscore_value = Global.highscore
	SaveLoad._save()
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_visibility_changed():
	if self.visible == true:
		score_label.text = "Score: " + str(Global.score)
		highscore_label.text = "Highscore: " + str(Global.highscore)

func _on_quit_pressed():
	get_tree().paused = false
	Global.highscore_set = false
	AudioStreamer.play_sfx(Global.button_click, 2)
	SaveLoad.contents_to_save.highscore_value = Global.highscore
	SaveLoad._save()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover)
