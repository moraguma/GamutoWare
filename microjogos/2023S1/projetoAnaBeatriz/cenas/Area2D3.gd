extends Area2D


var vida = 5

func _physics_process(delta):
	position.y += 1



func _on_body_entered(body):
	body.free()
	queue_free()
	

func _on_area_entered(area):
	vida -= 1
	if vida == 0:
		queue_free()
