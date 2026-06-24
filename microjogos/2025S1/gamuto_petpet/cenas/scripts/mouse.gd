extends CharacterBody2D

@export var speed : float
#var velocity = Vector2()  # Vetor de velocidade
var poder_petar : bool = false

func _process(_delta):
	velocity = Vector2.ZERO  # Inicializa a velocidade
	if Input.get_axis("esquerda", "direita") < 0:  # Movimento para a esquerda
		velocity.x = -speed
	elif Input.get_axis("esquerda", "direita") > 0:  # Movimento para a direita
		velocity.x = speed
	if Input.get_axis("cima", "baixo") < 0:  # Movimento para cima
		velocity.y = -speed
	elif Input.get_axis("cima", "baixo") > 0:  # Movimento para baixo
		velocity.y = speed

	if Input.is_action_just_pressed("acao"):
		$maoA.visible = false
		$maoF.visible = true
		if poder_petar:
			Minigames.register_win(self)
	if Input.is_action_just_released("acao"):
		$maoF.visible = false
		$maoA.visible = true
	move_and_slide()
	
func _on_gamuto_body_entered(_body: Node2D) -> void:
		poder_petar = true

func _on_gamuto_body_exited(_body: Node2D) -> void:
	poder_petar = false
