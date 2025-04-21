extends Node2D

var velocity=Vector2(0, 200)
var angular_velocity=10

func _physics_process(delta):
	position+=velocity*delta
	rotation+=angular_velocity*delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Monster"):
		queue_free()
