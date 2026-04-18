extends Node2D

var rng = RandomNumberGenerator.new()

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	
	var x_range = 100
	var y_range = 200
	
	$Bat.position.x   += rng.randf_range(-x_range, x_range)
	$Bat2.position.x  += rng.randf_range(-x_range, x_range)
	
	$Bat.position.y  += rng.randf_range(-y_range, y_range)
	$Bat2.position.y  += rng.randf_range(-y_range, y_range)
