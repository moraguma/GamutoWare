extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pronto = false
var click = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
	
func _process(delta):
	var position = get_node(".").get_global_pos()
	if get_global_mouse_pos().y >= 200:
		position.y = 200
		if pronto:
			click += 1
		pronto = false
	elif get_global_mouse_pos().y <= 100:
		position.y = 100
		pronto = true
	else:
		position.y = get_global_mouse_pos().y
	get_node(".").set_global_pos(position)
			
