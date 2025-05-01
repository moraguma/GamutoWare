extends Node2D

@export var cookie_scene: PackedScene

# Declaração dos sinais win e lose
signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080


var rng = RandomNumberGenerator.new()
var spawners = []

var spawned = 0
var player_is_dead = false
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	
	register_win()
	rng.randomize()
	spawners = [$"Spawner", $"Spawner2", $"Spawner3", $"Spawner4"]

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


func _on_timer_timeout():
	if player_is_dead:
		return
	var randon_v = rng.randi_range(0, 3)
	var spawner = spawners[randon_v]
	var cookie = cookie_scene.instantiate()
	cookie.position = spawner.position
	add_child(cookie)


func _on_player_dead():
	register_lose()
	player_is_dead = true
