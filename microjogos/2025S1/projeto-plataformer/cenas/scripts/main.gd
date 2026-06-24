extends Node2D

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	$Music.stop()
	$Won.play()
	Minigames.register_win(self)

# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
