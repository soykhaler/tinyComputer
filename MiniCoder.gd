extends Control
var value = 0.0
var valueWord = ""
func Close():
	queue_free()
func Execute():
	var code = $TextEdit.text
	var lines = code.split("\n")
	for line in lines:
		var command = line.strip_edges()
		if command == "":
			continue
		if command == "//":
			continue
		if command.begins_with("beep "):
			var parts = command.split(" ")
			if parts.size() > 1:
				value = float(parts[1])   
				core.soundBeep(value)   
				yield (core.wait(0.1), "completed")  
		if command.begins_with("window "):
			var parts = command.split (" ")
			if parts.size() > 1:
				valueWord = str(parts[1])
				core.displayAlert(valueWord)
				yield (core.wait(0.1), "completed") 
		if command.begins_with("echo "):
			var parts = command.split (" ")
			if parts.size() >1:
				valueWord = str(parts[1])
				core.printerText = valueWord
				core.printer()
				print("comando")
				yield (core.wait(1), "completed") 
		if command.begins_with("wait "):
			var parts = command.split (" ")
			if parts.size() >1:
				value = float(parts[1])
				yield (core.wait(value), "completed")
		if command == "boot":
			core.bootSound()
			yield (core.wait(0.2), "completed") 
		if command == "error":
			core.errorSound()
			yield(core.wait(0.2), "completed")
