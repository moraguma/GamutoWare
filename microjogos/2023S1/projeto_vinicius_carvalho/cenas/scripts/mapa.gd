extends Node2D

var timer
var timer_win
var som
var obstaculo1 = preload("res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/obstaculo_1.tscn")
var obstaculo2 = preload("res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/obstaculo_2.tscn")
var obstaculo3 = preload("res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/obstaculo_3.tscn")
var player_position


func _ready():
	som = $som_cavern
	som.play()
	timer = $Timer
	timer.start(0.5)
	timer_win = $TimersWin
	timer_win.start(6)
	NotificationCenter.notify("Sobreviva!")

	
	
func _physics_process(delta):
	player_position = $CharacterBody2D.position
	$camera.position.x = player_position.x
	
func instanciar_obj():
	var lista = []
	var indice =  randi() % 3
	lista.append(obstaculo1.instantiate())
	lista.append(obstaculo2.instantiate())
	lista.append(obstaculo3.instantiate())
	lista[indice].position = Vector2(0,0)
	
	add_child(lista[indice])


func _on_timer_timeout():
	timer.start(2)
	instanciar_obj()


func _on_timers_win_timeout():
	NotificationCenter.notify("VOCE GANHOU!")
	queue_free()
