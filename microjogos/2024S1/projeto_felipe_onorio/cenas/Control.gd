extends Control

signal xxxx()
signal left_pressed()
signal right_pressed()
signal up_pressed()
signal down_pressed()
signal space_pressed()
signal quit_pressed()

func _ready():
	pass
	
func _input(event):
	if Input.is_action_pressed("esquerda"):
		left_pressed.emit()
		return
	if Input.is_action_pressed("direita"):
		right_pressed.emit()
		return
	if Input.is_action_pressed("baixo"):
		down_pressed.emit()
		return
	if Input.is_action_pressed("cima"):
		up_pressed.emit()
		return
	if Input.is_action_pressed("acao"):
		space_pressed.emit()
		return
	if Input.is_action_pressed("quit"):
		quit_pressed.emit()
		return
	pass

func _process(_delta):
	pass

