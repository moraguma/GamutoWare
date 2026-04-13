extends Node2D

# Declaração dos sinais win e lose
@onready var quantidades_exposto: Label = $canvas/ui/container/quantidades_exposto
@onready var balão: AnimatedSprite2D = $balão
@export var crescimento : float = 0

signal win
signal lose
var texto_do_balão = 0
var quantidades_de_clicks = 0
var clicados = 0
var pode : bool = true


# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FAÇA ALGO!")



	var numeros = randi_range(10,21)
	quantidades_de_clicks = numeros
	texto_do_balão = quantidades_de_clicks
	quantidades_exposto.text = str(texto_do_balão)
	print(quantidades_de_clicks," randomico")

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	quantidades_exposto.text = str(texto_do_balão)
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
	
	
func _input(event: InputEvent) -> void:
	if pode:
		if Input.is_action_just_pressed("acao"):
			clicados += 1
			balão.position.y -= 28
	#		comprimento * 32
			balão.scale.x += crescimento
			balão.scale.y += crescimento
			print(clicados)
			texto_do_balão -= 1
			if clicados == quantidades_de_clicks:
	#			vc ganhou
				quantidades_exposto.add_theme_color_override("font_color", Color("00d100"))
				register_win()
			elif clicados > quantidades_de_clicks:
	#			explodiu
				quantidades_exposto.add_theme_color_override("font_color", Color("e00000"))
				register_lose()
				balão.play("boom")
				pode = false
			
			elif clicados < quantidades_de_clicks:
	#			murchou
				register_lose()
