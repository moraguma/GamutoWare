extends Node2D

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
			NotificationCenter.notify("PRESS SPACEBAR!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("APERTE ESPAÇO!")

	# Conecte o sinal 'gamuto_collided' emitido pelo Gamuto(icon)
	var gamuto = get_parent().get_node("SmallBar")
	gamuto.connect("gamuto_collided", _on_gamuto_collided)
	gamuto.connect("gamuto_not_collided", _on_gamuto_not_collided)

# Esta função é chamada quando o sinal 'gamuto_collided' é emitido pelo Gamuto(icon)
func _on_gamuto_collided():
	# Chame a função para registrar que o jogador venceu o jogo
	register_win()

# Esta função é chamada quando o sinal 'gamuto_not_collided' é emitido pelo Gamuto(icon)
func _on_gamuto_not_collided():
	# Chame a função para registrar que o jogador perdeu o jogo
	register_lose()

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")

# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
