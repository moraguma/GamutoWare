extends Node2D

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

const SPAWN_POSITIONS = [
	Vector2(0, 0),
	Vector2(96, -592),
	Vector2(520, -8)
]


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	randomize()
	$Prision.play("Prision")
	$Gamuto.play("gamuto")
	$Player.position = SPAWN_POSITIONS[randi() % len(SPAWN_POSITIONS)]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_anything_pressed():
		#
	#else:
		#$Prision.stop()
		#$Gamuto.stop()
	pass
		
func _physics_process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass
