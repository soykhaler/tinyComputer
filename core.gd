extends Node
var window = AcceptDialog.new()
var beeper = AudioStreamPlayer.new()
var explorer = FileDialog.new()
var printerText = ""
func _ready():
	add_child(beeper)
	beeper.stream= preload("res://blipSelect.wav")
func printer():
	var printerScene = preload("res://Printer.tscn")
	var printerWindow = printerScene.instance()
	get_tree().get_root().add_child(printerWindow)
func CreateWindow():
	get_tree().get_root().add_child(window)
	window.popup_centered()
func openFileDialog():
	get_tree().get_root().add_child(explorer)
	explorer.set_size(Vector2(300, 300))
	explorer.popup_centered()
func showMessage(message: String) -> void:
	window.dialog_text = message
func displayAlert(message: String) -> void:
	get_tree().get_root().add_child(window)
	window.popup_centered()
	window.dialog_text = message
func wait(time: float) -> void:
	yield(get_tree().create_timer(time), "timeout")
func soundBeep(pitch: float) -> void:
	beeper.pitch_scale=pitch
	beeper.play()
func errorSound():
	soundBeep(0.4)
	yield(wait(0.1), "completed")
	soundBeep(0.2)
	soundBeep(0.4)
	yield(wait(0.1), "completed")
	soundBeep(0.2)
func bootSound():
	soundBeep(0.4)
	yield(wait(0.1), "completed")
	soundBeep(0.2)
	yield(wait(0.1), "completed")
	soundBeep(0.4)
	yield(wait(0.1), "completed")
	soundBeep(0.6)

