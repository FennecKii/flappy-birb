extends Node2D

func _on_bottom_bound_entered(body):
	if body.name == "Thing":
		body.queue_free()

func _on_tube_bound_entered(body):
	if body.get_parent().is_in_group("Tubes"):
		body.get_parent().queue_free()
