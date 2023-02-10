extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal perdeu

var has_started = false
var morreu = false

func _ready():
	#get_node("Sprite").set_frame(
	pass
	
func _process(delta):
	if morreu == false:
		for body in get_overlapping_bodies ( ) :
			#print(str('Body entered: ', body.get_groups()))
			if body.is_in_group("Goats"):
				get_node("Sprite").set_frame(5)
				emit_signal("perdeu")
				morreu = true
	pass


