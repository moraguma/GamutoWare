extends CharacterBody2D


const SPEED = 650.0
const gravity = 35
const fast_fall = 200

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("acao"):
		velocity.y += fast_fall * delta
	else: 
		velocity.y += gravity * delta
	
	var direction := Input.get_axis("esquerda", "direita")
	if direction: velocity.x = direction * SPEED
	else: velocity.x = move_toward(velocity.x, 0, SPEED)
	var colision = move_and_collide(velocity*delta)
	if colision:
		Minigames.register_lose(self)
		
	
