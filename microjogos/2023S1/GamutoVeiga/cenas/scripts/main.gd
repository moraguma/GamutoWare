extends Node2D

var gamuto
var copo_1
var copo_2
var copo_3
var list = [Vector2(750, 554.932), Vector2(1000, 554.932), Vector2(1250, 554.932)]
var i = 0
var timer: Timer
var escolha_flag = false
var ja_escolheu = false
var efeito_swap
var efeito_ganhou
var efeito_perdeu


# Declaração dos sinais win e lose
signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

const TOLERANCE = 20


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("Find Gamuto!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("Ache o Gamuto!")
	
	copo_1 = $Copo1
	copo_2 = $Copo2
	copo_3 = $Copo3
	gamuto = $Personagem
	timer = $Timer
	efeito_swap = $Efeito_Swap
	efeito_ganhou = $Efeito_Ganhou
	efeito_perdeu = $Efeito_Perdeu
	
	
	timer.connect("timeout", subir)
	timer.set_wait_time(1.1)
	timer.one_shot = true
	timer.start()

func _process(delta):
		
	if (not escolha_flag) or ja_escolheu:
		return
		
	if Input.is_action_pressed("esquerda"):
		ja_escolheu = true
		subir_escolhido(750)
		resultado(750)
			
	elif Input.is_action_pressed("cima"):
		ja_escolheu = true
		subir_escolhido(1000)
		resultado(1000)
			
	elif Input.is_action_pressed("direita"):
		ja_escolheu = true
		subir_escolhido(1250)
		resultado(1250)
					
func subir_escolhido(x):
	if abs(copo_1.position.x - x) < TOLERANCE:
		copo_1.subir()
	elif abs(copo_2.position.x - x) < TOLERANCE:
		copo_2.subir()
	elif abs(copo_3.position.x - x) < TOLERANCE:
		copo_3.subir()

func resultado(x):
	if abs(copo_2.position.x - x) < TOLERANCE:
		print("VENCEU")
		efeito_ganhou.play()
		register_win()
	else:
		print("PERDEU")
		timer.disconnect("timeout", mostrar)
		timer.connect("timeout", subir_copo_certo)
		timer.set_wait_time(0.5)
		timer.one_shot = true
		timer.start()
		efeito_perdeu.play()
		register_lose()

func subir_copo_certo():
	copo_2.subir()
		
func subir():
	copo_1.subir()
	copo_2.subir()
	copo_3.subir()
	
	timer.disconnect("timeout", subir)
	timer.connect("timeout", descer)
	timer.set_wait_time(0.5)
	timer.one_shot = true
	timer.start()
	
func descer():
	copo_1.descer()
	copo_2.descer()
	copo_3.descer()
	
	timer.disconnect("timeout", descer)
	timer.connect("timeout", esconder)
	timer.set_wait_time(0.35)
	timer.one_shot = true
	timer.start()

func esconder():
	gamuto.hide()
	timer.disconnect("timeout", esconder)
	timer.connect("timeout", troca)
	timer.set_wait_time(0.5)
	timer.one_shot = false
	timer.start()
	
func troca():
	var l = [list[0], list[1]]
	randomize()
	list.shuffle()
	
	if list[0] == l[0] and list[1] == l[1]:
		list.shuffle()
	
	if list[0] == l[0] and list[1] == l[1]:
		list = [list[1], list[0], list[2]]
	
	copo_1.mover_para(list[0])
	copo_2.mover_para(list[1])
	copo_3.mover_para(list[2])
	efeito_swap.play()
	i = i + 1
	if i == 4:
		timer.disconnect("timeout", troca)
		timer.connect("timeout", mostrar)
		timer.set_wait_time(1)
		timer.one_shot = true
		timer.start()
		

func mostrar():
	gamuto.position = Vector2(copo_2.position.x, 592)
	gamuto.show()
	escolha_flag = true

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")

# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
