extends Node2D
var atual = 1 
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("direita"):
		if atual == 1:
			atual = 2
			get_node("Pocao1/Quadro").hide()
			get_node("Pocao2/Quadro").show()
		elif atual == 3:
			atual = 4
			get_node("Pocao3/Quadro").hide()
			get_node("Pocao4/Quadro").show()
	if Input.is_action_just_pressed("esquerda"):
		if atual == 2:
			atual = 1
			get_node("Pocao2/Quadro").hide()
			get_node("Pocao1/Quadro").show()
		elif atual == 4:
			atual = 3
			get_node("Pocao4/Quadro").hide()
			get_node("Pocao3/Quadro").show()
	if Input.is_action_just_pressed("baixo"):
		if atual == 1:
			atual = 3
			get_node("Pocao1/Quadro").hide()
			get_node("Pocao3/Quadro").show()
		elif atual == 2:
			atual = 4
			get_node("Pocao2/Quadro").hide()
			get_node("pocao4/Quadro").show()
		
