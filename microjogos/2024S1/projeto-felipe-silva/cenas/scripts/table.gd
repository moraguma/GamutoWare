extends StaticBody2D

# randomize table location
func _ready():
	if randi() % 2:
		position.x = -position.x
		scale.x = -1
	if randi() % 2:
		position.y = position.y + 250
