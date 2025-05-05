extends Area2D

@onready var shader : ShaderMaterial = $gamutoAreaSprite.material

# Adiciona a outline quando estiver no foco do jogador
func _on_area_entered(_area: Area2D) -> void:
	shader.set_shader_parameter("width", 10.0)
	print("FOUND ME!")

# Remove a outline depois de sair do foco do jogador
func _on_area_exited(_area: Area2D) -> void:
	shader.set_shader_parameter("width", 0.0)
