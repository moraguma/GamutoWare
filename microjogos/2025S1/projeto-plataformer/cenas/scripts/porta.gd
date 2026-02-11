extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.inventory.get("estrela") and body.inventory.get("estrela") >= 1:
		$Sprite2D.frame = 87
		get_parent().get_parent().register_win()



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Sprite2D.frame = 88
