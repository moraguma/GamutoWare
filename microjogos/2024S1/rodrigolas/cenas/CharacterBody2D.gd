extends CharacterBody2D

func _physics_process(delta):
	const speed = 690.0
	if Input.is_action_pressed("esquerda"):
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("direita"):
		velocity.x = +speed
		velocity.y = 0
	elif Input.is_action_pressed("cima"):
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("baixo"):
		velocity.x = 0
		velocity.y = +speed
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
