extends AnimatedSprite2D
const SPEED = 120

func _physics_process(delta: float) -> void:
	var voar = get_parent().blade
	if voar == 0:
		position.x-=SPEED*delta
	else:
		const SPEED = 300
		position.x +=SPEED*delta
		position.y -=SPEED*delta
		rotation_degrees += 20000*delta

	
