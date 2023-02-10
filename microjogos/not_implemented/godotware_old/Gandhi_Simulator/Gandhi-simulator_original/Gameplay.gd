extends Node2D
var pont = 0
var text = ''
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	global.playerpont = 0
	pass
	
	


func _on_Area2D_body_enter( body ):
	if body.get_name() == "Gandhi":
		pont = pont + 1
		if pont == 12:
			randomize()
			get_node("Churchill").set_pos(Vector2(randi()%1100+90, randi()%600+60))
		text = "Seguidores: " + str(pont)
		get_node("Label").set_text(text)
		global.playerpont = pont
	pass # replace with function body