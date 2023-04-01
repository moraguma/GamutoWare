extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):
	var dir = ( Vector2(1,0) * (Input.get_action_strength("direita") - Input.get_action_strength("esquerda")) + Vector2(0,1) *
	(Input.get_action_strength("baixo") - Input.get_action_strength("cima"))
	).normalized()
	velocity = dir * SPEED
	position += velocity * delta

	move_and_slide()
