extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var c=0
var lider=self


func _process(_delta):
	var left = Input.is_action_pressed("esquerda")
	var right = Input.is_action_pressed("direita")
	var up = Input.is_action_pressed("cima")
	var down = Input.is_action_pressed("baixo")
	
	if right:
		$Right.visible = true
		$Left.visible = false
		$Down.visible = false
		$Up.visible = false
		$Right.play("default")
		
	elif left:
		$Right.visible = false
		$Left.visible = true
		$Down.visible = false
		$Up.visible = false
		$Left.play("default")
		
	elif up:
		$Right.visible = false
		$Left.visible = false
		$Down.visible = false
		$Up.visible = true
		$Up.play("default")
		
	elif down:
		$Right.visible = false
		$Left.visible = false
		$Down.visible = true
		$Up.visible = false
		$Down.play("default")


func _physics_process(delta):
	
	var directionx = Input.get_axis("esquerda","direita")
	var directiony = Input.get_axis("cima","baixo")
	velocity.y = directiony * SPEED
	velocity.x = directionx * SPEED
	
	move_and_slide()
