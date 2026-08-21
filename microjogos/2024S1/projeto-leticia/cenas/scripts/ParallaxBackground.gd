extends ParallaxBackground

@export var paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not paused: scroll_base_offset += Vector2(1000,0) * delta
