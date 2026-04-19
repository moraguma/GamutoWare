extends RigidBody2D


# Called when the node enters the scene tree for the first time.
@export var progressebar: ProgressBar
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("acao"):
		apply_impulse(Vector2.RIGHT.rotated(rotation) * 4.7 * progressebar.value)
		




func _on_body_entered(body: Node) -> void:
	print("here")
	queue_free()
	pass # Replace with function body.
