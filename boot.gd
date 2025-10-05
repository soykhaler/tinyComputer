extends Node2D

func _ready():
	yield(core.wait(3), "finished")
	core.bootSound()
	

