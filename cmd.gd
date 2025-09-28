extends Control
var output_text : TextEdit
var input_line  : LineEdit
func _ready():
	var panel = Panel.new()
	panel.rect_min_size = Vector2(600, 400)
	panel.rect_position = Vector2(0, 0)
	add_child(panel)
	var vbox = VBoxContainer.new()
	vbox.rect_min_size = panel.rect_min_size
	vbox.anchor_right = 1.0
	vbox.anchor_bottom = 1.0
	panel.add_child(vbox)
	output_text = TextEdit.new()
	output_text.readonly = true
	output_text.size_flags_vertical = Control.SIZE_EXPAND_FILL
	output_text.rect_min_size = Vector2(0, 300)
	vbox.add_child(output_text)
	input_line = LineEdit.new()
	input_line.size_flags_vertical = Control.SIZE_FILL
	input_line.connect("text_entered", self, "_on_input_line_entered")
	vbox.add_child(input_line)
	output_text.text = "Welcome to tinyComputer system terminal, type 'help' to start.\n\n"
	input_line.grab_focus()
func _on_input_line_entered(command: String) -> void:
	output_text.text += "> " + command + "\n"
	_process_command(command)
	input_line.text = ""
	output_text.cursor_set_line(output_text.get_line_count())
func _process_command(command: String) -> void:
	var cmd = command.strip_edges()
	var lower_cmd = cmd.to_lower()
	match lower_cmd:
		"window":
			core.CreateWindow()
			core.showMessage("empty window")
		"help":
			output_text.text += "Commands:\n"
			output_text.text += "  help       - Show this message\n"
			output_text.text += "  clear      - Clear terminal\n"
			output_text.text += "  echo       - Print text on terminal\n"
			output_text.text += "  exit       - Close this window\n"
			output_text.text += "  window [value] - show a simple alert window\n"
			output_text.text += "  beep [value]  - sounds a beeper\n"
		"clear":
			output_text.text = ""
		"exit":
			output_text.text += "Exiting...\n"
			queue_free()
		"boot":
			core.bootSound()
		"error":
			core.errorSound()
		_:
			if lower_cmd.begins_with("echo "):
				var text_to_echo = command.substr(5, command.length() - 5)
				output_text.text += text_to_echo + "\n"
			elif lower_cmd.begins_with("window "):
				var text_to_echo = command.substr(6, command.length() - 6)
				core.showMessage(text_to_echo)
				core.CreateWindow()
			elif lower_cmd.begins_with("beep "):
				var text_to_echo = command.substr(4, command.length() - 4)
				core.soundBeep(float(text_to_echo))
			else:
				output_text.text += "Unknown Command: " + command + "\n"
func Close():
	queue_free()
