extends CharacterBody2D

@export var speed : int = 500
@onready var timer : Timer = $timers/snap_timer
var can_snap : bool = true

# Pega o input do jogador para movimentação
func get_input() -> void:
	var input_direction : Vector2 = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = input_direction * speed

# Pega o input do jogador para a ação de tirar foto 
func get_action() -> void:
	if Input.is_action_pressed("acao"):
		timer.start(1)
		print("SNAP!")
		can_snap = false

func _process(delta) -> void:
	if can_snap:
		get_action()

func _physics_process(delta) -> void:
	get_input()
	move_and_slide()

# Quando o timer acaba, habilita a ação novamente
func _on_snap_timer_timeout() -> void:
	can_snap = true

func _on_gamutos_area_entered(area: Area2D) -> void:
	print("FOUND ME!")
