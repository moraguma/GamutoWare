extends CharacterBody2D

const speed = 1000	# velocidade dos veiculos
var collision
var collider

func _physics_process(delta):
	velocity.x = -speed
	collision = move_and_collide(velocity*delta)	# se move e analisa colisoes
	if collision != null:
		collider = collision.get_collider()
		if collider.has_method("explode"):	# se colidir com jogador
			collider.explode()
			collider.velocity.y = 0
			$"../".register_lose()
