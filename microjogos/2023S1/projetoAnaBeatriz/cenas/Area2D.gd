extends Area2D


const SPEED = 200
@export var vida = 1


func _physics_process(delta):
	position.y += SPEED * delta


func _on_body_entered(body):
	body.free()
	queue_free()


func _on_area_entered(area):
	queue_free()
