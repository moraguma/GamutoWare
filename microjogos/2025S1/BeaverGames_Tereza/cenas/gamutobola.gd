extends Area2D

@onready var initial_radius = $CollisionShape2D.shape.radius

func _process(delta: float) -> void:
	$CollisionShape2D.position = $Bola.position
	$CollisionShape2D.shape.radius = $Bola.scale.x * initial_radius
