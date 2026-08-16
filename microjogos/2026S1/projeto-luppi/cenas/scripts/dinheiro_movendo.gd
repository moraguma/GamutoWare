extends CharacterBody2D

signal dinheiro_ativado
signal dinheiro_desativo

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = dir * SPEED
	move_and_slide()
	
func _on_leitor_de_cédula_body_entered(body: Node2D) -> void:
	if body.is_in_group("dinheiro"):
		$DinheiroMovendo.play("sucesso")
		$Sucesso.play()
		dinheiro_ativado.emit()

func _on_leitor_de_cédula_body_exited(body: Node2D) -> void:
	if body.is_in_group("dinheiro"):
		$DinheiroMovendo.play("movendo")
		dinheiro_desativo.emit()
