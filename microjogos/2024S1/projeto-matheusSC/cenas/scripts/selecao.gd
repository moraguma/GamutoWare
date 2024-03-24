extends Sprite2D

var setas = []
var main_scene

func _ready():
	main_scene = get_parent()
	for i in range(4):
		setas.append(main_scene.get_node("seta" + str(i)))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if main_scene.current_pos < len(setas):
		position = setas[main_scene.current_pos].position
	else :
		main_scene.ganhou = true
	pass
