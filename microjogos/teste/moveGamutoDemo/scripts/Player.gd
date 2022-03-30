extends KinematicBody2D


const SPEED = 300
const JUMP_SPEED = 600
const GRAVITY = 800


var vel = Vector2(0, 0)


func _physics_process(delta):
	var dir = Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	
	vel[0] = SPEED * dir
	
	if is_on_floor():
		if Input.is_action_just_pressed("acao"):
			vel[1] = -JUMP_SPEED
	vel[1] += GRAVITY * delta
	
	vel = move_and_slide(vel, Vector2(0, -1))
