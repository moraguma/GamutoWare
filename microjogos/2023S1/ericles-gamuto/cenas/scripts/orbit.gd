extends RigidBody2D
@export var sun: Area2D

@export var angular_speed_self : float
@export var angular_speed_external : float
var radius
var t = 0

func _ready():
	radius = position.distance_to(sun.position)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	t += delta
	position.x = radius * cos(angular_speed_external*t) + sun.position.x
	position.y = radius * sin(angular_speed_external*t) + sun.position.y
	rotation = angular_speed_self * t
