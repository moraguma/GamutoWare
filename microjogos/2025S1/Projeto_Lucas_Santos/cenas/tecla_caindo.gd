extends Area2D
@export var action_name: StringName
var velo_queda: float = 250

func _process(delta: float) -> void:
	position.y += velo_queda * delta
 
