extends Node2D

@export var is_lose = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_lose:
		position.x += 10
