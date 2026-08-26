extends CharacterBody2D


const SPEED = 230.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("acao") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	#Get the input direction and handle the movement/deceleration.
	#As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("esquerda", "direita")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction2 := Input.get_axis("cima","baixo")
	if direction2:
		velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y , 0 , SPEED)

	move_and_slide()

var morte = 0
func _on_virus_do_ib_body_entered(body: Node2D) -> void:
	if body == self:
		var som_morte = get_node("../efeito_morte")
		som_morte.play()
		queue_free()
	pass # Replace with function body.


func _on_porta_do_ib_body_entered(body: Node2D) -> void:
	if body == self:
		var som_vitoria = get_node("../efeito_vitoria")
		som_vitoria.play()
		queue_free()
		Minigames.register_win(self)
	pass # Replace with function body.


func _on_zumbi_do_ib_body_entered(body: Node2D) -> void:
	if body == self:
		var som_morte = get_node("../efeito_morte")
		som_morte.play()
		queue_free()
	pass # Replace with function body.
