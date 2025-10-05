extends Node2D
func _ready():
	hideMenu()
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		position = get_global_mouse_position()
		showMenu()
func showMenu():
	$VBoxContainer.visible = true
func hideMenu():
	$VBoxContainer.visible = false


func cube():
	pass # Replace with function body.
