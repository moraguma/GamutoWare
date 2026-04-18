extends Node2D




const JAB = 0.5


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
var time_begin 
var time_delay
var timer
var aceitando = false
var pontuacao = 0
var passing = 3
var jab_feito = false

@onready var queue_jab = $"VAI"
@onready var soco = $"SOCO"
@onready var whiff = $WHIFF
@onready var contador = $Contador
@onready var animacao_saco = $"punchingbag"
@onready var animacao_soco = $"Player/AnimatedSprite2D"
@onready var in_timer = $InTimer
@onready var off_timer = $OffTimer


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if Input.is_action_just_pressed("acao"):
		if aceitando:
			animacao_soco.play("default")
			animacao_saco.play("default")
			pontuacao += 1
			if pontuacao >= passing:
				register_win()
			soco.play()
		else:
			whiff.play()
			pontuacao -= 1
		jab_feito = true
		contador.text = str(pontuacao)

func _on_off_timer_timeout() -> void:
	queue_jab.play()
	in_timer.start(0.4)
	aceitando = true
	jab_feito = false
	$AnimationPlayer.play("pop")

func _on_in_timer_timeout() -> void:
	aceitando = false
	off_timer.start(0.6)
	$AnimationPlayer.play("RESET")

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
	Minigames.register_win(self)


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
