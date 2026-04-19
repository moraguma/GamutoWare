extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var caixa = get_node("Caixa")
	caixa.position.y = randf_range(400,800)
	var zumbi = get_node('zumbi do ib')
	zumbi.position.y = randf_range(200,1000)
	var porta = get_node("porta do ib")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
