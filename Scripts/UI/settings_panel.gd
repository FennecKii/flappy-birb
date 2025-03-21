extends Control

@onready var master_volume: HSlider = $Panel/VBoxContainer/MasterVolume
@onready var music_volume: HSlider = $Panel/VBoxContainer/MusicVolume
@onready var sfx_volume: HSlider = $Panel/VBoxContainer/SFXVolume

func _ready():
	SaveLoad._load()
	AudioServer.set_bus_volume_db(0, SaveLoad.contents_to_save.audio_server[0])
	AudioServer.set_bus_volume_db(1, SaveLoad.contents_to_save.audio_server[1])
	AudioServer.set_bus_volume_db(2, SaveLoad.contents_to_save.audio_server[2])
	master_volume.value = SaveLoad.contents_to_save.audio_server[0]
	music_volume.value = SaveLoad.contents_to_save.audio_server[2]
	sfx_volume.value = SaveLoad.contents_to_save.audio_server[1]

func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		if self.visible == false:
			AudioStreamer.play_sfx(Global.button_click, 2)
			SaveLoad._load()
			AudioServer.set_bus_volume_db(0, SaveLoad.contents_to_save.audio_server[0])
			AudioServer.set_bus_volume_db(1, SaveLoad.contents_to_save.audio_server[1])
			AudioServer.set_bus_volume_db(2, SaveLoad.contents_to_save.audio_server[2])
			master_volume.value = AudioServer.get_bus_volume_db(0)
			music_volume.value = AudioServer.get_bus_volume_db(2)
			sfx_volume.value = AudioServer.get_bus_volume_db(1)
			self.visible = true
			get_tree().paused = true
		else:
			AudioStreamer.play_sfx(Global.button_click, 2)
			SaveLoad.contents_to_save.audio_server = [AudioServer.get_bus_volume_db(0), AudioServer.get_bus_volume_db(1), AudioServer.get_bus_volume_db(2)]
			SaveLoad._save()
			self.visible = false
			get_tree().paused = false

func _on_master_volume_changed(value):
	if value == -20.0:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
	AudioServer.set_bus_volume_db(0, value)

func _on_music_volume_changed(value):
	if value == -20.0:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
	AudioServer.set_bus_volume_db(2, value)

func _on_sfx_volume_changed(value):
	if value == -20.0:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)
	AudioServer.set_bus_volume_db(1, value)

func _on_close_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	SaveLoad.contents_to_save.audio_server = [AudioServer.get_bus_volume_db(0), AudioServer.get_bus_volume_db(1), AudioServer.get_bus_volume_db(2)]
	SaveLoad._save()
	self.visible = false
	get_tree().paused = false

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover)

func _on_drag_started():
	AudioStreamer.play_sfx(Global.button_click, 2)
