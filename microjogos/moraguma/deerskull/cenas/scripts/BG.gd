extends Sprite2D


const VELOCITY = Vector2(-90, 12)


func _process(delta):
	position += VELOCITY * delta
