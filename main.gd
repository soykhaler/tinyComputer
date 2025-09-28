extends Control
func _ready():
	$AcceptDialog.popup()
	$StartMenu.visible = false;
func _on_Button_pressed():
	StartMenu()
func StartMenu():
	$StartMenu.visible = true;
func HideMenu():
	$StartMenu.visible = false;
func _on_Settings_pressed():
	HideMenu()
	$AcceptDialog.popup()
	$AcceptDialog.dialog_text ="Settings Window"
	$beep.play()
func _on_Folders_pressed():
	HideMenu()
	$AcceptDialog.popup()
	$AcceptDialog.dialog_text ="Folder Window"
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
	$AcceptDialog.dialog_text ="Browser Window"
	$beep.play()
