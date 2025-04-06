extends Node2D

const x_inicial = 640
const y_inicial = 295
const movimento = 127
const distancia_max_dado = 5

@export var dados: Array[AnimatedSprite2D]
#@export var poisons: Array[AnimatedSprite2D]

#posições x: 645, 772, 899, 1026, 1153, 1280
#posições y: 300, 427, 554, 681, 808, 935

var dadocount = len(dados)

func _process(delta: float) -> void:
	posx()
	posy()
	for dado in dados:
		if abs(dado.position.x - position.x) <= distancia_max_dado and abs(dado.position.y - position.y) <= distancia_max_dado:
			if Input.is_action_just_pressed("acao"):
				if dado.frame > 0:
					dado.frame -= 1
				else:
					dados.erase(dado)
					dado.queue_free()
#	for poison in poisons:
#		if abs(poison.position.x - position.x) <= distancia_max_dado and abs(poison.position.y - position.y) <= distancia_max_dado:
#			emit_signal("lose")
#			poisons.erase(poison)
#			poison.queue_free()
#	if not dadocount:
#		emit_signal("win")

func posx():
	if Input.is_action_just_pressed("direita") and position.x < 1280:
		position.x += movimento
	if Input.is_action_just_pressed("esquerda") and position.x > 645:
		position.x -= movimento

func posy():
	if Input.is_action_just_pressed("baixo") and position.y < 935:
		position.y += movimento
	if Input.is_action_just_pressed("cima") and position.y > 300:
		position.y -= movimento


#3 dados (quaisquer posições), 2 espinhos (quaisquer-bordas) e 1 posição inicial
