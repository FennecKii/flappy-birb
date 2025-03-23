extends Node2D

@onready var thing: CharacterBody2D = $Thing/Thing

@onready var thing_eye_color: ColorPickerButton = $Thing/Colors/Eyes/EyeColor
@onready var thing_mouth_color: ColorPickerButton = $Thing/Colors/Mouth/MouthColor
@onready var thing_body_color: ColorPickerButton = $Thing/Colors/Body/BodyColor
@onready var thing_outline_color: ColorPickerButton = $Thing/Colors/Outline/OutlineColor

@onready var thing_tab: Control = $Thing

var thing_default_eye_color: Color = Color8(59, 36, 62, 255)
var thing_default_mouth_color: Color = Color8(197, 77, 113, 255)
var thing_default_body_color: Color = Color8(191, 152, 197, 255)
var thing_default_outline_color: Color = Color8(105, 73, 112, 255)

func _ready():
	thing.set_physics_process(false)
	thing_eye_color.color = Global.thing_eye_color
	thing_mouth_color.color = Global.thing_mouth_color
	thing_body_color.color = Global.thing_body_color
	thing_outline_color.color = Global.thing_outline_color

func _on_eye_color_changed(color):
	Global.thing_eye_color = color

func _on_mouth_color_changed(color):
	Global.thing_mouth_color = color

func _on_body_color_changed(color):
	Global.thing_body_color = color

func _on_outline_color_changed(color):
	Global.thing_outline_color = color

func _on_reset_eyes_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	Global.thing_eye_color = thing_default_eye_color
	thing_eye_color.color = thing_default_eye_color

func _on_reset_mouth_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	Global.thing_mouth_color = thing_default_mouth_color
	thing_mouth_color.color = thing_default_mouth_color

func _on_reset_body_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	Global.thing_body_color = thing_default_body_color
	thing_body_color.color = thing_default_body_color

func _on_reset_outline_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	Global.thing_outline_color = thing_default_outline_color
	thing_outline_color.color = thing_default_outline_color

func _on_thing_tab_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	thing_tab.visible = true

func _on_close_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	SaveLoad.contents_to_save.thing_colors = [Global.thing_eye_color, Global.thing_mouth_color, Global.thing_body_color, Global.thing_outline_color]
	SaveLoad._save()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover)

func _on_color_button_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)

func _on_randomize_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	Global.thing_eye_color = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255)
	Global.thing_mouth_color = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255)
	Global.thing_body_color = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255)
	Global.thing_outline_color = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255)
	thing_eye_color.color = Global.thing_eye_color
	thing_mouth_color.color = Global.thing_mouth_color
	thing_body_color.color = Global.thing_body_color
	thing_outline_color.color = Global.thing_outline_color
