extends CharacterBody2D


const SPEED = 1000.0

func _physics_process(delta: float) -> void:
	var dir_x := Input.get_axis("esquerda", "direita")
	var dir_y := Input.get_axis("cima", "baixo")
	velocity = Vector2(dir_x, dir_y).normalized() * SPEED
	move_and_slide()
