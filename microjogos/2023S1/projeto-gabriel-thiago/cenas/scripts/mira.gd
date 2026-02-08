extends Sprite2D

@export var speed = 500;
var lock_in = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not lock_in:
		if Input.is_action_pressed("direita"):
			position.x += 1*speed*delta
		if Input.is_action_pressed("esquerda"):
			position.x += -1*speed*delta
		if Input.is_action_pressed("cima"):
			position.y += -1*speed*delta
		if Input.is_action_pressed("baixo"):
			position.y += 1*speed*delta
		if Input.is_action_pressed("acao"):
			lock_in = true
