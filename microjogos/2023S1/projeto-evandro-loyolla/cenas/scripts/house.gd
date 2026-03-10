extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_parent().register_win()
		$"Open".play()
