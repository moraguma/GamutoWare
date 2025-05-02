extends Area2D

var main: GhostSkullsMain

func _physics_process(delta: float) -> void:
	position.x += 500 * delta

func register_lose():
	print("lose")
	emit_signal("lose")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		register_lose()
		body.queue_free()
