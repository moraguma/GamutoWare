extends Sprite2D

func _process(delta: float) -> void:
	if get_node("../").rarm:
		frame = 1
