extends AnimatedSprite2D

func _ready():
	rotation_degrees = randi() % 360
	var value = randi() % 2000
	if value < 333:
		frame = 0
	elif value < 666:
		frame = 1
	elif value < 999:
		frame = 2
	elif value < 1332:
		frame = 3
	elif value < 1665:
		frame = 4
	elif value < 1998:
		frame = 5
	else:
		frame = 8
