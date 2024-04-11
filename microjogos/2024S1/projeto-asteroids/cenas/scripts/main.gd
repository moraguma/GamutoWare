extends Node2D

@export var asteroid_scene: PackedScene
@export var player_scene: PackedScene 

#= preload("res://microjogos/2024S1/projeto-asteroids/cenas/asteroid.tscn")

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
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("SURVIVE!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("SOBREVIVA!")
	
	$Music.play()
	
	game_start()
	
	
	
	
	


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
@warning_ignore("unused_parameter")
func _physics_process(delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
@warning_ignore("unused_parameter")
func _process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func game_start():
	var player = player_scene.instantiate()
	var a = get_node("StartPosition")
	player.position = a.position
	add_child(player)
	pass


# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------
# Quando o jogo começa, ela assume que o jogador não conseguiu vencer o jogo ainda, ou seja, se não
# acontecer nada, o jogador vai perder o jogo. A verificação se o jogador venceu o minigame é feita
# com base na emissão dos sinais "win" e "lose". Se "win" foi o último sinal emitido, o jogador
# vencerá o jogo, e se "lose" foi o último sinal emitido ou nenhu m sinal foi emitido, o jogador
# perderá o jogo


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")


func _on_start_timer_timeout():
	$AsteroidTimer.start()
	pass # Replace with function body.


func _on_asteroid_timer_timeout():
	
	var asteroid = asteroid_scene.instantiate()
	
	var asteroid_spawn = get_node("AsteroidPath/AsteroidSpawn")	
	asteroid_spawn.progress_ratio = randf()
	
	var direction = asteroid_spawn.rotation + PI / 2
	
	asteroid.position = asteroid_spawn.position
	
	direction += randf_range(-PI / 5, PI / 5)
	asteroid.rotation = direction
	
	var velocity = Vector2(randf_range(350.0, 450.0), 0.0)
	asteroid.linear_velocity = velocity.rotated(direction)
	
	add_child(asteroid)
	
	pass # Replace with function body.
 

func _on_win_timer_timeout():
	var a = get_node("Base/Player")
	if a.is_alive:
		register_win()
	else:
		register_lose()
	pass # Replace with function body.
