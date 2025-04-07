extends Node2D

var velocity=Vector2(0, 200)
var angular_velocity=10

func _physics_process(delta):
	position+=velocity*delta
	rotation+=angular_velocity*delta
