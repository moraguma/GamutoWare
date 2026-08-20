extends Node2D

var acoes = ["Atacar", "Defender", "Conversar", 'Item']

func _process(delta: float) -> void:
	var cor = get_parent().i
	
	for n in 4:
		if n == cor:
			get_node(acoes[cor]).modulate = Color(1,0,0)
		else:
			get_node(acoes[n]).modulate = Color(1,1,1)
