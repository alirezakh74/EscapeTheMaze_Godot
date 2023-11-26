extends Control

func _input(event):
	if event.is_action_pressed("ui_select"):
		Global.new_game()


func _ready():
	if Global.highscore == 0 or Global.highscore == null:
		$ScoreNotice.hide()
	else:
		if not $ScoreNotice.is_visible_in_tree():
			$ScoreNotice.show()
		$ScoreNotice.text = "High Score: " + str(Global.highscore)

