extends Node2D
# thorn https://opengameart.org/content/vine-with-thorns
# teleporter https://opengameart.org/content/teleporter-circle

@export var player_scene: PackedScene
# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	var start_point = Vector2(500,250)
	var start_radius = 75
	# Players
	var num_players = 3
	for player in num_players:
		var player_instance = player_scene.instantiate()
		var player_spawn_point := Vector2(
			randi_range(start_point.x-start_radius,start_point.x+start_radius),
			randi_range(start_point.y-start_radius,start_point.y+start_radius)
		)
		while start_point.distance_to(player_spawn_point) > start_radius:
			player_spawn_point = Vector2(
				randi_range(start_point.x-start_radius,start_point.x+start_radius),
				randi_range(start_point.y-start_radius,start_point.y+start_radius)
			)
		player_instance.position = player_spawn_point
		player_instance.rotation = PI/2
		add_child(player_instance)

# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------
# Quando o jogo começa, ela assume que o jogador não conseguiu vencer o jogo ainda, ou seja, se não
# acontecer nada, o jogador vai perder o jogo. A verificação se o jogador venceu o minigame é feita
# com base na emissão dos sinais "win" e "lose". Se "win" foi o último sinal emitido, o jogador
# vencerá o jogo, e se "lose" foi o último sinal emitido ou nenhum sinal foi emitido, o jogador
# perderá o jogo


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")


func _on_goal_body_entered(body: Node2D) -> void:
	register_win()
