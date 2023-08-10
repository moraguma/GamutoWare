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

const MIN_X = 600.0
const MAX_X = 1320.0
const START_Y = 250
const SEPARACAO = 300


var timer
var total_enemies = 4
var morreu = false

@onready var explosion = $Explosion
@onready var inimigos = [$Inimigo, $Inimigo2, $Inimigo3, $"Nave maior"]


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DEFEND YOUR SHIP!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("DEFENDA SUA NAVE!")
	
	var y = START_Y
	for inimigo in inimigos:
		inimigo.position = Vector2(randf_range(MIN_X, MAX_X), y)
		y -= SEPARACAO
	
	$Music.play()


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


func morrer():
	morreu = true


# Um método genérico. Crie quantos métodos você precisar!
func delete_enemy():
	explosion.play()
	
	total_enemies -= 1
	
	if total_enemies == 0 and not morreu:
		register_win() 


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
