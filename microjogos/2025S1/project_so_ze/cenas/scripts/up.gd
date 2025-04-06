extends Sprite2D

func _process(delta: float) -> void:
	if get_node("../").head:
		get_node("../AnimationUp").play("up")
		frame = 1
