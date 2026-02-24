extends CharacterBody2D
var speed = 100

func _process(delta):
	velocity.y += get_gravity() * delta
	velocity.x = delta * speed
	move_and_slide()
