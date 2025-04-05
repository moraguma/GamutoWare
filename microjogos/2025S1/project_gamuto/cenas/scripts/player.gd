func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 300
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -300
	else:
		velocity.x = 0
