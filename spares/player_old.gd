extends AnimatedSprite2D

func _input(event):
	if is_playing() and event.is_action_pressed("click"):
		speed_scale = 2.0
	elif event.is_action_pressed("cancel"):
		speed_scale = 1.0

func _on_area_2d_mouse_entered():
	play("idle")


func _on_area_2d_mouse_exited():
	stop()
	speed_scale = 1.0
