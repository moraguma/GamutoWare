extends Area2D

func _physics_process(delta):
	position.y -= 500 * delta


func _on_area_entered(area):
	queue_free()
