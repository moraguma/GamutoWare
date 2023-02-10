extends Area2D
var b = ""

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)# Called every time the node is added to the scene.
	# Initialization here
	pass
func _fixed_process(delta):
	b = get_overlapping_bodies()
	for j in range(b.size()):
		if b[j].get_name() == "ceiling" or b[j].get_name() == "platform1" or b[j].get_name() == "platform2":
			get_parent().velocidade.y = 0.1
			pass

