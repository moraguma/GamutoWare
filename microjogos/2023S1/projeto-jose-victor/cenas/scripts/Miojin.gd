extends Area2D


func _on_body_entered(body):
	if body.get_collision_layer_value(1):
		queue_free()
 

