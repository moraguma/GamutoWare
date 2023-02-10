extends KinematicBody2D

var x = randi()%1200+40 
var y = (randi()%600+60)
var acu = 0
var text=""
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	pass

func _on_Area2D_body_enter( body ):
	if body.get_name() == "Gandhi":
		set_pos(Vector2(x,y))
		randomize()
		x = randi()%1200+40 
		y = (randi()%600+60)
		acu = acu + 1
		text = "Pontuação: " + str(acu)
		print(text)
		#get_node("Label").set_text(text)

		