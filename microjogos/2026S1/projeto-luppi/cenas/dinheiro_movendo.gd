extends CharacterBody2D

@onready var sucesso_dinheiro = preload ("res://microjogos/2026S1/projeto-luppi/recursos/imagens/sucesso dinheiro(1).png")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_h := Input.get_axis("esquerda", "direita")
	if direction_h:
		velocity.x = direction_h * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_v := Input.get_axis("cima", "baixo")
	if direction_v:
		velocity.y = direction_v * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
func _on_leitor_de_cédula_body_entered(body: Node2D) -> void:
	if body.is_in_group("dinheiro"):
		$DinheiroMovendo.texture = sucesso_dinheiro
		$Sucesso.play()
