extends AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	play("default")
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lista = get_node("../lista")
	
	
	if lista.jogo == "win" and position.y > (300):
		
		play("vitoria")
		position.y -= 3
		
	elif lista.jogo == "lose" and position.y > (300):
		play("derrota")
		position.y -= 3
		
	
	
	
	pass
