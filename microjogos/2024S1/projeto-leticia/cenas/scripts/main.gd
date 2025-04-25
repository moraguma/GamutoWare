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

const UP_POS = 854
const DOWN_POS = 1005


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	pass
	
	randomize()
	var gone_up = false
	var gone_down = false
	var cars = $Policias.get_children()
	for car in cars:
		var r = randi() % 2 == 0
		if r:
			gone_up = true
		else:
			gone_down = true
		car.position[1] = UP_POS if r else DOWN_POS
	
	if not gone_down:
		cars[1].position[1] = DOWN_POS
	elif not gone_up:
		cars[1].position[1] = UP_POS
	
	register_win()
# Called every frame. 'delta' is the elapsed time since the previous frame.


var speed = 500
func _physics_process(delta):
	var velocity =  Vector2()
	velocity = velocity.normalized()*speed*delta
	position = velocity*delta
	
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada

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

func _on_carro_principal_lose():
	register_lose()
	$Background.paused = true
	$Policias.is_lose = true
