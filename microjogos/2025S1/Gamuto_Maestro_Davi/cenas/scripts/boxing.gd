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

const MPB = 1
const JAB = 0.5


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
var time_begin 
var time_delay
var timer
var aceitando = false
@onready var animacao_soco = $"Animação/AnimatedSprite2D"
var pontuacao = 0
var queue_jab = "$AudioStreamPlayer2D"
var soco = "$AudioStreamPlayer2D/SOCO"
var whiff = "$WHIFF"
var ost = "$OST"
var passing = 3
@onready var animacao_saco = $"punchingbag"
# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	timer = get_node("Timer")
	timer.start(MPB)
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
			Global.LANGUAGE.EN:
				NotificationCenter.notify("LET'EM HAVE IT!")
			Global.LANGUAGE.PT:
				NotificationCenter.notify("VAI PRA CIMA!")
	$OST.play()


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass

const JAB_FEITO = false
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if timer.time_left > MPB - 0.4:
		aceitando = false
	elif timer.time_left < 0.4:
		aceitando = true
	if timer.time_left > 0.59 and timer.time_left < 0.6 and JAB_FEITO == false:
		$AudioStreamPlayer2D.play()
		const JAB_FEITO = true
		
	
	if Input.is_action_just_pressed("acao"):
		if aceitando:
			animacao_soco.play("default")
			animacao_saco.play("default")
			pontuacao += 1
			if pontuacao >= passing:
				register_win()
			$Contador.text = str(pontuacao)  
			$SOCO.play()
			print("this is working")
			pass #Acertou
		else:
			print("Errou")
			$WHIFF.play()
			pass # Whiff
	
	
# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!



	
		
	


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
