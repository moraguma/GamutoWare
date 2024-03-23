extends Control


signal xxxx()
signal left_pressed()
signal right_pressed()
signal up_pressed()
signal down_pressed()
signal space_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if event.is_action_pressed("esquerda"):
		print("esquerda handled")
		left_pressed.emit()
	if event.is_action_pressed("direita"):
		print("direita handled")
		right_pressed.emit()
	if event.is_action_pressed("baixo"):
		print("baixo handled")
		down_pressed.emit()
	if event.is_action_pressed("cima"):
		print("cima handled")
		up_pressed.emit()
	if event.is_action_pressed("acao"):
		print("acao handled")
		space_pressed.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

