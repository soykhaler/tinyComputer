extends Camera 
export var speed = 10.0
export var mouse_sensitivity = 0.2
var dragging = false
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			dragging = event.pressed
			if dragging:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if event.button_index == BUTTON_WHEEL_UP:
			fov -= 1
		elif event.button_index == BUTTON_WHEEL_DOWN:
			fov += 1
	if event is InputEventMouseMotion and dragging:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		rotation.x += deg2rad(-event.relative.y * mouse_sensitivity)
		rotation.x = clamp(rotation.x, deg2rad(-90), deg2rad(90))
func _process(delta):
	if dragging:
		var input_dir = Vector3()
		if Input.is_action_pressed("move_forward"):
			input_dir -= global_transform.basis.z
		if Input.is_action_pressed("move_back"):
			input_dir += global_transform.basis.z
		if Input.is_action_pressed("move_left"):
			input_dir -= global_transform.basis.x
		if Input.is_action_pressed("move_right"):
			input_dir += global_transform.basis.x
		input_dir = input_dir.normalized()	
		global_translate(input_dir * speed * delta)
		if Input.is_action_pressed("up"):
			global_transform.origin.y += speed * delta
		if Input.is_action_pressed("down"):
			global_transform.origin.y -= speed * delta
