extends CharacterBody2D

@export var speed : int = 500
@onready var timer : Timer = $timers/snap_timer
var can_snap : bool = true
var focused : bool = false

signal is_shot

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
			emit_signal("is_shot")

func _process(_delta) -> void:
	if can_snap:
		get_action()

func _physics_process(_delta) -> void:
	get_input()
	move_and_slide()

# Quando o timer acaba, habilita a ação novamente
func _on_snap_timer_timeout() -> void:
	can_snap = true

func _on_player_area_2d_area_entered(area: Area2D) -> void:
	focused = true

func _on_player_area_2d_area_exited(area: Area2D) -> void:
	focused = false
