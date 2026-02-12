extends Sprite2D

func _process(delta: float) -> void:
	if get_node("../").head:
		frame = 1
