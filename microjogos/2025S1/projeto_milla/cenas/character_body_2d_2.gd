extends CharacterBody2D

func _physics_process(delta):
	velocity.y = 300 
	velocity.x = 0
	move_and_slide()
		
	if Input.is_action_pressed ("esquerda"):
		queue_free()
