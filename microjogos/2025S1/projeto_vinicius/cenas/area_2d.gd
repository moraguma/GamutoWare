extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var styleBox: StyleBoxFlat = $ColorRect.get_theme_stylebox("panel")
	styleBox.set("bg_color", Color(88, 155, 0))

	#$ColorRect.color = Color(88, 155, 0)
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	var styleBox: StyleBoxFlat = $ColorRect.get_theme_stylebox("panel")
	styleBox.set("bg_color", Color(88, 155, 255))
	#$ColorRect.color = Color(88, 155, 255)
