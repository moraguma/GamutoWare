extends AnimatedSprite2D

func update_animation(above: bool) -> void:
	if above:
		play("above_50")
	else:
		play("below_50")  # Adjust if a specific animation name is needed
