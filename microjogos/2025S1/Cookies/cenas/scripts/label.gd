extends Label
@export var main: Node2D

func _process(delta: float) -> void:
	text = str(main.cliques)
