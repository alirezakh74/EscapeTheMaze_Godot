extends CanvasLayer

func _ready():
	if Global.score == null:
		Global.score = 0
	$MarginContainer/ScoreLabel.text = Global.cast_to_persian_number(Global.score)

func update_score(value):
	Global.score += value
	$MarginContainer/ScoreLabel.text = Global.cast_to_persian_number(Global.score)
