extends CharacterBody2D


const SPEED = 700.0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir_x := Input.get_axis("esquerda", "direita")
	var dir_y := Input.get_axis("cima", "baixo")
	if dir_x:
		velocity.x = dir_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if dir_y:
		velocity.y = dir_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
