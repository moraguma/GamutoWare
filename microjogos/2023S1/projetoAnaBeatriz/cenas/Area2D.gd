extends Area2D

func _physics_process(delta):
	position.y += 1


func _on_body_entered(body):
	body.free()
	queue_free()


func _on_area_entered(area):
	queue_free()
