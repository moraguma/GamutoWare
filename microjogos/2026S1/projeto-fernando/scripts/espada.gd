extends Sprite2D
const SPEED = 2000

func _ready() -> void:
	visible = false

func _physics_process(delta: float) -> void:
	var aparecer = get_parent().blade
	if aparecer == 1:
		visible = true
		position.x+=SPEED*delta
		position.y-=SPEED*delta
		
		
		
		
