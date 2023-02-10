extends KinematicBody2D
var velocidade = Vector2(0,0)
var gravidade = 1
var pos = 0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 100

func _ready():
	set_process(true)
	pass
func _process(delta):
	velocidade.y = velocidade.y + gravidade
	pos = get_pos().y
	move(velocidade*delta*speed)
	#if Input.is_key_pressed(KEY_LEFT):
	#	move(Vector2(-4,0))
	#	pass
	#if Input.is_key_pressed(KEY_RIGHT):
	#	move(Vector2(4,0))
	pass