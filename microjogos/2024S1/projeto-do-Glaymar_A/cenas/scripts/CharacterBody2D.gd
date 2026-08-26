extends CharacterBody2D

@export var vivo := true

func _physics_process(_delta):
	var direction = Input.get_vector("esquerda","direita","cima","baixo")
	velocity = direction * 300
	if vivo:
		move_and_slide()
	
func hit(_dano:int):
	vivo = false
	Minigames.register_lose(self)
	$AnimationPlayer.play("death")
	$Hurt.play()
	collision_layer = 0
	$Arma.disabled = true
	
