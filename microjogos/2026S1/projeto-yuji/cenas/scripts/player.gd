extends CharacterBody2D

var speed = 1000
var dir_atual = Vector2.RIGHT
var dir_anterior = Vector2.UP
var ganhou
var morreu = false
var posicao_anterior
var trilha
var houve_teleport = false

@onready var cena_trilha = preload("res://microjogos/2026S1/projeto-yuji/cenas/trilha.tscn")
@onready var anim = $Baixo/AnimationPlayer
@onready var explosao = $"Explosao"
@onready var sfx_explosao = $SomExplosao

func _ready():
	anim.play("new_animation")
	Minigames.register_win(self)
	posicao_anterior = global_position - dir_atual * speed
	adicionar_nova_trilha(posicao_anterior)
	
func _physics_process(delta: float) -> void:
	if morreu:
		return
	
	if dir_atual != dir_anterior:
		adicionar_nova_trilha(posicao_anterior)
		
	dir_anterior = dir_atual
	if Input.is_action_just_pressed("direita") and dir_atual.x == 0:
		dir_atual = Vector2.RIGHT
	elif Input.is_action_just_pressed("esquerda") and dir_atual.x == 0:
		dir_atual = Vector2.LEFT
	elif Input.is_action_just_pressed("cima") and dir_atual.y == 0:
		dir_atual = Vector2.UP
	elif Input.is_action_just_pressed("baixo") and dir_atual.y == 0:
		dir_atual = Vector2.DOWN
		
	
	posicao_anterior = global_position
	velocity = dir_atual * speed
	var colision = move_and_collide(velocity * delta)
	if colision:
		wall_colision()
	#Força a criacao de uma nova linha quando ha o teleport
	houve_teleport = false
	if global_position.x > 1920 or global_position.x < 0 or global_position.y > 1080 or global_position.y < 0:
		houve_teleport = true
		
	global_position.x = (int(global_position.x) + 1920) % 1920
	global_position.y = (int(global_position.y) + 1080) % 1080
	if houve_teleport:
		adicionar_nova_trilha(global_position - dir_atual * speed)
	else:
		trilha.update_trail(posicao_anterior)

func adicionar_nova_trilha(pos):
	trilha = cena_trilha.instantiate()
	get_parent().add_child(trilha)
	trilha.setup_trail(pos)

func wall_colision() -> void:
	$Baixo.visible = false
	explosao.visible = true
	explosao.play("default")
	sfx_explosao.play()
	morreu = true
	Minigames.register_lose(self)
