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

func _process(delta):
	position = position + Vector2(0,240.0 * delta)
	

func _on_artigo1_body_enter( body ):
	
	if body.get_name() == "dead_line":
		#perder!!!!!!!!!!!!!!!!!!!!
		position = Vector2(1000, 55959)
		get_parent().lost()
		
	if body.get_name() == "Personagem":
		randomize()
		b = randi() % 560 + 40
		position = Vector2(b, -5)
