extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
var c=0
var lider=self



func _physics_process(delta):
	

	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		var direita = get_node("direitaP")
		direita.play()
		velocity.x = directionx * SPEED
	else:
		var esquerda = get_node("esquerdaP")
		esquerda.play()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		var cima = get_node("cimaP")
		cima.play()
		velocity.y = directiony * SPEED
	else:
		var baixo = get_node("baixoP")
		baixo.play()
		velocity.y = move_toward(velocity.y, 0, SPEED)
		

	move_and_slide()

func coletar(body):
	
	c=c+1
	return c
