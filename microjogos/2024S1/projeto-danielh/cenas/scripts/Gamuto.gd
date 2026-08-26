extends AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_anything_pressed():
		$AnimatedSprite2D.play("gamuto")
