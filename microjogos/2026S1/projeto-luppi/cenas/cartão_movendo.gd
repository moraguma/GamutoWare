extends CharacterBody2D

@onready var RA_movendo = preload ("res://microjogos/2026S1/projeto-luppi/recursos/imagens/ra movendo.png")
@onready var sucesso_RA = preload ("res://microjogos/2026S1/projeto-luppi/recursos/imagens/sucesso RA(1).png")

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
		$Sprite2D.texture = sucesso_RA
		$Sucesso.play()


func _on_leitor_de_cartão_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$Sprite2D.texture = RA_movendo
	print ("saiu")
