extends Node2D

func _ready():
	var escolha = (randi() % 4) +1 
	var cena = load("res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/mapa%d.tscn" % escolha)
	var objeto = cena.instantiate()
	add_child(objeto)
