extends CanvasLayer

signal start_game

func _ready():
	pass
	
func updateScore(score):
	$MarginContainer/ScoreLabel.text = str(score)

func updateTime(time):
	$MarginContainer/TimeLabel.text = str(time)

func show_message(message):
	$Label.text = message
	$Label.show()
	
func hide_message():
	$Label.hide()

func _on_Button_pressed():
	emit_signal("start_game")
	print(get_parent().new_game())
	$Button.hide()
	$Label.hide()