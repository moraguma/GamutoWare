extends Area2D

@export var speed: float = 500.0
@export var damage: int = 20
@export var lifetime: float = 5.0

var linear_velocity := Vector2.ZERO


func _physics_process(delta):
	position += linear_velocity * delta

func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit(damage)
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
