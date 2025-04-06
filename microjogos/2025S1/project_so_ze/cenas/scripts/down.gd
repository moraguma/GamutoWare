extends Sprite2D

func _process(delta: float) -> void:
	if get_node("../").legs:
		get_node("../AnimationDown").play("down")
		frame = 1
