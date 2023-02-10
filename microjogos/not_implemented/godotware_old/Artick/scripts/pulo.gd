extends Area2D
var a = ""
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var velocity = 5.4
var ratio = 1
var jumpSpeed = 15

func _ready():
	set_process(true)# Called every time the node is added to the scene.
	# Initialization here
	pass
func _process(delta):
	a = get_overlapping_bodies()
	for i in range(a.size()):
		if a[i].get_name() == "ground" or a[i].get_name() == "platform1" or a[i].get_name() == "platform2":
			get_parent().velocidade.x = 0
			get_parent().velocidade.y = 0
			if Input.is_key_pressed(KEY_UP) and Input.is_key_pressed(KEY_LEFT):
				get_parent().velocidade.y -= jumpSpeed
				get_parent().velocidade.x = -velocity/2
				pass
			elif Input.is_key_pressed(KEY_UP) and Input.is_key_pressed(KEY_RIGHT):
				get_parent().velocidade.y -= jumpSpeed
				get_parent().velocidade.x = velocity/2
				pass
			elif Input.is_key_pressed(KEY_UP) and (not Input.is_key_pressed(KEY_LEFT) or not Input.is_key_pressed(KEY_RIGHT)):
				get_parent().velocidade.y -= jumpSpeed
				pass
			elif Input.is_key_pressed(KEY_LEFT):
				get_parent().move(Vector2(-1,0)*velocity*ratio)#*get_parent().speed)
				pass
			elif Input.is_key_pressed(KEY_RIGHT):
				get_parent().move(Vector2(1,0)*velocity*ratio)#*get_parent().speed)
				pass
	pass