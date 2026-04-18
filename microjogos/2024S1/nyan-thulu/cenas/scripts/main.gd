extends Node2D

@export var cookie_scene: PackedScene

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9




var rng = RandomNumberGenerator.new()
var spawners = []

var spawned = 0
var player_is_dead = false
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	
	Minigames.register_win(self)
	rng.randomize()
	spawners = [$"Spawner", $"Spawner2", $"Spawner3", $"Spawner4"]


func _on_timer_timeout():
	if player_is_dead:
		return
	var randon_v = rng.randi_range(0, 3)
	var spawner = spawners[randon_v]
	var cookie = cookie_scene.instantiate()
	cookie.position = spawner.position
	add_child(cookie)


func _on_player_dead():
	Minigames.register_lose(self)
	player_is_dead = true
