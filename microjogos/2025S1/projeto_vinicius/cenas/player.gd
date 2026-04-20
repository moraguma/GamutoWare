extends CharacterBody2D

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("acao"):
		velocity.y = -400
	

	velocity.y += 1000 * delta
	move_and_slide()
