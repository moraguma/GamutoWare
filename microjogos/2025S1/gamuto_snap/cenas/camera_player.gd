extends CharacterBody2D

@export var speed : int = 500
var can_snap : bool = true

# Pega o input do jogador para movimentação
func get_input() -> void:
	var input_direction : Vector2 = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = input_direction * speed

# Pega o input do jogador para a ação de tirar foto 
func get_action() -> void:
	if Input.is_action_pressed("acao"):
		print("SNAP!")
		can_snap = false

func _process(delta) -> void:
	if can_snap:
		get_action()
	
func _physics_process(delta) -> void:
	get_input()
	move_and_slide()
