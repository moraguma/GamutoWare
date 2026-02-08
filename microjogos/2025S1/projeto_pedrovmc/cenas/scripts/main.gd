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

var rng = RandomNumberGenerator.new()
var enemy_to_shoot

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	register_win()
	enemy_to_shoot = rng.randi_range(0,3)
	
	$EnemyLeft.setDirecao("Left")
	$EnemyRight.setDirecao("Right")
	$EnemyDown.setDirecao("Down")
	$EnemyUp.setDirecao("Up")
	
	await get_tree().create_timer(1).timeout
	
	match enemy_to_shoot:
		0: $EnemyLeft.shoot()
		1: $EnemyUp.shoot()
		2: $EnemyRight.shoot()
		3: $EnemyDown.shoot()

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if $Player.is_alive:
		if Input.is_action_just_pressed("baixo"):
			$Player.attack("Down")
		elif Input.is_action_just_pressed("cima"):
			$Player.attack("Up")
		elif Input.is_action_just_pressed("direita"):
			$Player.attack("Right")
		elif Input.is_action_just_pressed("esquerda"):
			$Player.attack("Left")


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


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
