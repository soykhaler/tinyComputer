extends Control
func showMessage(message: String) -> void:
	$AcceptDialog.dialog_text = message
	$AcceptDialog.popup()
func _ready():
	showMessage("System Loaded Successful")
	HideStartMenu()
func _on_Button_pressed():
	StartMenu()
func StartMenu():
	$StartMenu.visible = true;
func HideMenu():
	$StartMenu.visible = false;
func _on_Settings_pressed():
	HideMenu()
	$AcceptDialog.popup()
	showMessage("Available very soon")
	$beep.play()
func _on_Folders_pressed():
	HideMenu()
	$AcceptDialog.popup()
	showMessage("Available very soon")
	$beep.play()
func _on_Command_pressed():
	HideMenu()
	var command_window = preload("res://cmd.tscn")
	var cmd = command_window.instance()
	add_child(cmd)
	$beep.play()
func _on_Browser_pressed():
	HideMenu()
	$AcceptDialog.popup()
	showMessage("Available very soon")
	$beep.play()
func HideStartMenu():
	$StartMenu.visible = false;
