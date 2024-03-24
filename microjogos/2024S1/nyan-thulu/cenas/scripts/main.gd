extends Node2D

@export var cookie_scene: PackedScene
var Player = "../$Player"

# Declaração dos sinais win e lose
signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080


var rng = RandomNumberGenerator.new()
var spawners = []

var spawned = 0

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("SHOOT THE COOKIES!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("ATIRE NOS COOKIES!")
			
	register_win()
	rng.randomize()
	spawners = [$"Spawner", $"Spawner2", $"Spawner3", $"Spawner4"]
	get_node("Timer").start()


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada


		
var bullet_spawner = preload("res://microjogos/2024S1/nyan-thulu/cenas/bullet.tscn")
func _physics_process(delta):
	var velocity_bullet = Vector2(0,0);
	if Input.is_action_just_pressed("direita"):
		velocity_bullet =  Vector2(1, 0) * 900
	elif Input.is_action_just_pressed("cima"):
		velocity_bullet = Vector2(0, -1) * 900
	elif Input.is_action_just_pressed("esquerda"):
		velocity_bullet = Vector2(-1, 0) * 900
	elif Input.is_action_just_pressed("baixo"):
		velocity_bullet = Vector2(0, 1) * 900
	
	if velocity_bullet.length() != 0:
		var bullet =  bullet_spawner.instantiate()
		bullet.position = $Player.position
		var body = bullet.get_node("RigidBody2D") 
		body.linear_velocity = velocity_bullet
		var area = body.get_node("Area2D")
		bullet.set_rotation( body.linear_velocity.angle())
		add_child(bullet)
	
	
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass


# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------
# Quando o jogo começa, ela assume que o jogador não conseguiu vencer o jogo ainda, ou seja, se não
# acontecer nada, o jogador vai perder o jogo. A verificação se o jogador venceu o minigame é feita
# com base na emissão dos sinais "win" e "lose". Se "win" foi o último sinal emitido, o jogador
# vencerá o jogo, e se "lose" foi o último sinal emitido ou nenhum sinal foi emitido, o jogador
# perderá o jogo


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")


var quantidade_timer =0
func _on_timer_timeout():
	if quantidade_timer < 1:
		quantidade_timer += 1
	else:
		var randon_v = rng.randi_range(0, 3)
		var spawner = spawners[randon_v]
	
		var cookie = cookie_scene.instantiate()

		cookie.position = spawner.position
	
		add_child(cookie)
	
 
