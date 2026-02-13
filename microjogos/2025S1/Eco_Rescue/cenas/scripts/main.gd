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

var maca = preload("res://microjogos/2025S1/Eco_Rescue/cenas/Maca.tscn")

const lixos = [preload("res://microjogos/2025S1/Eco_Rescue/cenas/Maca.tscn"), preload("res://microjogos/2025S1/Eco_Rescue/cenas/Sacola.tscn"), preload("res://microjogos/2025S1/Eco_Rescue/cenas/Lata.tscn")]
const tipo_correspondentes = [1, 3, 0]
@onready var lixeiras = [$Metal, $Organico, $Vidro, $Plastico, $Papel]
@onready var pos = randi() % len(lixeiras)

var lixo
var lixo_local
var tentou = false

@onready var som_perdeu = load("res://microjogos/2025S1/Eco_Rescue/recursos/sons/perdeu.wav")
@onready var som_ganhou = load("res://microjogos/2025S1/Eco_Rescue/recursos/sons/venceu.wav")

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FAÇA ALGO!")

	randi() % len(lixos)
	var pos_lixo = randi() %  len(lixos)
	
	var lixo_cena = lixos[pos_lixo]
	lixo_local = tipo_correspondentes[pos_lixo]
	lixo = lixo_cena.instantiate()
	
	add_child(lixo)

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	if Input.is_action_just_pressed("esquerda"):
		pos = pos - 1
		
	if Input.is_action_just_pressed("direita"):
		pos = pos + 1
	
	pos = clamp(pos, 0, 4)
	
	if Input.is_action_just_pressed("acao") and not tentou:
		tentou = true
		lixo.hide()
		if pos == lixo_local:
			register_win() 
			print("Venceu")
			
		else:
			register_lose()
			print("Perdeu")
	
	var lix_atual = lixeiras[pos]
	lixo.position.x = lix_atual.position.x


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
	$AudioStreamPlayer.stream = som_ganhou
	$AudioStreamPlayer.play()
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	$AudioStreamPlayer.stream = som_perdeu
	$AudioStreamPlayer.play()
	emit_signal("lose")
