extends Node

const save_location = "user://SaveFile.json"

var contents_to_save: Dictionary = {
	"highscore_value": 0,
	"thing_colors": [Color8(59, 36, 62, 255), Color8(197, 77, 113, 255), Color8(191, 152, 197, 255), Color8(105, 73, 112, 255)]
}

func _save():
	var file = FileAccess.open_encrypted_with_pass(save_location, FileAccess.WRITE, "sYJuihnv2F9^l8u?+l")
	file.store_var(contents_to_save.duplicate())
	file.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open_encrypted_with_pass(save_location, FileAccess.READ, "sYJuihnv2F9^l8u?+l")
		var data = file.get_var()
		file.close()
		
		var save_data = data.duplicate()
		contents_to_save.highscore_value = save_data.highscore_value
		contents_to_save.thing_colors = save_data.thing_colors
