extends Area2D

func _on_body_entered(body: Node2D) -> void: 
	$anim.play("collect")
	$Drink.play()
	collision_mask = 0
	get_parent().register_win()

func _on_anim_animation_finished() -> void:
	$anim.visible = false


func _on_drink_finished() -> void:
	queue_free()
