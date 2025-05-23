extends Node2D

# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
var cliques=0;
var scene_cookie = preload("res://microjogos/2025S1/Cookies/cenas/cookie.tscn")
var rng = RandomNumberGenerator.new()


# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´

	register_win()


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if Input.is_action_just_pressed("acao"):
		cliques+=10
		var my_random_number = rng.randf_range(-300.0, 300.0)
		var instance_cookie = scene_cookie.instantiate()
		instance_cookie.position = Vector2(960+my_random_number, 400+sqrt(90000-my_random_number*my_random_number))
		add_child(instance_cookie)

	if Input.is_action_just_pressed("direita") and not $Turret2.enabled:
		if cliques >= 100:
			$Turret2.spawn()
			cliques -= 100
	if Input.is_action_just_pressed("esquerda") and not $Turret.enabled:
		if cliques >= 100:
			$Turret.spawn()
			cliques -= 100
	if Input.is_action_just_pressed("cima") and not $Cannon.enabled:
		if cliques >= 200:
			$Cannon.spawn()
			cliques -= 200
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
