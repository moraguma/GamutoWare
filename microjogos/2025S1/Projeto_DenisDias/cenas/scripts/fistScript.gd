extends Node2D


var d := 0.0
var radius := 75
var speed := 8.0

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("acao"):
		d += delta
		position = Vector2( radius, (sin(d * speed)/ 2) * (radius * 2) )
	
	
