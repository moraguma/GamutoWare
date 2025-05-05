extends CharacterBody2D

var vel = 60
var grav = -150


func _physics_process(delta):
	velocity.y += 5
	if(Input.is_action_just_pressed("cima") and is_on_floor()):
		velocity.y = grav
	if(Input.is_action_pressed("direita")):
		velocity.x = vel
	else:
		if(velocity.x < 0):
			velocity.x += 10
		if(velocity.x > 0):
			velocity.x = 0
	if(Input.is_action_pressed("esquerda")):
		velocity.x = -vel
	else:
		if(velocity.x > 0):
			velocity.x -= 10
		if(velocity.x < 0):
			velocity.x = 0
	move_and_slide()
