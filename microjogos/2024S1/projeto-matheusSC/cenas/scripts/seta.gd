extends Sprite2D

var possibilidades = ["esquerda", "direita", "cima", "baixo", "acao"] 
var poss_escolhida = "" 

var tipo

@export var act_texture : Texture2D
@export var posicao = 0

var main_scene
var temporiz

func _ready():
	randomize()
	var rand_num = randi()%5
	poss_escolhida = possibilidades[rand_num]
	tipo = poss_escolhida
	
	main_scene = get_parent()
	temporiz = main_scene.get_node("Timer")
	print(main_scene)
	
	if tipo == "esquerda":
		rotation_degrees = -90
	elif tipo == "direita":
		rotation_degrees = 90
	elif tipo == "baixo":
		rotation_degrees = 180
	elif tipo == "cima":
		rotation_degrees = 0
	elif tipo == "acao":
		texture = act_texture
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var apertou_oq = ""
	for poss in possibilidades:
		if Input.is_action_just_pressed(poss):
			apertou_oq = poss
		
	if apertou_oq == tipo and main_scene.current_pos == posicao and main_scene.pode_checkar and not main_scene.perdeu:
		main_scene.current_pos += 1
		main_scene.pode_checkar = false
		temporiz.start(0.1)
		
	elif apertou_oq != tipo and apertou_oq != "" and main_scene.current_pos == posicao and main_scene.pode_checkar:
		main_scene.perdeu = true
		
	
	if main_scene.perdeu:
		scale = Vector2(1.3, 1.3)
	if main_scene.ganhou:
		scale = Vector2(0.2, 0.2)
	pass
