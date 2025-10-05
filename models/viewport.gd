extends Area

var camera: Camera
var dragging = false
var selected_mesh = false
var entered = false

func _ready():
	$gizmo.visible = false
	selected_mesh = false
	camera = get_viewport().get_camera()
	if not camera:
		print("No se encontró la cámara con get_viewport(). Intentando ruta directa...")
		camera = get_node("/root/Node/Camera")

func _process(delta):
	if Input.is_action_just_pressed("delete_button"):
		if entered == true:
			queue_free()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if (event.button_index == BUTTON_LEFT and selected_mesh == true):
			dragging = event.pressed
	elif event is InputEventMouseMotion and dragging:
		_move_object(event)

func _move_object(event):
	var from = camera.project_ray_origin(event.position)
	var to = from + camera.project_ray_normal(event.position) * 1000
	var plane = Plane(Vector3.UP, 0)
	var intersection = plane.intersects_ray(from, to)
	if intersection:
		global_transform.origin = intersection

func _on_mouse_entered():
	selected_mesh = true
	$gizmo.visible = true
	entered = true

func _on_mouse_exited():
	selected_mesh = false
	$gizmo.visible = false
	entered = false
