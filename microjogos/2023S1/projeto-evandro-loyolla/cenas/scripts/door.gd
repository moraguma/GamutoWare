extends StaticBody2D

var player_in_range := false

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("acao"):
		$AnimatedSprite2D.play("open")
		collision_layer = 2
		$AudioStreamPlayer.play()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true
		$Label.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = false
		$Label.visible = false
		$AnimatedSprite2D.play("default")
		collision_layer = 1
