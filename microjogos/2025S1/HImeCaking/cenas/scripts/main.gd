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

@export var arrow_up: Texture2D
@export var arrow_down: Texture2D
@export var arrow_left: Texture2D
@export var arrow_right: Texture2D
@export var arrow_nodes: Array[Sprite2D]

var  bgm = "res://microjogos/2025S1/HImeCaking/recursos/sons/bgm.wav"

const ARROW_QUANTITY = 4

@onready var spoon = $SpriteSpoon/AnimationPlayer
@onready var hime_eat = $SpriteChar/AnimationPlayer

var img_Arrows = {
	
}
var _arrows = ["up", "down", "left", "right"]
var sequence = []
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("EAT THE MAGIC CAKE \n IN THE RIGHT DIRECTION!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMA O BOLO MÁGICO \n NA DIREÇÃO CERTA!")
	
	_arrows.shuffle()
	sequence = _arrows
	#for a in range(ARROW_QUANTITY):
		#sequence.append(get_arrow())

	for n in arrow_nodes:
		n.visible = false
	

func get_arrow():
	var random_arrow = _arrows[randi() % _arrows.size()]
	return random_arrow
	
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada

# 0. up certo
# 1. up errado 
# 0. up certo
# 1. down certo 
# 2. left certo
# 3. left errado
var i = 0
func _process(delta):
	var dir = " "
	if Input.is_action_just_pressed("cima"):
		dir = "up"
		
	elif Input.is_action_just_pressed("baixo"):
		dir = "down"
		
	elif Input.is_action_just_pressed("esquerda"):
		dir = "left"
		
	elif Input.is_action_just_pressed("direita"):
		dir = "right"
	
	if dir != " " and i < ARROW_QUANTITY: 
		if i < len(arrow_nodes):
			arrow_nodes[i].visible = true
			match dir:
				"up":
					arrow_nodes[i].texture = arrow_up
				"down":
					arrow_nodes[i].texture = arrow_down
				"left":
					arrow_nodes[i].texture = arrow_left
				"right":
					arrow_nodes[i].texture = arrow_right
		
		if dir == sequence[i]:
			$Label.text = "Got it!"
			print("Got it!")
			$correct_sound.play()
			spoon.play("eat")
			hime_eat.play("open_mouth")
			$Cake.frame = i + 1 

			i += 1
			if i >= ARROW_QUANTITY:
				$win_sound.play()
				register_win()

		elif dir != sequence[i]:
			$Label.text = "Try Again"
			print("Try Again")
			$wrong_sound.play()
			
			i = 0
			for n in arrow_nodes:
				n.visible = false
			
		
		
				
			
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
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
