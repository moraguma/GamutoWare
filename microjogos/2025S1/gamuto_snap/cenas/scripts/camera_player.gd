extends CharacterBody2D

@export var speed : int = 500
@onready var timer : Timer = $timers/snap_timer
var can_snap : bool = true
var focused : bool = false
# Não estou orgulhoso disso, mas são booleanas para saber em qual Gamuto o jogador se encontra focado
var is_on_1 : bool = false
var is_on_2 : bool = false
var is_on_3 : bool = false

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
		
		if focused:
			print("GOT ME!")
			kill_gamuto()

func _process(_delta) -> void:
	if can_snap:
		get_action()

func _physics_process(_delta) -> void:
	get_input()
	move_and_slide()
	
func kill_gamuto() -> void:
	if is_on_1:
		print("GOT ME 1!")
		
	if is_on_2:
		print("GOT ME 2!")
		
	if is_on_3:
		print("GOT ME 3!")

# Quando o timer acaba, habilita a ação novamente
func _on_snap_timer_timeout() -> void:
	can_snap = true

# Se entrar em qualquer área de Gamuto, fica em foco 
func _on_player_area_2d_area_entered(area: Area2D) -> void:
	focused = true

# Se sair de qualquer área de Gamuto, sai do foco e deixa de estar em qualquer área
func _on_player_area_2d_area_exited(area: Area2D) -> void:
	focused = false
	is_on_1 = false
	is_on_2 = false
	is_on_3 = false

# Caso entre especificamente na área do Gamuto 1
func _on_gamuto_1_area_entered(area: Area2D) -> void:
	is_on_1 = true

# Caso entre especificamente na área do Gamuto 2
func _on_gamuto_2_area_entered(area: Area2D) -> void:
	is_on_2 = true

# Caso entre especificamente na área do Gamuto 3
func _on_gamuto_3_area_entered(area: Area2D) -> void:
	is_on_3 = true
