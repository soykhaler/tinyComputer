extends Node
var window = AcceptDialog.new()
var beeper = AudioStreamPlayer.new()
func _ready():
	add_child(beeper)
	beeper.stream= preload("res://blipSelect.wav")
func CreateWindow():
	get_tree().get_root().add_child(window)
	window.popup_centered()
func showMessage(message: String) -> void:
	window.dialog_text = message
func displayAlert(message: String) -> void:
	get_tree().get_root().add_child(window)
	window.popup_centered()
	window.dialog_text = message
func soundBeep(pitch: float) -> void:
	beeper.pitch_scale=pitch
	beeper.play()
