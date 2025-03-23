extends Control

@onready var enter_name: LineEdit = $SubmitScore/LineEdit
@onready var warning_text: Label = $SubmitScore/WarningText

var player_name

func _process(_delta):
	if Input.is_action_just_pressed("Enter"):
		_on_submit_pressed()
	if enter_name.text.replace(" ", "") == "":
		warning_text.visible = true
	else:
		warning_text.visible = false

func _on_submit_pressed():
	AudioStreamer.play_sfx(Global.button_click, 2)
	if enter_name.text.replace(" ", "") == "":
		pass
	else:
		player_name = enter_name.text
		SilentWolf.Scores.save_score(player_name, Global.score)
		self.visible = false
		Global.highscore_set = false

func _on_button_entered():
	AudioStreamer.play_sfx(Global.button_hover)
