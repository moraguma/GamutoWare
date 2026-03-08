extends Sprite2D

func _input(event: InputEvent) -> void:
	if not get_parent().fail and not get_parent().won and event.is_action_pressed("acao"):
		hide()
		get_parent().win()
		$AudioStreamPlayer.play()
