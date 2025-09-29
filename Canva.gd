extends Node2D
var image = Image.new()
var brush_color = Color(1, 1, 1, 1)
var texture = ImageTexture.new()
var eraser_mode = false
var mouse_down = false
func _ready():
	image.create(16, 16, false, Image.FORMAT_RGBA8)
	image.fill(Color(0, 0, 0, 0)) 
	image.lock()
	texture.create_from_image(image)
	texture.flags = texture.flags & ~Texture.FLAG_FILTER
func _draw():
		var scale_factor = 8
		var canvas_size = texture.get_size() * scale_factor
		var canvas_position = (get_viewport_rect().size - canvas_size) / 2
		draw_texture_rect(texture, Rect2(canvas_position, canvas_size), false)
func _draw_pixel_at_mouse_position():
			var scale_factor = 8
			var canvas_size = texture.get_size() * scale_factor
			var canvas_position = (get_viewport_rect().size - canvas_size) / 2
			var pos = (get_local_mouse_position() - canvas_position) / scale_factor
			if pos.x >= 0 and pos.x < image.get_width() and pos.y >= 0 and pos.y < image.get_height():
				image.lock() 
				if eraser_mode:
					image.set_pixelv(pos.floor(), Color(0, 0, 0, 0)) 
				else:
					image.set_pixelv(pos.floor(), brush_color)
				texture.set_data(image)
				update()
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			mouse_down = event.pressed
			if mouse_down:
				_draw_pixel_at_mouse_position()
	elif event is InputEventMouseMotion:
		if mouse_down:
			_draw_pixel_at_mouse_position()
