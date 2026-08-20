extends AnimatedSprite2D
var speed = 120
@onready var fantasma_giro = false

func _physics_process(delta: float) -> void:
	if fantasma_giro == false:
		position.x-=speed*delta
	else:
		speed = 360
		position.x +=speed*delta
		position.y -=speed*delta
		rotation_degrees += 20000*delta
		$Area2D.collision_layer = 0
