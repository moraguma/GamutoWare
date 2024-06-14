extends CharacterBody2D

func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 500
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -500
	else:
		velocity.x = 0
	if Input.is_action_pressed("cima"):
		velocity.y = -500
	elif Input.is_action_pressed("baixo"):
		velocity.y = +500
	else:
		velocity.y = 0	

	
	move_and_slide()
