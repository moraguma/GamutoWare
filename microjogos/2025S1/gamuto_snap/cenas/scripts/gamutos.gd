extends Area2D

@onready var shader : ShaderMaterial = $gamutoSprite.material

# Adiciona a outline quando estiver no foco do jogador
func _on_area_entered(area: Area2D) -> void:
	shader.set_shader_parameter("width", 1.0)
	print("FOUND ME!")
	emit_signal("on_focus")

# Remove a outline depois de sair do foco do jogador
func _on_area_exited(area: Area2D) -> void:
	shader.set_shader_parameter("width", 0.0)
	emit_signal("no_focus")
