extends Node2D

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9



# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	Minigames.register_win(self)

# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
