extends Area2D
var a = Vector2(0,0)
var b = 0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	a = get_pos()
	set_pos(a+Vector2(0,240.0 * delta))#*get_parent().ratio)
	

func _on_artigo1_body_enter( body ):
	
	if body.get_name() == "dead_line":
		#perder!!!!!!!!!!!!!!!!!!!!
		set_pos(Vector2(1000, 55959))
		get_parent().lost()
		
	if body.get_name() == "Personagem":
		randomize()
		b = randi() % 560 + 40
		set_pos(Vector2(b, -5))
	
	pass # replace with function body
