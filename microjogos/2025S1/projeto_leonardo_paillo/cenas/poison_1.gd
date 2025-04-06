extends AnimatedSprite2D

func _ready():
	rotation_degrees = 180 * (randi() % 4)
	frame = randi() % 7
