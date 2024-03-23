extends CharacterBody2D

var velocidade = 0.055
var giro = 0

var linguada
var lingua
var timer

var mosca

func _ready():
	linguada = $Sapo/Linguada
	lingua = $Sapo/Linguada/LinguaSprite
	mosca = $"../Mosca"

func _physics_process(delta):
	rotate(giro)
	var direction = Input.get_axis("esquerda", "direita")
	if direction:
		giro = direction * velocidade
	else:
		giro = 0
