extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
var c=0
var lider=self


func _process(_delta):
	var left = Input.is_action_pressed("esquerda")
	var right = Input.is_action_pressed("direita")
	var up = Input.is_action_pressed("cima")
	var down = Input.is_action_pressed("baixo")
	
	if right:
		$nadar.play("direita")
		
	elif left:
		$nadar.play("esquerda")
		
	elif up:
		$nadar.play("cima")
		
	elif down:
		$nadar.play("baixo")


func _physics_process(delta):
	
	var directionx = Input.get_axis("ui_left","ui_right")
	var directiony = Input.get_axis("ui_up","ui_down")
	velocity.y = directiony * SPEED
	velocity.x = directionx * SPEED
	#velocity.y = move_toward(velocity.y, 0, SPEED)
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func coletar(body):
	$quack.play()
	c=c+1
	if c>=5:
		get_parent().register_win() # Volta para o Node principal e chama a funcao register_win enviando o sinal para o GamutoWare
	return c
	


