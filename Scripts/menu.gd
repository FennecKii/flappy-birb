extends Node2D

func _ready():
	AudioStreamer.play_music(Global.background_music, -3)
	SaveLoad._load()
	Global.highscore = SaveLoad.contents_to_save.highscore_value
	Global.thing_eye_color = SaveLoad.contents_to_save.thing_colors[0]
	Global.thing_mouth_color = SaveLoad.contents_to_save.thing_colors[1]
	Global.thing_body_color = SaveLoad.contents_to_save.thing_colors[2]
	Global.thing_outline_color = SaveLoad.contents_to_save.thing_colors[3]

func _on_play_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_settings_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)

func _on_quit_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	SaveLoad.contents_to_save.highscore_value = Global.highscore
	SaveLoad.contents_to_save.thing_colors = [Global.thing_eye_color, Global.thing_mouth_color, Global.thing_body_color, Global.thing_outline_color]
	SaveLoad._save()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover)

func _on_customize_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().change_scene_to_file("res://Scenes/UI/customize.tscn")
