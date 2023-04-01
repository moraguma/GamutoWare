extends CharacterBody2D


const SPEED = 300
const JUMP_SPEED = 600
const GRAVITY = 800


func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 300
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -300
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("acao") and is_on_floor():
		velocity.y = -600
	
	velocity.y += 800 * delta
	
	move_and_slide()
