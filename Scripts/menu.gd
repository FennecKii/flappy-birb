extends Node2D

@onready var settings_panel: Control = $SettingsPanel

func _ready():
	AudioStreamer.play_music(Global.background_music, -3)
	SaveLoad._load()
	AudioServer.set_bus_volume_db(0, SaveLoad.contents_to_save.audio_server[0])
	AudioServer.set_bus_volume_db(1, SaveLoad.contents_to_save.audio_server[1])
	AudioServer.set_bus_volume_db(2, SaveLoad.contents_to_save.audio_server[2])
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
	settings_panel.visible = true

func _on_quit_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	SaveLoad.contents_to_save.highscore_value = Global.highscore
	SaveLoad.contents_to_save.thing_colors = [Global.thing_eye_color, Global.thing_mouth_color, Global.thing_body_color, Global.thing_outline_color]
	SaveLoad.contents_to_save.audio_server = [AudioServer.get_bus_volume_db(0), AudioServer.get_bus_volume_db(1), AudioServer.get_bus_volume_db(2)]
	SaveLoad._save()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover)

func _on_customize_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().change_scene_to_file("res://Scenes/UI/customize.tscn")

func _on_leaderboards_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	get_tree().change_scene_to_file("res://addons/silent_wolf/Scores/Leaderboard.tscn")
