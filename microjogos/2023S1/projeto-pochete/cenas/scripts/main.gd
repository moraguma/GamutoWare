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

var chosen_apples = []
var won = false
@onready var snake = get_node("Snake")
@onready var head = get_node("Snake/Head")
@onready var final_apple = get_node("Apples/Apple1")

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("EAT!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMA!")
			
	choose_apples()


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


var last_draw_won = 0
var won_i
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if won:
		last_draw_won += delta
		if last_draw_won > 0.07:
			last_draw_won = 0
			if won_i > 0:
				for j in range(won_i - 1):
					head.tail_nodes[j].position = head.tail_nodes[j+1].position
				won_i -= 1
			if won_i == 1:
				head.visible = false
				for j in range(len(head.tail_nodes)):
					head.tail_nodes[j].visible = false


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass

func choose_apples():
	var apples = [0,0]
	while true:
		apples[0] = randi() % 12 + 2
		apples[1] = randi() % 12 + 2
		if (apples[0] != apples[1]
			and ((2 not in apples or 3 not in apples)
				and (8 not in apples or 13 not in apples))):
			break
	for i in apples:
		var apple = get_node('Apples/Apple%d' % i)
		apple.show()
		chosen_apples.append(apple)

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


func _on_head_area_entered(area):
	if area in chosen_apples + [final_apple]:
		$AppleBite.play()
	if area == final_apple:
		var apple_count = [false, false]
		var win = false
		for tail in head.tail_nodes:
			for i in [0, 1]:
				if chosen_apples[i].overlaps_area(tail):
					apple_count[i] = true
					break
			if apple_count == [true, true]:
				win = true
				break
		if win:
			register_win()
			won = true
			won_i = len(head.tail_nodes)
			#head.tail_nodes[-1].position = head.position
			for j in range(won_i - 1):
				head.tail_nodes[j].position = head.tail_nodes[j+1].position
			for apple in chosen_apples + [final_apple]:
				apple.visible = false
