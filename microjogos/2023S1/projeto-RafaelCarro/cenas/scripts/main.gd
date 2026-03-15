extends Node2D

signal StartInput(Input)

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9



const MIN_TIME = 2.0
const MAX_TIME = 5.0


var Acertos = 0


@onready var keys = [$LeftArrow, $RightArrow, $UpArrow, $DownArrow, $SpaceKey]


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	randomize()
	keys.shuffle()
	
	for i in range(len(keys)):
		keys[i].set_time_to_hit(MIN_TIME + i * (MAX_TIME - MIN_TIME) / len(keys))


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


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
	
func aumentar_acertos():
	Acertos += 1
	if Acertos >= 5:
		Minigames.register_win(self)
		
func hit_sounds():
	if Acertos == 0:
		$Hit1.play()
	elif Acertos == 1:
		$Hit2.play()
	elif Acertos == 2:
		$Hit3.play()
	elif Acertos == 3:
		$Hit4.play()
	elif Acertos == 4:
		$Hit5.play()
	
