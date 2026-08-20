extends RigidBody2D



func _on_body_entered(body: Node) -> void:
	$AudioStreamPlayer.play()
