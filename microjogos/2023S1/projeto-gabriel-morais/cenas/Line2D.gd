extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_point_position( 1, get_node("../pedra").position)
	if get_node("../pedra").foi_jogado == 1:
		hide()
	else:
		show()
