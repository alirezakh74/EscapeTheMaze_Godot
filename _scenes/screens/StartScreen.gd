extends Control

func _input(event):
	if event.is_action_pressed("ui_accept"):
		load_game()
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _ready():
	if Global.highscore == 0 or Global.highscore == null:
		$ScoreNotice.hide()
	else:
		if not $ScoreNotice.is_visible_in_tree():
			$ScoreNotice.show()
		$ScoreNotice.text = Global.cast_to_persian_number(Global.highscore) + " :ﺯﺎﯿﺘﻣﺍ ﻦﯾﺮﺗﻻﺎﺑ"
	
	yield(get_tree().create_timer(0.2), "timeout")
	$MenuMusic.play()


func load_game():
	#$TransitionRect.material.set_shader_parameter("progress", 1)
	#$Tween.interpolate_property($TransitionRect, material, 0.0, 1.0, 2,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	#yield($Tween, "tween_started")
	$TransitionAnimationPlayer.play("transition")
	yield($TransitionAnimationPlayer, "animation_finished")
	Global.new_game()
