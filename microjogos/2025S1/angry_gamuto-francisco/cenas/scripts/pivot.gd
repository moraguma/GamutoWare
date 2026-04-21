extends RigidBody2D

func _ready() -> void:
	pass

func _physics_process(delta):
	if rotation >= PI/2 || rotation < 0:
		angular_velocity *= -1
