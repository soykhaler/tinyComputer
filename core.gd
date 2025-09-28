extends Node
var window = AcceptDialog.new()
func CreateWindow():
	get_tree().get_root().add_child(window)
	window.popup_centered()
func _ready():
	pass
func showMessage(message: String) -> void:
	window.dialog_text = message
func displayAlert(message: String) -> void:
	get_tree().get_root().add_child(window)
	window.popup_centered()
	window.dialog_text = message
