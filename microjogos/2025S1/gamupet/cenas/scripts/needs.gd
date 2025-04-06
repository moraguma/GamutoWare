extends Node2D

@onready var background = $"../Background"
var condicoes = [1, 1, 1, 1]
# feliz = condicoes[0]
# fome = condicoes[1]
# sono = condicoes[2]
# limpo = condicoes[3]
var sucessos = 0
var condicao_antiga = 0

func _ready():
	if randi_range(0, 1) == 1:
		condicoes[0] = 0
		condicao_antiga = 0
	else:
		condicoes[1] = 0
		condicao_antiga = 1

func nova_condicao():
	if sucessos < 2:
		print('sucesso, proxima condicao')
		sucessos += 1
		var condicao_nova = randi_range(0, 3)
		while condicao_nova == condicao_antiga or condicao_nova == 2:
			condicao_nova = randi_range(0, 3)
		condicoes[condicao_nova] = 0
	else:
		
		condicoes[2] = 0

func _physics_process(delta):
	$Happy.frame = condicoes[0]
	$Food.frame = condicoes[1]
	$Sleep.frame = condicoes[2]
	$Sujera.frame = condicoes[3]
