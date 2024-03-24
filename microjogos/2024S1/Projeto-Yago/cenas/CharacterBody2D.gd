extends CharacterBody2D

const SPEED = 1000
const accel = 4000
const friction = 1000

var input = Vector2.ZERO


func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("direita")) - int(Input.is_action_pressed("esquerda"))
	input.y = int(Input.is_action_pressed("baixo")) - int(Input.is_action_pressed("cima"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	#rotation = velocity.angle()
	if velocity.normalized() != Vector2(0,0):
		rotation = lerp_angle(rotation, deg_to_rad(90) + velocity.angle(), 0.3)
	
	#var normal_velocity = velocity.normalized()
	#rotation = cos(normal_velocity.x) + sin(normal_velocity.y) 
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(SPEED)
	
	move_and_slide()
