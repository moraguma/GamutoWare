extends CharacterBody2D


const SPEED = 300.0


# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	# Add the gravity.
	var dir = (Vector2(1,0)*(Input.get_action_strength("direita")-Input.get_action_strength("esquerda")))
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	velocity = dir * SPEED
	#else:
	position += velocity*delta

	move_and_slide()
