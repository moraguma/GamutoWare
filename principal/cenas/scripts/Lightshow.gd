extends Sprite


const ROT_SPEED = PI/12


func _process(delta):
	rotation += ROT_SPEED * delta
