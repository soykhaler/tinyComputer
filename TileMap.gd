extends TileMap
var gridSize = 16
var Dic = {}
func _ready():
	for x in range(gridSize):
		for y in range(gridSize):
			Dic[str(Vector2(x, y))] = {
				"Type": "Black",
				"Position": str(Vector2(x,y))
			}
			set_cell(x, y, 0)
func _process(delta):
	var tile = world_to_map(get_local_mouse_position())
	var tx = int(tile.x)
	var ty = int(tile.y)
	if Input.is_action_pressed("click"):
		for x in gridSize:
			set_cell(tx, ty, -1)
		if Dic.has(str(tile)):
			set_cell(tx, ty, 1)
	elif Input.is_action_pressed("RClick"):
		for x in gridSize:
			set_cell(tx, ty, -1)
		if Dic.has(str(tile)):
			set_cell(tx, ty, 0)
