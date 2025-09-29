extends Node2D

const GRID_SIZE = 32
const PIXEL_SIZE = Vector2(16, 16)
const PixelScene = preload("res://Pixel.tscn")

var current_color = Color.black
var is_drawing = false

onready var grid_container = $GridContainer

func _ready():
	core.bootSound()
	grid_container.mouse_filter = MOUSE_FILTER_IGNORE
	$ColorPickerButton.connect("color_changed", self, "_set_current_color")
	
	for i in range(GRID_SIZE * GRID_SIZE):
		var pixel = PixelScene.instance()
		pixel.rect_min_size = PIXEL_SIZE
		grid_container.add_child(pixel)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		is_drawing = event.pressed
	
	if is_drawing and (event is InputEventMouseMotion or event.pressed):
		var local_pos = grid_container.to_local(event.position)
		if grid_container.get_rect().has_point(local_pos):
			var coords = Vector2(int(local_pos.x/PIXEL_SIZE.x), int(local_pos.y/PIXEL_SIZE.y))
			var pixel_node = grid_container.get_child(coords.y * GRID_SIZE + coords.x)
			pixel_node.color = current_color

func _set_current_color(new_color):
	current_color = new_color

func Close():
	queue_free()
