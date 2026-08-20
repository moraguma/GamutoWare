extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")
	pass # Replace with function body.

func _on_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
