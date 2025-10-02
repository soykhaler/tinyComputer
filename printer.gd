extends Control
func _ready():
	$printText.text = core.printerText
	yield(core.wait(1), "completed")
	queue_free()
