extends RigidBody2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("win")
		emit_signal("win")

func _process(delta: float) -> void:
	if global_position.y > 540:
		print("win")
		emit_signal("win")
		queue_free()
