extends Node

const save_location = "user://SaveFile.json"

var contents_to_save: Dictionary = {
	"highscore_value": 0
}

func _save():
	var file = FileAccess.open_encrypted_with_pass(save_location, FileAccess.WRITE, "eMEuihnv2F9^l8u?+l")
	file.store_var(contents_to_save.duplicate())
	file.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open_encrypted_with_pass(save_location, FileAccess.READ, "eMEuihnv2F9^l8u?+l")
		var data = file.get_var()
		file.close()
		
		var save_data = data.duplicate()
		contents_to_save.highscore_value = save_data.highscore_value
