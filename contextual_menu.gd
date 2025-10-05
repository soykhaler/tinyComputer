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
	var sphere_mesh = preload("res://models/sphere_mesh.tscn")
	var sphere_instance = sphere_mesh.instance()
	add_child(sphere_instance)
	sphere_instance.owner = get_tree().get_current_scene()
	hideMenu()
func plane():
	var plane_mesh = preload("res://models/plane_mesh.tscn")
	var plane_instance = plane_mesh.instance()
	add_child(plane_instance)
	plane_instance.owner = get_tree().get_current_scene()
	hideMenu()
func cylinder():
	var cylinder_mesh = preload("res://models/cylinder_mesh.tscn")
	var cylinder_instance = cylinder_mesh.instance()
	add_child(cylinder_instance)
	cylinder_instance.owner = get_tree().get_current_scene()
	hideMenu()
