extends Control
func _ready():
	core.showMessage("System Loaded Successful")
	HideStartMenu()
func _on_Button_pressed():
	StartMenu()
func StartMenu():
	$StartMenu.visible = true;
func HideMenu():
	$StartMenu.visible = false;
func _on_Settings_pressed():
	HideMenu()
	core.displayAlert("Setting Tab\n Available very soon")
	core.soundBeep(0.2)
func _on_Folders_pressed():
	HideMenu()
	core.displayAlert("Folder Tab \n Available very Soon")
	core.soundBeep(0.3)
func _on_Command_pressed():
	HideMenu()
	var command_window = preload("res://cmd.tscn")
	var cmd = command_window.instance()
	add_child(cmd)
	core.soundBeep(0.4)
func _on_Browser_pressed():
	HideMenu()
	core.displayAlert("Browser Tab \nAvailable very soon")
	core.soundBeep(0.6)
func HideStartMenu():
	$StartMenu.visible = false;
