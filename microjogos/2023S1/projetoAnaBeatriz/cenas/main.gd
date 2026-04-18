extends Node2D

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9



const MIN_X = 600.0
const MAX_X = 1320.0
const START_Y = 250
const SEPARACAO = 300


var timer
var total_enemies = 4
var morreu = false

@onready var explosion = $Explosion
@onready var inimigos = [$Inimigo, $Inimigo2, $Inimigo3, $"Nave maior"]


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	
	var y = START_Y
	for inimigo in inimigos:
		inimigo.position = Vector2(randf_range(MIN_X, MAX_X), y)
		y -= SEPARACAO
	
	$Music.play()


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


func morrer():
	morreu = true


# Um método genérico. Crie quantos métodos você precisar!
func delete_enemy():
	explosion.play()
	
	total_enemies -= 1
	
	if total_enemies == 0 and not morreu:
		Minigames.register_win(self) 
