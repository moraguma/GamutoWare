extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Bola8":
		Minigames.register_win(self)
	elif body.name == "BolaBranca":
		Minigames.register_lose(self)
	body.queue_free()
