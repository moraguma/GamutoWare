extends Sprite2D


var speed = 700
@export var altura_maxima = 600
var caindo = false
var tent = 0
var botao = ""



func _physics_process(delta):
	
	if botao == "1":
		texture = load("res://microjogos/2024S1/projeto-guilherme/recursos/carne.png")
	elif botao == "2":
		texture = load("res://microjogos/2024S1/projeto-guilherme/recursos/alface.png")
	elif botao == "3":
		texture = load("res://microjogos/2024S1/projeto-guilherme/recursos/queijo.png")
	elif botao == "4":
		texture = load("res://microjogos/2024S1/projeto-guilherme/recursos/tomate.png")
	
	if caindo and position.y < (altura_maxima- 40*tent):
		position.y += speed * delta
