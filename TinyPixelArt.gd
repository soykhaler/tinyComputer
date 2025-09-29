extends Control
func _ready():
	core.bootSound()
	pass
func Close():
	queue_free()
