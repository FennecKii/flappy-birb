extends Node

const JUMP_VELOCITY: float = -235.0
const TUBE_SPEED: float = 100.0

signal thing_killed

var score: int = 0
var highscore: int = 0
var death_sound_played: bool = false

var thing_eye_color: Color = Color8(59, 36, 62, 255)
var thing_mouth_color: Color = Color8(197, 77, 113, 255)
var thing_body_color: Color = Color8(191, 152, 197, 255)
var thing_outline_color: Color = Color8(105, 73, 112, 255)

@onready var background_music = preload("res://Assets/Sound/Music/Keys Starry Night Main.wav")
@onready var button_click = preload("res://Assets/Sound/SFX/UI/Sweet Click A.wav")
@onready var button_hover = preload("res://Assets/Sound/SFX/UI/Sweet Subtle Hover A.wav")
@onready var score_1 = preload("res://Assets/Sound/SFX/Gameplay/Coin 005.wav")
@onready var score_25 = preload("res://Assets/Sound/SFX/Gameplay/Coin Pickup 001.wav")
@onready var score_100 = preload("res://Assets/Sound/SFX/Gameplay/Key Acquired 002.wav")
@onready var jump_sound = preload("res://Assets/Sound/SFX/Gameplay/Platform Bounce 002.wav")
@onready var death_sound = preload("res://Assets/Sound/SFX/Gameplay/Stick Hit 003.wav")

func initialize_game_state():
	score = 0
	death_sound_played = false
	highscore = SaveLoad.contents_to_save.highscore_value
