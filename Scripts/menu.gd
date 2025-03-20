extends Node2D

func _ready():
	AudioStreamer.play_music(Global.background_music, -3)

func _on_play_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_settings_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)

func _on_quit_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().quit()

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover, 2)
