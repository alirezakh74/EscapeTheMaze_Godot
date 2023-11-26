extends "res://_scenes/characters/character/Character.gd"

signal moved
signal dead
signal grabbed_key
signal win


#func _ready():
	#$Sprite.scale = Vector2(1, 1)
	#$Sprite.rotation = 0
#	pass


func _process(delta):
	if can_move:
		for dir in moves.keys():
			if Input.is_action_pressed(dir):
				if move(dir):
					emit_signal("moved")


func _on_Player_area_entered(area):
	if(area.is_in_group("enemies")):
		area.hide()
		set_process(false)
		#$CollisionShape2D.disabled = true #this not working use next line
		$CollisionShape2D.set_deferred('disabled', true)
		$AnimationPlayer.play("die")
		yield($AnimationPlayer, "animation_finished")
		emit_signal("dead")
	if(area.has_method("pickup")):
		area.pickup()
		if area.type == "key_red":
			emit_signal("grabbed_key")
		if area.type == "star":
			emit_signal("win")
