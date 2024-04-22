extends Sprite2D

var possibilidades = ["esquerda", "direita", "baixo"] 
var cima = "cima"
var inputs
var poss_escolhida = "" 

var tipo

@export var posicao = 0

var main_scene
var temporiz
var anim

func _ready():
	inputs = possibilidades.duplicate()
	inputs.append(cima)
	
	randomize()
	var rand_num = randi()%len(possibilidades)
	poss_escolhida = possibilidades[rand_num]
	tipo = poss_escolhida
	
	if posicao == 3:
		tipo = cima
	
	main_scene = get_parent()
	temporiz = main_scene.get_node("Timer")
	anim = main_scene.get_node("character").get_node("animador")
	
	if tipo == "esquerda":
		rotation_degrees = -90
	elif tipo == "direita":
		rotation_degrees = 90
	elif tipo == "baixo":
		rotation_degrees = 180
	elif tipo == "cima":
		rotation_degrees = 0
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var apertou_oq = ""
	for inp in inputs:
		if Input.is_action_just_pressed(inp):
			apertou_oq = inp
		
		#apertou certo
	if apertou_oq == tipo and main_scene.current_pos == posicao and main_scene.pode_checkar and not main_scene.perdeu:
		$"../Right".play()
		anim.stop()
		anim.play("bounce")
		main_scene.current_pos += 1
		main_scene.pode_checkar = false
		temporiz.start(0.1)
		main_scene.current_pressed = tipo
		
		#apertou errado
	elif apertou_oq != tipo and apertou_oq != "" and main_scene.current_pos == posicao and main_scene.pode_checkar:
		if not main_scene.perdeu:
			anim.stop()
			anim.play("bounce")
		main_scene.perdeu = true
	
	pass
