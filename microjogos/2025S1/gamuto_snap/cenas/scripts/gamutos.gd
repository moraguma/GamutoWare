extends Area2D

@onready var shader : ShaderMaterial = $gamutoSprite.material

# Adiciona a outline quando estiver no foco do jogador
func _on_area_entered(area: Area2D) -> void:
	shader.set_shader_parameter("width", 1.0)
	print("FOUND ME!")

# Remove a outline depois de sair do foco do jogador
func _on_area_exited(area: Area2D) -> void:
	shader.set_shader_parameter("width", 0.0)

# Sinal emitido pelo player que dá qual gamuto foi atingido 
func _on_player_snapped_gamuto(gamuto: int) -> void:
		match gamuto:
			1:
				print("YOU SNAPPED 1!")
			2:
				print("YOU SNAPPED 2!")
			3:
				print("YOU SNAPPED 3!")

func _on_main_selected_spawn(marker: Marker2D) -> void:
	pass # Replace with function body.
