extends CharacterBody2D

const SPEED = 700.0

func _physics_process(delta):
	
	velocity.x = -SPEED

	move_and_slide()
