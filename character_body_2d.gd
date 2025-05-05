extends CharacterBody2D
var speed = 900


func _physics_process(delta):


	if Input.is_action_pressed("baixo"):
		velocity.y = speed
	elif Input.is_action_pressed("cima"):
		velocity.y = -speed
	else:
		velocity.y = 0
	if Input.is_action_pressed("esquerda"):
		velocity.x = -speed
	elif Input.is_action_pressed("direita"):
		velocity.x = speed
	else:
		velocity.x = 0
	
	
	

	move_and_slide()


