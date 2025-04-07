extends RigidBody2D

# Deleta Gamuto quando ele estiver longe o suficiente
func _physics_process(_delta) -> void:
	if position.y > 1500:
		queue_free()
