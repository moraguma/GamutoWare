extends Node2D
var a = ""
var b =""
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	b = "Best Score: " +str(global.record)
	a = "Pontuação: " + str(global.playerpont)
	get_node("Label").set_text(a)
	get_node("Record").set_text(b)
	pass
	



func _on_MainMenu_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # replace with function body
