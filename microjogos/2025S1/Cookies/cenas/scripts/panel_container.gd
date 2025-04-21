extends PanelContainer

@export var main: Node2D
@export var price: int = 0

func _process(delta: float) -> void:
	if main.cliques < price:
		material.set("shader_parameter/Disabled", true)
	else:
		material.set("shader_parameter/Disabled", false)
