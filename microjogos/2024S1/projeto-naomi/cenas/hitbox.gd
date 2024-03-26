extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		body.velocity.y = body.JUMP_VELOCITY
		body.queue_free()
  
