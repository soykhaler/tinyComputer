extends Control


func _ready():
	hideMenu()

func _process(delta):
	if Input.is_action_just_pressed("RClick"):
		showMenu()


func showMenu():
	$VBoxContainer.visible = true
	
func hideMenu():
	$VBoxContainer.visible = false
