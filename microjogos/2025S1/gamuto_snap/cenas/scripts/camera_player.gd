extends CharacterBody2D

# Caso não dê para ganhar, aumentar a velocidade?
@export var speed : int = 500
@onready var timer : Timer = $timers/snap_timer
@onready var flashSound : AudioStreamPlayer = $flashSound

var can_snap : bool = true
var focused : bool = false
var is_on_gamuto : int = 0		# Identifica qual Gamuto o jogador está focado

signal snapped_gamuto(gamuto : int)		# Sinal que identifica qual Gamuto foi atingido

func _physics_process(_delta) -> void:
	get_input()
	get_action()
	move_and_slide()

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
			flashSound.play()		# Toca o som completamente
			snap_gamuto()
			flash_effect()
		else:
			# Faz o som parar após 0.2 segundos
			flashSound.play()
			await get_tree().create_timer(0.2).timeout
			flashSound.stop()
			print("NOTHING TO SNAP!")

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

# Função que faz o efeito de flash da câmera
func flash_effect() -> void:
	var tween = create_tween()
	var tween_method = func(x): $playerAnimatedSprite.material.set_shader_parameter("flash", x)
	
	tween.tween_method(tween_method, 0.0, 1.0, 0.2)
	tween.tween_method(tween_method, 1.0, 0.0, 0.2)

# Quando o timer acaba, habilita a ação novamente
func _on_snap_timer_timeout() -> void:
	can_snap = true

# Se entrar em qualquer área de Gamuto, fica em foco 
func _on_player_area_2d_area_entered(_area: Area2D) -> void:
	focused = true

# Se sair de qualquer área de Gamuto, sai do foco e deixa de estar em qualquer área
func _on_player_area_2d_area_exited(_area: Area2D) -> void:
	focused = false
	is_on_gamuto = 0

# Caso entre especificamente na área do Gamuto 1
func _on_gamuto_1_area_entered(_area: Area2D) -> void:
	is_on_gamuto = 1
# Caso entre especificamente na área do Gamuto 2
func _on_gamuto_2_area_entered(_area: Area2D) -> void:
	is_on_gamuto = 2
# Caso entre especificamente na área do Gamuto 3
func _on_gamuto_3_area_entered(_area: Area2D) -> void:
	is_on_gamuto = 3
# Caso entre especificamente na área do Gamuto 4
func _on_gamuto_4_area_entered(_area: Area2D) -> void:
	is_on_gamuto = 4
# Caso entre especificamente na área do Gamuto 5
func _on_gamuto_5_area_entered(_area: Area2D) -> void:
	is_on_gamuto = 5

# Para impedir que fotos sejam tiradas após já ter ganhado 
func _on_main_win() -> void:
	can_snap = false
