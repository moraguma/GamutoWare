extends CharacterBody2D

@export var speed : int = 500
@onready var timer : Timer = $timers/snap_timer

var can_snap : bool = true
var focused : bool = false
var is_on_gamuto : int = 0		# Identifica qual Gamuto o jogador está focado

signal snapped_gamuto(gamuto : int)		# Sinal que identifica qual Gamuto foi atingido

# Pega o input do jogador para movimentação
func get_input() -> void:
	var input_direction : Vector2 = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = input_direction * speed

# Pega o input do jogador para a ação de tirar foto 
func get_action() -> void:
	if Input.is_action_pressed("acao") and can_snap:
		timer.start(1)
		can_snap = false

		if focused:
			print("SNAP!")
			snap_gamuto()
		else:
			print("NOTHING TO SNAP!")

func _process(_delta) -> void:
	get_action()

func _physics_process(_delta) -> void:
	get_input()
	move_and_slide()

# Função que emite os sinais de atingido
func snap_gamuto() -> void:
	match is_on_gamuto:
		1:
			print("GOT ME 1!")
			emit_signal("snapped_gamuto", 1)
		2:
			print("GOT ME 2!")
			emit_signal("snapped_gamuto", 2)
		3:
			print("GOT ME 3!")
			emit_signal("snapped_gamuto", 3)
		4:
			print("GOT ME 4!")
			emit_signal("snapped_gamuto", 4)
		5:
			print("GOT ME 5!")
			emit_signal("snapped_gamuto", 5)

# Quando o timer acaba, habilita a ação novamente
func _on_snap_timer_timeout() -> void:
	can_snap = true

# Se entrar em qualquer área de Gamuto, fica em foco 
func _on_player_area_2d_area_entered(area: Area2D) -> void:
	focused = true

# Se sair de qualquer área de Gamuto, sai do foco e deixa de estar em qualquer área
func _on_player_area_2d_area_exited(area: Area2D) -> void:
	focused = false
	is_on_gamuto = 0

# Caso entre especificamente na área do Gamuto 1
func _on_gamuto_1_area_entered(area: Area2D) -> void:
	is_on_gamuto = 1
# Caso entre especificamente na área do Gamuto 2
func _on_gamuto_2_area_entered(area: Area2D) -> void:
	is_on_gamuto = 2
# Caso entre especificamente na área do Gamuto 3
func _on_gamuto_3_area_entered(area: Area2D) -> void:
	is_on_gamuto = 3
# Caso entre especificamente na área do Gamuto 4
func _on_gamuto_4_area_entered(area: Area2D) -> void:
	is_on_gamuto = 4
# Caso entre especificamente na área do Gamuto 5
func _on_gamuto_5_area_entered(area: Area2D) -> void:
	is_on_gamuto = 5
