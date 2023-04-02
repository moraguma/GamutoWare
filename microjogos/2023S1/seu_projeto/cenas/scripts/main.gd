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
@onready var canos = [
	$Node2D/Cano1,
	$Node2D/Cano2,
	$Node2D/Cano3,
	$Node2D/Cano4,
	$Node2D/Cano5,
	$Node2D/Cano6,
	$Node2D/Cano7,
	$Node2D/Cano8,
	$Node2D/Cano9,
	$Node2D/Cano10,
	$Node2D/Cano11,
	$Node2D/Cano12,
	$Node2D/Cano13,
	$Node2D/Cano14,
	$Node2D/Cano15,
	$Node2D/Cano16,
	$Node2D/Cano17,
	$Node2D/Cano18,
	$Node2D/Cano19,
]
var rot_canos_vitoria = [0, 0, 0, 0, 180, 90, 90, 90, 0, 0, 0, 270, 90, 0, 0, 0, 180, 90, 0]

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("COOL THE POWER PLANT!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("RESFRIE O GERADOR!")
	var escolha_canos1 = (randi() % 9) + 1
	var escolha_canos2 = (randi() % 10) + 10
	canos[escolha_canos1].rotation_degrees =+ 90
	canos[escolha_canos2].rotation_degrees =+ 90
	
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
	var rot_canos_final = []
	for cano in canos:
		rot_canos_final.append(int(round(cano.rotation_degrees)))
		print(rot_canos_final)
	print(rot_canos_vitoria)
	if rot_canos_vitoria == rot_canos_final:
		emit_signal("win")
		print("ganhou")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")


func _on_timer_timeout(): 
	register_win()
	pass # Replace with function body.
