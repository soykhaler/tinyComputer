extends Node2D

func _ready():
	core.soundBeep(2)
	$TcLogo.visible = false
	yield(core.wait(3), "completed")
	$TcLogo.visible = true
	core.bootSound()
	yield(core.wait(2), "completed")
	get_tree().change_scene("res://main.tscn")
	

