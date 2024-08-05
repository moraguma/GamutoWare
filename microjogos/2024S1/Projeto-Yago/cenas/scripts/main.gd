extends Node2D

@onready var player = $Player

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

# Called when the node enters the scene tree for the first time.
func _ready():
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("BUY!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMPRE!")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func register_win():
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("WIN!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMPRA COMPLETA!")
	emit_signal("win")
	remove_child($Player)

# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("LOSE!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("PERDEU PLAYBOY!")
	emit_signal("lose")
	remove_child($Player)
