extends AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
const SPEED = 120
@onready var fantasma_giro=0

func _physics_process(delta: float) -> void:
	if fantasma_giro == 0:
		position.x-=SPEED*delta
	else:
		const SPEED = 360
		position.x +=SPEED*delta
		position.y -=SPEED*delta
		rotation_degrees += 20000*delta
		$Area2D.collision_layer = 0
