extends Area2D

@export var damage: int = 400
var linear_velocity := Vector2.ZERO

var monster:CollisionObject2D

func _process(delta: float) -> void:
	if not monster:
		return
		
	if monster.has_method("hit"):
		monster.hit(damage * delta)

func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	monster = body
