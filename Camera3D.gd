extends Camera

var scroll_speed = 1.0
export var speed = 10.0
export var mouse_sensitivity = 0.2

var dragging = false

func _unhandled_input(event):
	if event is InputEventMouseButton:
		# Click derecho para rotar
		if event.button_index == BUTTON_RIGHT:
			dragging = event.pressed
			if dragging:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

		# Zoom con scroll
		if event.button_index == BUTTON_WHEEL_UP:
			fov -= 1
		elif event.button_index == BUTTON_WHEEL_DOWN:
			fov += 1

	if event is InputEventMouseMotion and dragging:
		# Rotación horizontal
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		# Rotación vertical
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)

func _process(delta):
	if dragging:
		var direction = Vector3()

		# Movimiento WASD (debes tener acciones configuradas en Input Map)
		if Input.is_action_pressed("move_forward"):
			direction -= transform.basis.z
		if Input.is_action_pressed("move_back"):
			direction += transform.basis.z
		if Input.is_action_pressed("move_left"):
			direction -= transform.basis.x
		if Input.is_action_pressed("move_right"):
			direction += transform.basis.x

		direction = direction.normalized()
		translate(direction * speed * delta)

		# Movimiento vertical
		if Input.is_action_pressed("up"):
			translate(Vector3(0, 0.15, 0))
		if Input.is_action_pressed("down"):
			translate(Vector3(0, -0.15, 0))
