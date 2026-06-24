extends CharacterBody2D

const SPEED = 600
const ACCEL = 0.15
const SPRITE_LERP_WEIGHT = 0.2
const RECOIL = Vector2(0, -64)

func _physics_process(delta):
	var dir = (
		Vector2(1, 0) * 
		(Input.get_action_strength("direita") - Input.get_action_strength("esquerda")) 
		+ Vector2(0, 1) * 
		(Input.get_action_strength("baixo") - Input.get_action_strength("cima"))
		).normalized()
	velocity = velocity.lerp(dir * SPEED, ACCEL)
	position += velocity * delta 
	
	# Limita a posição da mira para não sair da tela
	position[0] = clamp(position[0], 0, 1920)
	position[1] = clamp(position[1], 0, 1080)
