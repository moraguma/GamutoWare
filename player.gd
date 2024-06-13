extends CharacterBody2D




func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 300
	if Input.is_action_pressed("esquerda"):
		velocity.x = -300
	if Input.is_action_pressed("baixo"):
		velocity.y = 300
	if Input.is_action_pressed("cima"):
		velocity.y = -300
	move_and_slide()

