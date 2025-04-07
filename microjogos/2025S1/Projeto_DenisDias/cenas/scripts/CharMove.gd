extends CharacterBody2D

var fist

func _ready():
	fist = $Fist

func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 300
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -300
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("baixo"):
		velocity.y = 300
	elif Input.is_action_pressed("cima"):
		velocity.y = -300
	else:
		velocity.y = 0
	
	
	move_and_slide()
