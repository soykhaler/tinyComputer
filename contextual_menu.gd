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
	var cube_mesh = preload("res://models/cube_mesh.tscn")
	var cube_instance = cube_mesh.instance()
	add_child(cube_instance)
	cube_instance.owner = get_tree().get_current_scene()
	hideMenu()
func sphere():
	pass # Replace with function body.
func plane():
	pass # Replace with function body.
func cylinder():
	pass # Replace with function body.
