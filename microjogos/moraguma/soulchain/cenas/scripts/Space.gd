extends Sprite2D


const RADIUS = 2
const FREQUENCY = 8


var time_elapsed = 0


func _process(delta):
	time_elapsed += delta
	offset = Vector2(0, 1) * RADIUS * sin(FREQUENCY * time_elapsed)
