extends CharacterBody2D

signal ra_ativado
signal ra_desativo

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("acao") :
		velocity.y = JUMP_VELOCITY
	move_and_slide()


func _on_leitor_de_cartão_body_entered(body: Node2D) -> void:
	if body.is_in_group("ra"):
		$Sprite2D.play("sucesso")
		$Sucesso.play()
		ra_ativado.emit()


func _on_leitor_de_cartão_body_exited(body: Node2D) -> void:
	if body.is_in_group("ra"):
		$Sprite2D.play("movendo")
		ra_desativo.emit()
