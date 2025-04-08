extends Area2D

@export var action_name: StringName
var tecla = null
var distancia_max = 20 
var momentos = [0.1,0.4,0.7,1.0,1.6,1.9,2.2,2.8,3.1,3.4,3.7]
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(action_name):
		print(action_name)
		if tecla != null:
			var distancia = abs(position.y - tecla.position.y)
			if distancia < distancia_max:
				tecla.queue_free()
			for i in range(0,len(momentos)):
				pass #COLOCAR ALGO
func _on_area_entered(area: Area2D) -> void:
	tecla = area
	pass # Replace with function body.
