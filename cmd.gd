extends Control

# Variables para los nodos de salida e ingreso
var output_text : TextEdit
var input_line  : LineEdit

func _ready():
	# Creamos un Panel que servirá de contenedor para la CLI
	var panel = Panel.new()
	panel.rect_min_size = Vector2(600, 400)
	panel.rect_position = Vector2(0, 0)
	add_child(panel)
	
	# Creamos un VBoxContainer para organizar los elementos verticalmente
	var vbox = VBoxContainer.new()
	vbox.rect_min_size = panel.rect_min_size
	vbox.anchor_right = 1.0
	vbox.anchor_bottom = 1.0
	panel.add_child(vbox)
	
	# Creamos el TextEdit para mostrar la salida de la CLI
	output_text = TextEdit.new()
	output_text.readonly = true
	output_text.size_flags_vertical = Control.SIZE_EXPAND_FILL
	# Usamos rect_min_size en lugar de custom_minimum_size para establecer el tamaño mínimo
	output_text.rect_min_size = Vector2(0, 300)
	vbox.add_child(output_text)
	
	# Creamos el LineEdit para la entrada de comandos
	input_line = LineEdit.new()
	input_line.size_flags_vertical = Control.SIZE_FILL
	input_line.connect("text_entered", self, "_on_input_line_entered")
	vbox.add_child(input_line)
	
	# Mensaje de bienvenida
	output_text.text = "Bienvenido a la CLI de Godot.\nEscribe 'help' para ver los comandos disponibles.\n\n"
	input_line.grab_focus()


# Se ejecuta cuando el usuario ingresa un comando y presiona Enter
func _on_input_line_entered(command: String) -> void:
	output_text.text += "> " + command + "\n"
	_process_command(command)
	input_line.text = ""
	output_text.cursor_set_line(output_text.get_line_count())


# Función que procesa los comandos ingresados
func _process_command(command: String) -> void:
	var cmd = command.strip_edges()
	var lower_cmd = cmd.to_lower()
	
	match lower_cmd:
		"help":
			output_text.text += "Comandos disponibles:\n"
			output_text.text += "  help       - Show this message\n"
			output_text.text += "  clear      - C\n"
			output_text.text += "  echo [txt] - Muestra el texto que ingreses\n"
			output_text.text += "  exit       - Cierra la aplicación\n"
		"clear":
			output_text.text = ""
		"exit":
			output_text.text += "Exiting...\n"
			queue_free()
		_:
			if lower_cmd.begins_with("echo "):
				var text_to_echo = command.substr(5, command.length() - 5)
				output_text.text += text_to_echo + "\n"
			else:
				output_text.text += "Comando desconocido: " + command + "\n"
func Close():
	queue_free()
