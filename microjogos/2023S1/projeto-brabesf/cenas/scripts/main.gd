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
const WIDTH_PANNELS = 4
const HEIGHT_PANNELS = 3

var blank_state = preload("res://microjogos/2023S1/projeto-brabesf/recursos/sprites/Cards.png")
var maca_sprite = preload("res://microjogos/2023S1/projeto-brabesf/recursos/sprites/maca.png")
var banana_sprite = preload("res://microjogos/2023S1/projeto-brabesf/recursos/sprites/banana.png")
var uva_sprite = preload("res://microjogos/2023S1/projeto-brabesf/recursos/sprites/grapes.png")
var laranja_sprite = preload("res://microjogos/2023S1/projeto-brabesf/recursos/sprites/orange.png")
var melancia_sprite = preload("res://microjogos/2023S1/projeto-brabesf/recursos/sprites/melancia.png")


var fruit_to_int = {"MAÇÃ": 0, "BANANA":1, "UVA":2, "LARANJA":3, "MELANCIA":4}
var int_to_fruit = {0:"MAÇÃ", 1:"BANANA", 2:"UVA", 3:"LARANJA", 4:"MELANCIA"}
var int_to_sprite = {0:maca_sprite, 1:banana_sprite, 2:uva_sprite, 3:laranja_sprite, 4:melancia_sprite}
var int_to_scale = {0:Vector2(0.15, 0.13), 1:Vector2(0.175, 0.175), 2:Vector2(0.15, 0.13), 3:Vector2(0.33, 0.33), 4:Vector2(0.33, 0.33)}

var fruit_true = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

var tempo = 0

var gamuto_position = 0
var label_to_position = {0:Vector2(300, 300), 1:Vector2(735, 300), 2:Vector2(1175, 300), 3:Vector2(1600, 300), 4:Vector2(300, 550), 5:Vector2(735, 550), 6:Vector2(1175, 550), 7:Vector2(1600, 550), 8:Vector2(300, 850), 9:Vector2(735, 850), 10:Vector2(1175, 850), 11:Vector2(1600, 850)}
var chosen_fruit = randi_range (0, 3)
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("MEMORIZE THE FRUITS!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("MEMORIZE AS FRUTAS!")
		
	
	var fruit_list = [0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3]
	var fruit_random = get_randomized_list(fruit_list)
	
	print(fruit_random)
	fruit_true = fruit_random
	mostrar_frutas()
		
	var gamuto = get_node("Player")
	gamuto.set_position(Vector2(100, 100))
	
	var song = get_node("AudioStreamPlayer")
	song.play()
	
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if(tempo != 0):
		if Input.is_action_just_pressed('direita'):
			#Verificar se pode
			if(pode_mover('direita')):
				gamuto_position += 1
		elif Input.is_action_just_pressed('esquerda'):
			#Verificar se pode
			if(pode_mover('esquerda')):
				gamuto_position -= 1
		elif Input.is_action_just_pressed('cima'):
			#Verificar se pode
			if(pode_mover('cima')):
				gamuto_position -= WIDTH_PANNELS
		elif Input.is_action_just_pressed('baixo'):
			#Verificar se pode
			if(pode_mover('baixo')):
				gamuto_position += WIDTH_PANNELS
		draw_gamuto()
		#Mova bichinho




# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func get_randomized_list(list):
	var randomized = []
	var randomized_list = []
	var i = 0
	while i < len(list):
		var key = randi_range (0, len(list) - 1)
		if key not in randomized:
			i += 1
			randomized.append(key)
	for j in range(len(randomized)):
		randomized_list.append(list[randomized[j]])
	
	return randomized_list
 


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func pode_mover(movimento):
	if movimento == 'cima':
		if gamuto_position<4:
			return false
		else:
			return true
	elif movimento == 'baixo':
		if gamuto_position>7:
			return false
		else:
			return true
	elif movimento == 'direita':
		if gamuto_position%WIDTH_PANNELS == 3:
			return false
		else:
			return true
	elif movimento == 'esquerda':
		if gamuto_position%WIDTH_PANNELS == 0:
			return false
		else:
			return true
	return false


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
	mostrar_frutas()
	emit_signal("win")

func mostrar_frutas():
	var im11 = get_node("Card11/fruit2D")
	var im12 = get_node("Card12/fruit2D")
	var im13 = get_node("Card13/fruit2D")
	var im14 = get_node("Card14/fruit2D")
	var im21 = get_node("Card21/fruit2D")
	var im22 = get_node("Card22/fruit2D")
	var im23 = get_node("Card23/fruit2D")
	var im24 = get_node("Card24/fruit2D")
	var im31 = get_node("Card31/fruit2D")
	var im32 = get_node("Card32/fruit2D")
	var im33 = get_node("Card33/fruit2D")
	var im34 = get_node("Card34/fruit2D")
	var im_list = [im11, im12, im13, im14, im21, im22, im23, im24, im31, im32, im33, im34]
	for i in range(len(im_list)):
		im_list[i].texture = int_to_sprite[fruit_true[i]]
		im_list[i].set_scale(int_to_scale[fruit_true[i]])
	
# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	mostrar_frutas()
	emit_signal("lose")

func draw_gamuto():
	var gamuto = get_node("Player")
	gamuto.set_position(label_to_position[gamuto_position])

func _on_timer_timeout():
	if(tempo == 0):
		var im11 = get_node("Card11/fruit2D")
		var im12 = get_node("Card12/fruit2D")
		var im13 = get_node("Card13/fruit2D")
		var im14 = get_node("Card14/fruit2D")
		var im21 = get_node("Card21/fruit2D")
		var im22 = get_node("Card22/fruit2D")
		var im23 = get_node("Card23/fruit2D")
		var im24 = get_node("Card24/fruit2D")
		var im31 = get_node("Card31/fruit2D")
		var im32 = get_node("Card32/fruit2D")
		var im33 = get_node("Card33/fruit2D")
		var im34 = get_node("Card34/fruit2D")
		var im_list = [im11, im12, im13, im14, im21, im22, im23, im24, im31, im32, im33, im34]
		
		for im in im_list:
			im.texture = blank_state
			
		NotificationCenter.notify("GAMUTO QUER " + str(int_to_fruit[chosen_fruit]) + "!!!")
		
		var song = get_node("AudioStreamPlayer")
		
		var timer = get_node("Timer")
		timer.one_shot = true
		timer.start(2.9)
		tempo += 1
		song.stop()
	else:
		#lógica de game-end
		
		if(chosen_fruit == fruit_true[gamuto_position]):
			register_win()
		else:
			register_lose()

