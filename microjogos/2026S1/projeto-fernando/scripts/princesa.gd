extends AnimatedSprite2D
@onready var voasim = 0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if voasim == 1:
		const SPEED = 800
		position.x -=SPEED*delta
		position.y -=SPEED*delta
		rotation_degrees += 20000*delta
		
		
