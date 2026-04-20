extends StaticBody2D

@export var can_open := false

var player_in_range := false

func _process(delta: float) -> void:
	if get_parent().get_parent().get_node("Player").position.y > position.y:
		z_index = 0
	else:
		z_index = 2
	if can_open and player_in_range and Input.is_action_just_pressed("acao"):
		$AnimatedSprite2D.play("open")
		collision_layer = 2
		$Open.play()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and can_open:
		player_in_range = true
		$Label.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player" and can_open:
		player_in_range = false
		$Label.visible = false
		$AnimatedSprite2D.play("default")
		collision_layer = 1
