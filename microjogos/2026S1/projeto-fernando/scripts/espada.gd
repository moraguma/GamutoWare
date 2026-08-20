extends Sprite2D
const SPEED = 2000
@export var aparecer = false

func _physics_process(delta: float) -> void:
	if aparecer:
		visible = true
		position.x+=SPEED*delta
		position.y-=SPEED*delta
		
		
		
		
