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

const Card = preload("res://microjogos/2024S1/projeto-andre/cenas/scripts/card.gd")

@onready var b1 = $B1
@onready var b2 = $B2
@onready var b3 = $B3
@onready var PLAYER = $P
@onready var VIRA = $VIRA

var path = "res://microjogos/2024S1/projeto-andre/recursos/deck/@$.png"

var venceu = false
var chose = false
var winner
var draw_cards
var player_card

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("<- STAND OR PASS! ->")
			$RichTextLabel.text = "I'LL WIN! = ←\nI'LL LOSE! = →"
		Global.LANGUAGE.PT:
			NotificationCenter.notify("<- FAÇA OU PASSA! ->")
			$RichTextLabel.text = "FAÇO! = ←\nPASSO! = →"
	
	$Fan.play()
	for item: CanvasItem in [b1, b2, b3, PLAYER]:
		item.material.set_shader_parameter("mode", 0)
	
	var all = all_cards()
	
	var c1 = pick_random_and_remove(all)
	var c2 = pick_random_and_remove(all)
	var c3 = pick_random_and_remove(all)
	player_card = pick_random_and_remove(all)
	
	var card_dit = {c1: b1, c2: b2, c3: b3, player_card: PLAYER}
	
	b1.texture = get_texture(c1)
	b2.texture = get_texture(c2)
	b3.texture = get_texture(c3)
	
	var vira: Card = pick_random_and_remove(all)
	var index = vira.val_order.find(vira.value) + 1
	if index == len(vira.val_order):
		index = 0
	var vMan = vira.val_order[index]
	
	VIRA.texture = get_texture(vira)
	
	var a = player_card.cmp(c1, vMan)
	var b = player_card.cmp(c2, vMan)
	var c = player_card.cmp(c3, vMan)
	var d = c1.cmp(c2, vMan)
	var e = c1.cmp(c3, vMan)
	var f = c2.cmp(c3, vMan)
	
	var possible_winners = [player_card, c1, c2, c3]

	if a == 0:
		possible_winners = [c2, c3]
		
	if b == 0:
		possible_winners = [c1, c3]
		
	if c == 0:
		possible_winners = [c1, c2]
		
	if d == 0:
		possible_winners = [player_card, c3]
		
	if e == 0:
		possible_winners = [player_card, c2]
		
	if f == 0:
		possible_winners = [player_card, c1]
		
	draw_cards = [player_card, c1, c2, c3].filter(func(c): return not possible_winners.has(c))
	draw_cards = draw_cards.map(func(c): return card_dit[c])
	
	winner = possible_winners[0]
	for w in possible_winners:
		if w != winner and w.cmp(winner, vMan) > 0:
			winner = w
		
	if winner == player_card:
		venceu = true
		
	winner = card_dit[winner]
	
	print(venceu)

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if not chose:
		if Input.is_action_just_pressed("esquerda"):
			choice_made(true)
		
		if Input.is_action_just_pressed("direita"):
			choice_made(false)

# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------

func all_cards():
	var all = []
	for v in Card.new().val_order:
		for s in Card.new().suit_order:
			all.append(Card.new(v, s))
	return all

func get_texture(card: Card):
	return load(path.replace('@', card.value).replace('$', card.suit))
	
func pick_random_and_remove(array: Array):
	var c = array.pick_random()
	array.remove_at(array.find(c))
	return c

# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------
# Quando o jogo começa, ela assume que o jogador não conseguiu vencer o jogo ainda, ou seja, se não
# acontecer nada, o jogador vai perder o jogo. A verificação se o jogador venceu o minigame é feita
# com base na emissão dos sinais "win" e "lose". Se "win" foi o último sinal emitido, o jogador
# vencerá o jogo, e se "lose" foi o último sinal emitido ou nenhum sinal foi emitido, o jogador
# perderá o jogo

func choice_made(make: bool):
	$Flip.play()
	
	chose = true
	PLAYER.texture = get_texture(player_card)
	
	winner.material.set_shader_parameter("shine_color", Color("#ff00ffc8"))
	winner.material.set_shader_parameter("mode", 1)
	for m in draw_cards:
		m.material.set_shader_parameter("mode", 2)
		m.material.set_shader_parameter("shine_color", Color(0.5, 0.5, 0.5, 0.8))
	
	if make == venceu:
		register_win()
	else:
		register_lose()

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	print("VENCEU")
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	print("PERDEU")
	emit_signal("lose")
