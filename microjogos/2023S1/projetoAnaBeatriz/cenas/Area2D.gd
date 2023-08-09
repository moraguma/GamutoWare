extends Area2D


const SPEED = 200
@export var vida = 1


func _physics_process(delta):
	position.y += SPEED * delta


func _on_body_entered(body):
	body.colidir()


func _on_area_entered(area):
	vida -= 1
	if vida == 0:
		get_parent().delete_enemy()
		queue_free()
		area.queue_free()
