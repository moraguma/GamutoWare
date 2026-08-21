extends Area2D

func _on_body_entered(_body: Node2D) -> void: 
	$anim.play("collect")
	$Drink.play()
	collision_mask = 0
	Minigames.register_win(self)

func _on_anim_animation_finished() -> void:
	$anim.visible = false


func _on_drink_finished() -> void:
	queue_free()
