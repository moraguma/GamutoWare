extends Area2D


func _on_body_entered(body: Node2D) -> void:
	$Sprite2D.play("activate")
	body.queue_free()
	$Enter.play()
