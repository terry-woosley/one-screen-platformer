extends CanvasLayer

signal start

func _ready():
	$StartMessage.text = "Collect the gem and key then escape!"
	$StartMessage.show()
	$StartButton.text = "Start"
	$StartButton.show()

func _on_StartButton_pressed():
	emit_signal("start")
	$StartButton.hide()
	$StartMessage.hide()
