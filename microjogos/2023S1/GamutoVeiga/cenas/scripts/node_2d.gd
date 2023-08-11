extends Node2D

var gamuto
var copo_1
var pos_almejada_1 = Vector2(750, 554.932)
var copo_2
var pos_almejada_2 = Vector2(1000, 554.932)
var copo_3
var pos_almejada_3 = Vector2(1250, 554.932)
var tempo = 0
var list = [Vector2(750, 554.932), Vector2(1000, 554.932),Vector2(1250, 554.932)]
var i = 0
var timer: Timer
var escolha_flag = false
var ja_escolheu = false


func _ready():
	copo_1 = $Copo1
	copo_2 = $Copo2
	copo_3 = $Copo3
	gamuto = $Personagem
	timer = $Timer
	
	timer.connect("timeout", subir)
	timer.set_wait_time(0.5)
	timer.one_shot = true
	timer.start()

func _process(delta):
	if (not escolha_flag) or ja_escolheu:
		return
		
	if Input.is_action_pressed("esquerda"):
		ja_escolheu = true
		apenas_subir()
		if round(copo_2.position.x) == 750:
			print("VENCEU")
		else:
			print("PERDEU")
	elif Input.is_action_pressed("cima"):
		ja_escolheu = true
		apenas_subir()
		if round(copo_2.position.x) == 1000:
			print("VENCEU")
		else:
			print("PERDEU")
	elif Input.is_action_pressed("direita"):
		ja_escolheu = true
		apenas_subir()
		if round(copo_2.position.x) == 1250:
			print("VENCEU")
		else:
			print("PERDEU")
			
func apenas_subir():
	copo_1.subir()
	copo_2.subir()
	copo_3.subir()
	
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
	randomize()
	list.shuffle()
	copo_1.mover_para(list[0])
	copo_2.mover_para(list[1])
	copo_3.mover_para(list[2])
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
