extends CharacterBody2D

@export var SPEED = 600.0
@export var GRAVITY = 300.0

func _physics_process(delta):
	var direction = Vector2(0, 0)
	
	direction.x = Input.get_axis("esquerda", "direita")
	direction.y = Input.get_axis("cima", "baixo")
	
	if direction.length() != 0:
		direction = direction.normalized()
	
	velocity += direction * SPEED * delta
	velocity.x -= GRAVITY * delta
	
	move_and_slide()
	
