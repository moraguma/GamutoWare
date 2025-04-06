extends RigidBody2D

# Deleta Gamuto quando ele estiver longe o suficiente
func _process(_delta) -> void:
	if position.y > 1500:
		queue_free()
