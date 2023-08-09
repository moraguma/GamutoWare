extends Area2D


const MAX_TIME = 2


var time = 0


func _physics_process(delta):
	position.y -= 500 * delta
	
	time += delta
	if time >= MAX_TIME:
		queue_free()


func _on_area_entered(area):
	queue_free()
