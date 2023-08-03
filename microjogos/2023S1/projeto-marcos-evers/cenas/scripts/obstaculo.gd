extends Area2D

@export var SPEED = 300
var _angular_speed

func _ready():
	_angular_speed = randf_range(-PI / 2, PI / 2)

func _physics_process(delta):
	position.x -= SPEED * delta
	rotate(_angular_speed * delta)
	
	if position.x < 0:
		queue_free()
