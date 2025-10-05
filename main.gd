extends Control
func _ready():
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
	core.errorSound()
func _on_Folders_pressed():
	HideMenu()
	core.openFileDialog()
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
func _on_paint_pressed():
	HideMenu()
	var pixel_editor = preload("res://TinyPixelArt.tscn")
	var editor = pixel_editor.instance()
	add_child(editor)
	core.soundBeep(0.4)
func HideStartMenu():
	$StartMenu.visible = false;
func Music():
	HideMenu()
	var music = preload("res://Music.tscn")
	var m_window = music.instance()
	add_child(m_window)
	core.soundBeep(0.2)
func Notepad():
	HideMenu()
	var notepad = preload("res://Notepad.tscn")
	var w_notepad = notepad.instance()
	add_child(w_notepad)
	core.soundBeep(0.2)
func MiniCoder():
	HideMenu()
	var minicoder = preload("res://MiniCoder.tscn")
	var w_minicoder = minicoder.instance()
	add_child(w_minicoder)
	core.soundBeep(0.2)
func Tiny3D():
	get_tree().change_scene("res://Tiny3D.tscn")
