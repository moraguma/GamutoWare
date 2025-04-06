extends Node2D

const x_inicial = 640
const y_inicial = 295
const movimento = 127
const distancia_max_dado = 5

@export var dados: Array[AnimatedSprite2D]
#@export var poisons: Array[AnimatedSprite2D]

#posições x: 645, 772, 899, 1026, 1153, 1280
#posições y: 300, 427, 554, 681, 808, 935

var dadometro
var pode_mexer = true

func _ready():
	dadometro = get_node("../../dadometro")

func _process(delta: float) -> void:
	if not pode_mexer: return
	posx()
	posy()
	var dado_colidido = false
	for dado in dados:
		if abs(dado.position.x - position.x) <= distancia_max_dado and abs(dado.position.y - position.y) <= distancia_max_dado:
			dado_colidido = true
			dadometro.show()
			
			if Input.is_action_just_pressed("acao"):
				dadometro.play("rolls")
				if dado.frame > 0:
					dado.frame -= 1
				else:
					dados.erase(dado)
					dado.queue_free()
			else:
				if not dadometro.animation == "rolls" or not dadometro.is_playing():
					dadometro.play("static")
					dadometro.frame = dado.frame
	if not dado_colidido:
		dadometro.hide()
		
			
	if len(dados) == 0:
		dadometro.hide()
		get_parent().get_parent().register_win()
		pode_mexer = false


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
