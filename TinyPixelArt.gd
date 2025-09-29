extends Control
func _ready():
	core.bootSound()
func Close():
	queue_free()
