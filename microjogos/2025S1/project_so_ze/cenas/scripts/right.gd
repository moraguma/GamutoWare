extends Sprite2D

func _process(delta: float) -> void:
	if get_node("../").rarm:
		get_node("../AnimationRight").play("right")
		frame = 1
