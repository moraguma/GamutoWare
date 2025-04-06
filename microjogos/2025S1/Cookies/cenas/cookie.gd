extends Node2D

var velocity=Vector2(0, 40)

func _physics_process(delta):
	position+=velocity*delta
