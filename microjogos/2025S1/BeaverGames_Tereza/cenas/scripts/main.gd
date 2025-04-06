extends Node2D
@onready var _animated_sprite = $Beaver/AnimationPlayer
@onready var Bola = $Gamutobola/AnimationPlayer
@onready var Introduction = $Introduction/IndroductionA
@export var speed = 400
var timer
var sentido
var rng = RandomNumberGenerator.new()

var x_range = range(0, 1627)
var y_range = range(661, 811)

var velocity = Vector2(0, 0)

func get_input():
	var input_direction = Input.get_vector("esquerda","direita","cima","baixo")
	velocity = input_direction * speed
	
func _input(event):
	if event.is_action_pressed("goto.butt"):
		$Introduction.visible = not $Introduction.visible
	
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

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	sentido = rng.randi() % 2
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	timer = get_node("Timer")
	timer.start(6)
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("HIT THE BALL!!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("REBATA A BOLA!")

	var Beaver = get_node("Beaver")
	Bola.play("Pular")
	Introduction.play("Sair")
	
		
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	var Beaver = get_node("Beaver")
	get_input()
	Beaver.position += velocity * delta
	
	#if int(Beaver.position[0]) in range(304, 1627) and int(Beaver.position[1]) in range(661,811):
	#eaver.position += velocity * delta
#Beaver.position.x = clamp(Beaver.position.x, x_range[0], x_range[-1])
#Beaver.position.y = clamp(Beaver.position.y, y_range[0], y_range[-1])
	#else:
		#velocity = 0
	
	var velocity2 = Vector2(200,0)
	if sentido == 0:
		$Gamutobola/Bola.position += velocity2 * delta
	else:
		$Gamutobola/Bola.position -= velocity2 * delta
	
	


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if Input.is_action_pressed("direita"):
		_animated_sprite.play("Right")
	elif Input.is_action_pressed("esquerda"):
		_animated_sprite.play("Left")
	else:
		_animated_sprite.play("Static")
		


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


func _on_beaver_area_entered(area: Area2D): #-> void:
	Bola.play("Rebater")
	register_win()
	
	 # Replace with function body.
