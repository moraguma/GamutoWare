extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Pivot.rotation = -global_rotation


func delete() -> void:
	await get_tree().create_timer(0.5).timeout
	queue_free()


func _on_timer_timeout() -> void:
	collision_layer = 1
	collision_mask = 1
