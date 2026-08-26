extends Node2D

@export var arrow_nodes: Array[Sprite2D]

var  bgm = "res://microjogos/2025S1/HImeCaking/recursos/sons/bgm.wav"

const ARROW_QUANTITY = 3

@onready var spoon = $SpriteSpoon/AnimationPlayer
@onready var hime_eat = $SpriteChar

var _arrows = ["up", "down", "left", "right"]
var sequence = []
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	_arrows.shuffle()
	sequence = _arrows
	#for a in range(ARROW_QUANTITY):
		#sequence.append(get_arrow())

	for n in arrow_nodes:
		n.visible = false
	

func get_arrow():
	var random_arrow = _arrows[randi() % _arrows.size()]
	return random_arrow

# 0. up certo
# 1. up errado 
# 0. up certo
# 1. down certo 
# 2. left certo
# 3. left errado
var i = 0
func _process(_delta):
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
					arrow_nodes[i].frame = 0
				"down":
					arrow_nodes[i].frame = 1
				"left":
					arrow_nodes[i].frame = 2
				"right":
					arrow_nodes[i].frame = 3
		
		if dir == sequence[i]:
			$Label.got_it()
			$correct_sound.play()
			spoon.play("eat")
			hime_eat.play("open_mouth")
			$Cake.frame = i + 1 

			i += 1
			if i >= ARROW_QUANTITY:
				$win_sound.play()
				register_win()

		elif dir != sequence[i]:
			$Label.try_again()
			$wrong_sound.play()
			
			i = 0
			for n in arrow_nodes:
				n.visible = false


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	Minigames.register_win(self)


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
