extends Node2D

# Declaração dos sinais win e lose
signal win
signal lose

# Importar a biblioteca de áudio
var background_music: AudioStream
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
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FACA ALGO!")
# Carregar a música de fundo
	background_music = preload("res://microjogos/2024S1/gamufit/recursos/Gamuto the powerlifter.mp3")

	# Reproduzir a música de fundo
	var music_player = $AudioStreamPlayer
	music_player.stream = background_music
	music_player.play()

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
