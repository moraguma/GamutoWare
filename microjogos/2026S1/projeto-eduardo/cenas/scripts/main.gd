extends Node2D
func _ready() -> void:
	var caixa = get_node("Caixa")
	caixa.position.y = randf_range(400,800)
	var zumbi = get_node('zumbi do ib')
	zumbi.position.y = randf_range(200,1000)
	var musica = get_node("musica_background")
	musica.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
