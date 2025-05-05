extends CharacterBody2D

func _physics_process(delta):
	var direction = Input.get_vector("esquerda","direita","cima","baixo")
	velocity = direction * 300
	move_and_slide()
	
