extends CharacterBody2D

@export var vivo := true

func _physics_process(delta):
	var direction = Input.get_vector("esquerda","direita","cima","baixo")
	velocity = direction * 300
	if vivo:
		move_and_slide()
	
func hit(dano:int):
	vivo = false
	get_parent().register_lose()
	$AnimationPlayer.play("death")
	collision_layer = 0
	$Arma.disabled = true
	
