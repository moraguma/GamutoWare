extends CharacterBody2D
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("direita"):
		velocity.x = 500
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -500
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("acao") and is_on_floor():
		velocity.y = -700
	velocity.y += 800 * delta
	move_and_slide()
	
	
