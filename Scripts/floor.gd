extends TextureRect

func _physics_process(delta):
	self.position.x -= Global.TUBE_SPEED * delta
