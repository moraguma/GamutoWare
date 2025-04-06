extends Area2D

@onready var shader : ShaderMaterial = $gamutoSprite.material

# Adiciona a outline quando estiver no foco do jogador
func _on_area_entered(area: Area2D) -> void:
	shader.set_shader_parameter("width", 1.0)
	print("FOUND ME!")

# Remove a outline depois de sair do foco do jogador
func _on_area_exited(area: Area2D) -> void:
	shader.set_shader_parameter("width", 0.0)

func _on_player_killed_gamuto(gamuto: int) -> void:
	match gamuto:
		1:
			print("YOU KILLED 1!")
		2:
			print("YOU KILLED 2!")
		3:
			print("YOU KILLED 3!")
