extends AnimatedSprite2D

func _ready():
	rotation_degrees = 90 * (randi() % 4)
	frame = randi() % 7

func _process(delta: float) -> void:
	var gamuto = get_node("../Icon")
	if gamuto.position == position and gamuto.visible:
		if rotation_degrees == 90 or rotation_degrees == 180 or rotation_degrees == 270:
			rotation_degrees = 0
		frame = 7
		gamuto.hide()
		gamuto.pode_mexer = false
		get_parent().get_parent().register_lose()
