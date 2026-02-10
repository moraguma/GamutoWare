extends Area2D

var distancia_bala = 0

func _physics_process(delta):
	const speed = 1000
	const range = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	distancia_bala += speed * delta
	if distancia_bala > range:
		queue_free()


func _on_body_entered(body : Node2D):
	if body.is_in_group("inimigo"):
		body.hit(1)
	queue_free()
