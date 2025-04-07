extends AnimationPlayer

func update_animation(above: bool):
	if above:
		play("big_floating", 0.5) 
		speed_scale = 2  # Set speed AFTER play()
	else:
		play("floating", 0.5) 
		speed_scale = 1  # Reset speed
