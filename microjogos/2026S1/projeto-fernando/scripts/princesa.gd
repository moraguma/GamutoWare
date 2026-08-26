extends AnimatedSprite2D
@onready var voasim = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if voasim:
		const SPEED = 800
		position.x -=SPEED*delta
		position.y -=SPEED*delta
		rotation_degrees += 20000*delta
		
func _on_area_2d_area_entered(area: Area2D) -> void:
	voasim = true
	get_parent().perdeu()
