extends Node2D


var contagem = 0

func contar():
	contagem += 1
	$Colar.play()
	if contagem >= 3:
		Minigames.register_win(self)

# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
