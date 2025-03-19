extends Node

const JUMP_VELOCITY: float = -240.0
const TUBE_SPEED: float = 100.0

signal thing_killed

var score: int = 0
var highscore: int = 0

func initialize_game_state():
	score = 0
